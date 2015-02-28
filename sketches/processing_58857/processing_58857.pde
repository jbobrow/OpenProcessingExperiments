
PImage painting, painting_2, painting_3, paintbrush;
float x,y;
int trailNum = 10;
int prevx[];
int prevy[];
 
void setup(){
  size(800,530);
  noStroke();
  painting = loadImage("pai_3.jpg");
  painting_2 = loadImage("pai_1.jpg");
  painting_3 = loadImage("pai_2.jpg");
  paintbrush = loadImage("paibru.jpg");
  
  prevx = new int [trailNum];
  prevy = new int [trailNum];
  
  
}
 
void draw(){
  image(painting,x,y);
  image(painting_2,x,y);
  image(painting_3,x,y);
  
   for(int i = 1; i < trailNum; i++){
     prevx[i - 1] = prevx[i];
     prevy[i - 1] = prevy[i];
  }
  
  prevx[trailNum - 1] = mouseX;
  prevy[trailNum - 1] = mouseY;
  
  if(mousePressed){
     for(int i = 0; i < trailNum; i ++){
        ellipse(prevx[i],prevy[i],10,10);
     }
   }
  // if this section is selected on this image, then bring the next
  //image forward into that space and continue on 
  //have to create a way to identify layers (classes?) so that they can be 
  //clicked on and used, but seperated
   
}





