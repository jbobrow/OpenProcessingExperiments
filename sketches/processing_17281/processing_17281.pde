
// Based on Code from tinker.it
// https://code.google.com/p/tinkerit/wiki/SerialToDmx

class dmx {

  Serial myPort;

  dmx(Serial port) {
    myPort = port;
  }

  void setChannel(int channel, int value) {
    
    // Die Parameter werden in Text konvertiert: bei 132c45w ist 132 der Kanal und 45 der Wert
    // dann wird der text an den Arduino geschikt
    // Convert the parameters into a message of the form: 123c45w where 123 is the channel and 45 is the value
    // then send to the Arduino
    myPort.write( str(channel) + "c" + str(value) + "w" );
  }
}


