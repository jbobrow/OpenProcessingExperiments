
//I tried replacing square column shapes with an image but 
//am sure im not getting the code quite right somewher or in many 
//places. It wont work!

//image is an array of colors
PImage pacman;

int imgNum = 20;
int imgX[] = new int[imgNum];
int imgY[] = new int[imgNum];
//int imgSize = 35;

//int squareColor[] = new color[50];

int imgX2[] = new int[imgNum];
int imgX3[] = new int[imgNum];
int imgY2[] = new int[imgNum];
int imgY3[] = new int[imgNum];



void setup(){
  size(500,500);
//  stroke(0, 150, 0);
//  strokeWeight(5);
  imageMode(CENTER);
  
  pacman = loadImage("pacman.png");

    for(int i = 0; i < imgNum; i++){
      imgX[i] = width/2;
      imgX2[i] = width/4;
      imgX3[i] = 3*width/4;
      imgY[i] = 25 + 50*i;
      imgY2[i] = 25 + 50*i;
      imgY3[i] = 25 + 50*i;
       }
}
void draw(){
  background(0);
//  fill(0,0,255);
  
  for(int i = 0; i < imgNum; i++){
      if(mouseX > imgX[i] - pacman && mouseX < imgX[i] + pacman){
      if(mouseY > imgY[i] - pacman && mouseY < imgY[i] + pacman){
      if(mousePressed){
        imgX[i] = mouseX;
        imgY[i] = mouseY;
      }
      }
      
   }
     }
     
       for(int i = 0; i < imgNum; i++){
      if(mouseX > imgX2[i] - pacman && mouseX < imgX2[i] + pacman){
      if(mouseY > imgY2[i] - pacman && mouseY < imgY2[i] + pacman){
      if(mousePressed){
        imgX2[i] = mouseX;
        imgY2[i] = mouseY;
      }
      }
      
   }
     }
     
       for(int i = 0; i < imgNum; i++){
      if(mouseX > imgX3[i] - pacman && mouseX < imgX3[i] + img){
      if(mouseY > imgY3[i] - pacman && mouseY < imgY3[i] + img){
      if(mousePressed){
        imgX3[i] = mouseX;
        imgY3[i] = mouseY;
      }
      }
      
   }
     }
  
  // detect which box mouse is in
// draws column of boxes
   for(int i = 0; i < imgNum; i++){
      image(pacman, imgX[i], imgY[i]);
      image(pacman, imgX2[i], imgY2[i]);
      image(pacman, imgX3[i], imgY3[i]);
       }
    
  }
