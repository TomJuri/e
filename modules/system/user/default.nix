{ pkgs, config, lib, ... }: {
  services.udev.extraRules = ''
    # Pybrickdev rules for LEGO programmable bricks

    # MINDSTORMS NXT brick 
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0002", MODE="666", TAG+="uaccess"

    # MINDSTORMS NXT brick in firmware update mode (Atmel SAM-BA mode)
    SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="6124", MODE="666", TAG+="uaccess"

    # MINDSTORMS EV3 brick
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0005", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0005", MODE="666", TAG+="uaccess"

    # MINDSTORMS EV3 brick in firmware update mode
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0006", MODE="666", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0006", MODE="666", TAG+="uaccess"

    # SPIKE Prime hub in firmware update mode (DFU mode)
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0008", MODE="666", TAG+="uaccess"

    # SPIKE Prime hub
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0009", MODE="666", TAG+="uaccess"

    # SPIKE Essential hub in firmware update mode (DFU mode)
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="000c", MODE="666", TAG+="uaccess"

    # SPIKE Essential hub
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="000d", MODE="666", TAG+="uaccess"

    # MINDSTORMS Inventor hub
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0010", MODE="666", TAG+="uaccess"

    # MINDSTORMS Inventor hub in firmware update mode (DFU mode)
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0011", MODE="666", TAG+="uaccess"
  '';
  users.users.tom = {
    isNormalUser = true;
    description = "Tom";
    hashedPasswordFile = config.sops.secrets.password.path;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
