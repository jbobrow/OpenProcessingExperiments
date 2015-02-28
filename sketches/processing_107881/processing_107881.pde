
PFont font;
PImage img;
int count=0;
 
import ddf.minim.*;
float vol; // vol =  line in volumen
float vol_eased; // Volumen with easing effect
float vol_reduced; // Volumen on each 10 frames
float vol_target;
float easing = 0.05;
 
int c; // count
 
Minim minim;
AudioInput in;
 
void setup() {
  size(1200, 903);
  smooth();

   img = loadImage("aa.png");
  font = loadFont("Helvetica-Bold-200.vlw");
 
  minim = new Minim(this);
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);

 
 
}
 
 
void draw () {

 
  stroke(0);
  pushMatrix();
  translate(4000, 4000);
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, 340 + in.left.get(i)*1000, i+1, 340 + in.left.get(i+1)*1000);
    vol = in.left.get(i)*6000;
  }
  popMatrix();
 
  if (vol > 1) {
    vol_target = vol;
  }
 
  // get vol eased
  vol_reduced = vol_target;
  float vol_difference = vol_target - vol_eased;
  if (abs(vol_difference) > 1) {
    vol_eased += vol_difference * easing;
  }
 

  textFont(font, random(5,20));
  fill(#c0d04f,  vol_eased *.08);
  text("AMISTAD", random(width),random(height));

   textFont(font, random(5,20));
  fill(#c0d04f);
  text("RESPETO", random(width),random(height));
  
  textFont(font, random(5,20));
  fill(#c0d04f);
  text("JUSTICIA", random(width),random(height));
  
   textFont(font, random(5,20));
  fill(#c0d04f, random (10,20));
  text("SOLIDARIDAD", random(width),random(height));
  
  textFont(font, random(5,20));
  fill(#c0d04f, random (10,20));
  text("TOLERANCIA", random(width),random(height));
  
  textFont(font, random(5,20));
  fill(#c0d04f, random (10,20));
  text("HONESTIDAD", random(width),random(height));
  
   textFont(font, random(5,20));
  fill(#c0d04f, random (10,20));
  text("INCLUYENTE", random(width),random(height));
  
   textFont(font, random(5,20));
  fill(#c0d04f, random (10,20));
  text("COOPERACIÓN", random(width),random(height));
  
   textFont(font, random(5,20));
  fill(#c0d04f, random (10,20));
  text("RESPONSABILIDAD", random(width),random(height));
  
  textFont(font, random(5,20));
  fill(#c0d04f, random (10,20));
  text("VOLUNTAD", random(width),random(height));
  
  textFont(font, random(5,20));
  fill(#c0d04f, random (10,20));
  text("EMPATÍA", random(width),random(height));
  
   textFont(font, random(5,20));
  fill(#c0d04f, random (10,20));
  text("COMPROMISO", random(width),random(height));
  
  
  
  
  
  
  textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("AMISTAD", random(width),random(height));

    textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("RESPETO", random(width),random(height));
  
   textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("JUSTICIA", random(width),random(height));
  
    textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("SOLIDARIDAD", random(width),random(height));
  
  textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("TOLERANCIA", random(width),random(height));
  
  textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("HONESTIDAD", random(width),random(height));
  
    textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("INCLUYENTE", random(width),random(height));
  
 textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("COOPERACIÓN", random(width),random(height));
  
  textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("RESPONSABILIDAD", random(width),random(height));
  
  textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("VOLUNTAD", random(width),random(height));
  
 textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("EMPATÍA", random(width),random(height));
  
 textFont(font, random(5,20));
  fill(#d43039, random (10,20));
  text("COMPROMISO", random(width),random(height));
  
  
  
   image (img, 0,0);


}
 
 
// Hit 'r' to record a single frame
void keyPressed() {
  if (key == 'r') {
    saveFrame("sample_#####.png");
  }
}
 
// always close Minim audio classes when you are done with them
void stop()
{
  in.close();
  minim.stop();
 
  super.stop();
}
 
 
//The Museum of Modern Art
