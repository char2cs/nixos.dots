{ config, pkgs, ... }:
{
  systemd.services.battery-charge-threshold =
    let
      CHARGE_THRESHOLD = "80";
    in
    {
      enable = true;
      description = "Set the battery charge threshold";
      startLimitBurst = 0;
      after = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        Restart = "on-failure";
        ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/echo ${CHARGE_THRESHOLD} > /sys/class/power_supply/BATT/charge_control_end_threshold'";
        # ...
      };
      wantedBy = [ "multi-user.target" ];
      # ...
    };

  # nvidia
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        #Optional helps save long term battery health
        #START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
        #STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
      };
  };

  # Better scheduling for CPU cycles - thanks System76!!!
  services.system76-scheduler.settings.cfsProfiles.enable = true;

  # Enable powertop
  powerManagement.powertop.enable = true;

  # Disable GNOMEs power management
  services.power-profiles-daemon.enable = false;

  # services.xserver.videoDrivers = [ "nvidia" ];

  # hardware.nvidia = {
  #   prime = {
  #     offload = {
  #       enable = true;
  #       enableOffloadCmd = true;
  #     };
  #     nvidiaBusId = "PCI:3:0:0";
  #     amdgpuBusId = "PCI:5:0:0";
  #   };

  #   modesetting.enable = true;

  #   powerManagement = {
  #     enable = true;
  #     finegrained = true;
  #   };

  #   open = false;
  #   nvidiaSettings = false; # gui app
  #   package = config.boot.kernelPackages.nvidiaPackages.latest;
  # };
}
