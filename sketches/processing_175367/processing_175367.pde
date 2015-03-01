
//This program will generate a Happy New Year Card
//MouseClick for fireworks
//press s for saves
//More about this project at https://opensuny.digication.com/evakristinaekstrom/Merry_Christmas
//add color palette for snow
import ddf.minim.*;
//Declare global variables
Minim minim;
AudioSample bells; 

color[] pallette = {#f60fad, #f6710f, #f6ee0f, #0ff66c, #340be7};

void setup() {
  size(600,800);
  minim = new Minim(this);
  bells = minim.loadSample("bom.wav");
  background(0);
}

//Draw code block (anything goes)
void draw() {
  if (mousePressed) {
      bells.trigger();
      float r1 = random(600);
      float r2 = random(800);
      int i = floor(random(5));
      println(i);
      strokeWeight(23);
      stroke(0x80ffffff);
      point(r1,r2);  
      strokeWeight(1);
      stroke(pallette[floor(random(5))]);
      line(r1-100,r2,r1+100,r2);  
      stroke(pallette[floor(random(5))]);
      line(r1,r2-100,r1,r2+100);  
      stroke(pallette[floor(random(5))]);
      line(r1-70,r2-70,r1+70,r2+70);  
      stroke(pallette[floor(random(5))]);
      line(r1-70,r2+70,r1+70,r2-70);  
    }
  
}

//Create a key trigger
void keyPressed() {
  if ( key == 's' ) println("firework triggered");
  if ( key == 's' )  {
       textSize(36);
       fill(#ff0000);
       text("Happy New Year", 50, 120, 540, 300);
       saveFrame("happyNewYear-###.png"); 
  }
  if ( key == 's' ) println("card saved");
  
}


