
//After open a blank canvas, try to click you mouse, and see what would happen.
//Click  "B" or "b" in your keyboard to change the background color
//Click  "Delete" or "Backspace" in your keyboard to start over
//Click  "S" or "s"  in your keyboard to make a screenshot of your work
// In this piece, I was trying to make a feeling of a splash in a strong set of color. Enjoy it :)

//global variables
color[] Noise = {#FFFFE2,#CFDCD3, #8CB9B2,#27777E, #1B573D};
color[] palette = Noise;
//float counter =0;
//working with images

PImage television;

//setup
void setup(){
  size(600,800);
 //background(palette[0]);
   television=loadImage("television.JPG");
}

//draw
void draw(){
     image(television, 0 ,0);
     
//Mouse input
if(mousePressed){
   stroke(palette[int(random(0, 5))]);
   strokeWeight(int(random(1, 2)));
   float x = random(70,520);  
   float y = random(70,720);
   float d = random(1,10);
   ellipse(x, y, d, d);
   //counter ++;
 }
}


//keyboard input
//Screenshot Saving
void keyReleased(){
  if(key=='s' || key=='S') saveFrame("######.png");
  }


