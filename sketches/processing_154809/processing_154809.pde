
import ddf.minim.*;

Minim minim;
AudioInput input;

void setup () {
  // Sketch einrichten
  size (400, 300);
  frameRate(25);
  noStroke ();
background(0, 0, 0);
  colorMode(HSB);

  minim = new Minim (this);
  input = minim.getLineIn (Minim.STEREO, 512);
}

void draw () {
  rectMode (CENTER);

  // Veränderung und Transparenz des flächenfüllendem REchtecks
  fill (0, 50);
  rect (width/2, height/2, width, height);

  //Größe des Rechtecks abhängig von der Lautstärtke
  float dimension = input.mix.level () *1000    ;

  println(dimension);

  float hue = map(dimension, 0, 100, 0, 255);
if(dimension > 20){fill(29, 190, 206);}
  
  fill (hue, 10, 255);
  if(dimension > 50){
    fill(hue, 50, 206);
   rect(20, 20, 60, 60);
 rect(380, 20, 60, 60);
rect(20, 280, 60, 60);
rect(380, 280, 60, 60);

fill(hue, 20, 150);
rect(80, 20, 60, 60);
fill(hue, 70, 240);
rect(140, 20,60, 60);
 fill(hue, 50, 206);
 rect(200, 20,60, 60);
fill(hue, 70, 240);
rect(260, 20, 60, 60);
fill(hue, 20, 150);
rect(320, 20, 60, 60);
fill(hue, 20, 150);


rect(80, 280, 60, 60);
   fill(hue, 50, 206);
rect(140, 280, 60, 60);
fill(hue, 20, 150);
rect(200, 280, 60, 60);
fill(hue, 70, 240);
rect(260, 280, 60, 60);
fill(hue, 20, 150);
rect(320, 280, 60, 60);
 
 
    fill(hue, 50, 206);
  rect (20, 70, 30, 30);
fill(hue, 20, 150);
rect(80, 70, 30, 30);
fill(hue, 70, 240);
rect(140, 70, 30, 30);
fill(hue, 20, 150);
rect(200, 70, 30, 30);
fill(hue, 50, 206);
rect(260, 70, 30, 30);
fill(hue, 20, 150);
rect(320, 70, 30, 30);
fill(hue, 70, 240);
rect(380, 70, 30, 30);

fill(hue, 20, 150);
rect(20,230 ,30, 30);
fill(hue, 70, 240);
rect(80,230, 30, 30);
fill(hue, 50, 206);
rect(140, 230, 30, 30);
fill(hue, 20, 150);
rect(200, 230, 30, 30);
fill(hue, 70, 240);
rect(320, 230, 30, 30);
fill(hue, 50, 206);
rect(260, 230, 30, 30);
fill(hue, 70, 240);
rect(380, 230, 30, 30);



}

  pushMatrix();
  translate(width/2, height/2);
  rotate(dimension/100);
  rect (0, 0, dimension, dimension); popMatrix();
  
  


}
