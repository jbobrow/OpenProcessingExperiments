
//Hi ^__^, In this work I wanted to create a small paint program, 
//I used the 'keyPressed' which allows the user to choose a color among 5, 
//and I combined 'mousX // mouseY' with 'mousePressed' and 'draw' function to create a drawing effect.
//I used "loadImage" to import this beautiful lady :p , and a sound effect in drawing (a chalkboard sound).
//Finally a screenshot option to save the painting and a command button to start from the beginning ^__^

//Import Library 
import ddf.minim.*;

//------Global variables-----------------
color dark = #000000; color white = #FFFFFF; color red = #FF0000; color green = #079016; color blue = #3A00FF; color yellow = #FFF700;
color[] T = {dark,white,red,green,blue,yellow};
int[] K = {'d','w','r','g','b','y'};
PImage manga;
Minim minim;
AudioSample sounds;

//------Setup----------------------------
void setup() {
  size(800, 600);
  background(white);
  strokeWeight(4);
  smooth();
  stroke(T[0]);
  
  //Load sound
  minim = new Minim(this);
  sounds = minim.loadSample("sound.wav");
  
  //The image to draw 
  manga = loadImage("large.jpg");
  
  //The colors menu 
  int x=250; int y=50;
  for(int i=0; i<6; i++) {
    stroke(T[i]);
    fill(T[i]);
    ellipse(x, y, 20, 20);
    x+=30;
  }
  textSize(15);
  fill(T[0]);
  text("Press 'd'or'w'or'r'or'g'or'b'or'y for yellow' to choose the pen color",200,30);
  
  //Screenshot
  text("#If you finish your drawing the lady press 'S' to save your art ^__^", 200,550); 
  
  //Erase and start again
  text("#Press 'DELETE' to erase and start again", 200,570); 
}

//-----Choose color--------------------
void keyPressed() {
  int i;
  int l;
  for(i=0; i<6; i++) {
    l = K[i];
    if(key == l) {
      stroke(T[i]);
    }
  }
//-------Screenshot-------------------
  if(key == 's' || key == 'S') saveFrame("screenshot.png");
  
//-------Erase and start again--------
  if(key == DELETE) setup();
}

//-----The pen------------------------
void draw() {
  image(manga, 0, 0, 200, 256);
  if (mousePressed == true){
    line(mouseX, mouseY, pmouseX, pmouseY);
    //sounds.trigger(); // I dont realy like the sound so I disabled it :p 
  }
  
}




