

PImage p1,p2,p3,p4,p5,p6;
PImage [] picArray = new PImage [6];

//PImage pic1,pic2,pic3,pic4,pic5,pic6;


void setup() {

  size(900, 900);
//imageMode(CENTER);
p1 = loadImage("1.png");
p2 = loadImage("2.png");
p3 = loadImage("3.png");
p4 = loadImage("4.png");
p5 = loadImage("5.png");
p6 = loadImage("6.png");
picArray[0]=p1;
picArray[1]=p2;
picArray[2]=p3;
picArray[3]=p4;
picArray[4]=p5;
picArray[5]=p6;

background (0);
}
 
void draw(){
  image (picArray[1],0,0);
  image (picArray[2],430,0);
  image (picArray[3],0,340);
  image (picArray[4],430,340);
  image (picArray[5],0,0);
  image (picArray[0],0,0);
}
  
  
void mousePressed() {
    frameRate (2);
    
  PImage img;
  img = loadImage("3.png");
  image(picArray[3], 430, 0);
  img = loadImage("4.png");
  image(picArray[4], 0, 0);
  img = loadImage("2.png");
  image(picArray[2], 430, 340);
  img = loadImage("1.png");
  image(picArray[1], 0, 340);



}




/*

void mousePressed() {
  background (0);
  for (int b=0; b<1000; b++){
    image (picArray[int[random(picArray.length))], random(width), random(height), random (20,150), random( 30,200)
  }}
*/


 


