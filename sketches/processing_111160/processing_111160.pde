
//Nancy Own - Visual Studios
//Assignment #3 - motions/conditinals  


void setup() {
  // set window size
  size(400,400);
  // styling
  smooth();
}
 int valueX = 10;
 int valueY = 200;
 int sizeX = 10;
 int sizeY = 10;
void draw() {
  //setup custom function
  drawCircle(sizeX,sizeY);
   //randome text sizes
  float name = random(100);
  textSize(name);
  frameRate(8);
  //flashy background
  float bg = random(255);
  background(bg);
 //randomize colors of pink circles
 //drwaing ellipses
  fill (255,34,bg);
//  ellipse (200,200,90,90);
//  ellipse (132,132,120,120);
//  ellipse (80,80,50,50);
//  ellipse (360,360,90,90);
//  ellipse (280,280,150,150);
//  ellipse (275,165,90,90);
//  ellipse (100,200,40,40);
//  ellipse (50,340,170,170);
//  ellipse (165,275,90,90);
//  ellipse (45,220,90,90);
//  ellipse (110,250,65,65);
//  ellipse (185,380,140,140);
  //randomize color of radius changing cirlce
//  fill (bg,0,bg);
  //random radius
 
  //new ellipse 
 // void drawCircle(sizeX, sizeY){
 ellipse (valueX,valueY,sizeX,sizeY);
  //add text to composition
  text("Nancy", 20, 70);
     
  }
  void drawCircle(int sizeX, int sizeY){
 ellipse (valueX,valueY,sizeX,sizeY);
  }
 
void keyPressed() {
  //conditional to make ellipse move when pressing arrows.
  if (valueX <= 400 && keyCode == RIGHT) {
    valueX += 1;
    sizeX++;
  } 
  else if(keyCode == LEFT) {
    valueX -= 1;
    sizeX--;
  } 
  else if(keyCode == UP){
    valueY -= 1;
    sizeY--;
  } 
  else if(keyCode == DOWN){
    valueY += 1;
    sizeY++;
}
} 





