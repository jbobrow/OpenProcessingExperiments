
import ddf.minim.*;

Minim minim;
AudioPlayer player;
import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

float newValue = 0;
int newValue2 = 0;
color off = color(4, 79, 111);
color on = color(84, 145, 158);

void setup() {
  size(470, 280);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.OUTPUT);
    
    minim = new Minim(this);
     player = minim.loadFile("beep-7.mp3", 2048);
}

void draw() {
  background(off);
  stroke(on);
  

fill(255);
rect(arduino.analogRead(3)/4, arduino.analogRead(5)/4, 50, 50);

newValue = map(arduino.analogRead(0), 0, 1023, 0, 200);
newValue2 = int(newValue);
/*
arduino.digitalWrite(8, Arduino.HIGH);
delay(newValue2);
arduino.digitalWrite(8, Arduino.LOW);
delay(newValue2);*/

println(newValue2);

if(newValue2 > 190){
  
}
else if(191 > newValue2 && newValue2 > 130){
  player.play();
  delay(1000);
  player.pause();
}
else if(131 > newValue2 && newValue2 > 70){
   player.play();
  delay(1000);
  player.pause();
  delay(1000);
    player.play();
  delay(1000);
  player.pause();
}
else if(71 > newValue2){
  player.play();
  delay(1000);
  player.pause();
  delay(1000);
    player.play();
  delay(1000);
  player.pause();
   delay(1000);
    player.play();
  delay(1000);
  player.pause();
}

}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  
  super.stop();
}

