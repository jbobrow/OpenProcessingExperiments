
//Import minim library
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.spi.*;


//Declare PImage variable type
PImage relax1;
PImage stress1;


//Declare global variables
Minim minim;
AudioSample relax;
AudioSample stress;

void setup() {
  size(800,600);

  minim = new Minim(this);
  stress = minim.loadSample("traffic.mp3");
  relax = minim.loadSample("waves.mp3");
  println("Press ‘r’ for relaxing sound & image");
  println("Press ‘s’ for stressful sound & image");

}
//Draw the image to the screen at (0,0)
void draw() {
//background (0);
  if (keyPressed ==true) {
  if (key == 'r' || key == 'R') 
  {
    int fragNumberRelax = int(random(0,9)); 
    relax1 = loadImage("relax_" + fragNumberRelax + ".jpg"); 
    image(relax1, 0, 0); 
  }
  if (key== 's' || key == 'S')
  {  
     int fragNumberStress = int(random(0,9)); 
     stress1 = loadImage("stress_" + fragNumberStress + ".jpg");
    image(stress1, 0, 0); 
  } 
  }
}

void keyPressed() {

  if (key == '1') 
  {relax.trigger(); 
  }
  if (key == 's' || key == 'S') 
  {stress.trigger(); 
  relax.stop();
  }
   if (key == 'r' || key == 'R') 
  {relax.trigger(); 
  stress.stop();
  }
  if (key == '0') saveFrame("screenshot.png");
}

