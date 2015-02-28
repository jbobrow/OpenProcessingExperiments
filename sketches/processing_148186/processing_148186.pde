
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
import gifAnimation.*;
Gif nonLoopingGif;
Gif nonLoopingGif2;
boolean pause = false;
 
 
 
   
public void setup() {
  size(1280, 650);//1280x1024
  frameRate(100);
   
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT); 
   
   println("gifdeCeciledit " + Gif.version());
  nonLoopingGif = new Gif(this, "gifdeCeciledit.gif");
  nonLoopingGif2 = new Gif(this, "pause.gif");
  nonLoopingGif.play();
  nonLoopingGif.ignoreRepeat();
  // create the PImage array for the interactive display
}
 
void draw() {
  background(255 ); //cambia el color de fondo
          image(nonLoopingGif, width/2 - nonLoopingGif.width/2, height / 2 - nonLoopingGif.height / 2);
 
 
if (arduino.digitalRead(2) == Arduino.HIGH){ //entrada 2 digital
  nonLoopingGif.play(); // 5v en la entrada acciona GIF
 
//GND lo reinicia
 
 
 
println("GIF");
}
else if(arduino.digitalRead(2) == Arduino.HIGH){
       nonLoopingGif.stop();
        image(nonLoopingGif2, width/2 - nonLoopingGif.width/2, height / 2 - nonLoopingGif.height / 2);
 
       println("pause");}
 
 
 
   
 
 
 
}



