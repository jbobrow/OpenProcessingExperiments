
/* 
 ////////////////////////////////////////////////////
 Colectivo MALAB / Sevilla
 www.distopic.es / info@colectivomalab.org
 ////////////////////////////////////////////////////
 Controlar Rótulo LED DISPLAYMATIC por puerto serial
 ////////////////////////////////////////////////////
 */

import processing.serial.*;
Serial myPort;

void setup(){
// List all the available serial ports:
println(Serial.list());

// Open the port you are using at the rate you want:
myPort = new Serial(this, Serial.list()[0], 9600);
}

void draw (){
background (0);
}

void keyReleased () {
if (key=='1'){
myPort.write(0x7E);
myPort.write(0x31);
myPort.write(0x32);
myPort.write(0x38);
myPort.write(0x7E);
myPort.write(0x58);
myPort.write(0x52);
myPort.write(0x30);
myPort.write(0x31); // NUMERO DE PAGINA ESTA ES LA 1
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x0D);
myPort.write(0x0D);
println("1");
}
if (key=='2'){
myPort.write(0x7E);
myPort.write(0x31);
myPort.write(0x32);
myPort.write(0x38);
myPort.write(0x7E);
myPort.write(0x58);
myPort.write(0x52);
myPort.write(0x30);
myPort.write(0x32); // NUMERO DE PAGINA ESTA ES LA 2
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x00);
myPort.write(0x0D);
myPort.write(0x0D);
println("2");
}
}

