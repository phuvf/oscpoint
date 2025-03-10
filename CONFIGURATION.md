# OSCPoint - Configuration examples

> Note: These examples are based on the assumption that you are running Companion to control OSCPoint - but any tool that can receive/output OSC can be used.

 - For details on how to change these setting in OSCPoint, see the [add-in documentation](add-in.md).
 - For details on how to setup Companion, see the [Companion documentation](https://bitfocus.io/companion/).

## One machine running both Companion and PowerPoint

In this configuration, the both the Companion service and OSCPoint are running on the same machine, and they talk to each other via the localhost network address of `127.0.0.1`

![One machine running both Companion and PowerPoint](./assets/connection_examples/one_machine.png)

## One Companion machine, one PowerPoint machine

In this configuration, the Companion service is running on one machine, and OSCPoint is running on another. The two machines are connected via a network.

![One Companion machine, one PowerPoint machine](./assets/connection_examples/two_machines.png)

## One Companion machine, two PowerPoint machines

In this configuration, the Companion service is running on one machine, and OSCPoint is running on two machines. The machines are connected via a network.

Companion has two OSCPoint connections running. To get feedback from both machines, the feedback port needs to be changed on the second machine.

![One Companion machine, two PowerPoint machines](./assets/connection_examples/three_machines.png)

> [!NOTE]
> Using three or more machines? Just keep adding connections in Companion and make sure each machine is set to a different feedback port.

## One combined Companion & PowerPoint machine, plus one extra PowerPoint machine

In this configuration, one machine is running Companion, OSCPoint and PowerPoint, and another machine is running PowerPoint & OSCPoint. The machines are connected via a network.

![One Companion machine, two PowerPoint machines](./assets/connection_examples/two_machines_b.png)

## Broadcasting feedback to multiple machines

In this configuration, multiple machines on the same network are receiving feedback from OSCPoint, by sending OSC messages to the broadcast address - in this case `192.168.0.255`.

Calculate the broadcast address for your network using the [broadcast address calculator](https://remotemonitoringsystems.ca/broadcast.php).

![Broadcasting feedback to multiple machines](./assets/connection_examples/broadcast.png)