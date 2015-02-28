
PImage img, leaf1, leaf2, leaf3, leaf4, leaf5, leaf6, leaf7, leaf8;
float L1x = 600; //The starting sizes of the leaves
float L1y = 800;
float L2x = 800;
float L2y = 400;
float L3x = 800;
float L3y = 400;
float L4x = 600;
float L4y = 800;
float L5x = 400;
float L5y = 600;
float L6x = 400;
float L6y = 800;
float L7x = 400;
float L7y = 800;
float L8x = 400;
float L8y = 300;

void setup() {
  size(400,300);
  img = loadImage("leaves.JPG");
  leaf1 = loadImage("leaf1.gif");
  leaf2 = loadImage("leaf2.gif");
  leaf3 = loadImage("leaf3.gif");
  leaf4 = loadImage("leaf4.gif");
  leaf5 = loadImage("leaf5.gif");
  leaf6 = loadImage("leaf6.gif");
  leaf7 = loadImage("leaf7.gif");
  leaf8 = loadImage("leaf8.gif");
  smooth();
  noStroke();
  frameRate(30);}

void draw() {
  image(img,0,0,400,300);
  pushMatrix();
  translate(-(L1x/2),-(L1y/2)); //Center the leaves as they fall
  image(leaf1,340,105,L1x,L1y);
  L1x -= 12;  //Shrink the leaf size as they fall, in proportion to the original size
  L1y -= 16;
  popMatrix();
  if (L1x < 200){  //Cue the next leaf, load it, begin to shrink it
    pushMatrix();
    translate(-(L2x/2),-(L2y/2));
    image(leaf2,280,95,L2x,L2y); 
    L2x -= 16;
    L2y -= 8;
    popMatrix();
  }
  if (L1x < 45){ //if leaf size hits a certain size, stop it
    L1x = 45;
    L1y = 60;    
  } 
  if (L2x < 350){
    pushMatrix();
    translate(-(L3x/2),-(L3y/2));
    image(leaf3,320,195,L3x,L3y);   
    L3x -= 16;
    L3y -= 8;
    popMatrix();
  }
  if (L2x < 80){
    L2x = 80;
    L2y = 40;
  }
  if (L3x < 250){
   pushMatrix();
   translate(-(L4x/2),-(L4y/2));
   image(leaf4,250,180,L4x,L4y);   
   L4x -= 12;
   L4y -= 16;
   popMatrix();
  }
  if (L3x < 40){
    L3x = 40;
    L3y = 20;
  }
  if (L4x < 350){
   pushMatrix();
   translate(-(L5x/2),-(L5y/2));
   image(leaf5,335,250,L5x,L5y);   
   L5x -= 8;
   L5y -= 12;
   popMatrix();
  }
  if (L4x < 60){
    L4x = 60;
    L4y = 80;
  }
  if (L5x < 100){
    pushMatrix();
    translate(-(L6x/2),-(L6y/2));
    image(leaf6,170,180,L6x,L6y);   
    L6x -= 8;
    L6y -= 16;
    popMatrix();
  }
  if (L5x < 40){
    L5x = 40;
    L5y = 60;    
  }
  if (L6x < 350){
    pushMatrix();
    translate(-(L7x/2),-(L7y/2));
    image(leaf7,95,25,L7x,L7y);   
    L7x -= 8;
    L7y -= 16;
    popMatrix();
  }
  if (L6x < 40){
    L6x = 40;
    L6y = 80;
  }
  if (L7x < 250){
    pushMatrix();
    translate(-(L8x/2),-(L8y/2));
   image(leaf8,250,270,L8x,L8y);   
   L8x -= 16;
   L8y -= 12;
   popMatrix();
  }
  if (L7x < 20){
    L7x = 20;
    L7y = 40;
  }
  if (L8x < 40){
    L8x = 40;
    L8y = 30;
  }
}



