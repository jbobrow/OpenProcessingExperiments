
PImage shark;
PImage bethany;
PFont font;
PImage shark2;

int ballNumber = 300;
float[] xPos = new float[ballNumber];
float[] yPos = new float[ballNumber];
float[] xSpeed = new float[ballNumber];
float[] ySpeed = new float[ballNumber];
int ballSize = 25;

//int sharks = 3;
//float[] xPosShark = new float[sharks];
//float[] yPosShark = new float[sharks];
//float[] xSpeedShark = new float[sharks];
//float[] ySpeedShark = new float[sharks];
//int sharkSize = 25;

//int startX;
//int startY;
//int endX;
//int endY;
//
//boolean dragging = false;


void setup(){
  size (600,600);
  background(0);
  noStroke();
  for(int i=0; i<ballNumber; i++){
  xPos[i] = random(0,width);
  yPos[i] = random(0,height);
  xSpeed[i] = random(-5,5);
  ySpeed[i] = random(-3,7); 
  }
  shark = loadImage("cruising great white from the dark.gif");
  shark.resize(400,400);
  
  bethany = loadImage("Bethany-Hamilton.jpg");
  bethany.resize(100,100);
  
  font = loadFont("DocteurAtomic-48.vlw");
  
  shark2 = loadImage("cruising great white from the dark.gif");
//  shark2.resize(24,24);
  
}

void draw(){
    background(0);
    image(shark,200,200);
    image(bethany,100,100);
    textFont(font,40);
    text("oh, shark week is on, my friend. it is on.", 100,500);
    
    image(bethany,400,100);
    image(bethany,200,150);
    image(bethany,250,100);
    
    if (mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 200){
//      if(mousePressed){
      fill(0);
      rect(100,100,200,200);
//    }
  } 
  if (mouseX > 400 && mouseX < 500 && mouseY > 100 && mouseY < 200){
//      if(mousePressed){
      fill(0);
      rect(400,100,200,200);
//    }
  } 
  if (mouseX > 200 && mouseX < 300 && mouseY > 150 && mouseY < 250){
//      if(mousePressed){
      fill(0);
      rect(200,150,200,200);
//    }
  } 
  if (mouseX > 250 && mouseX < 350 && mouseY > 100 && mouseY < 200){
//      if(mousePressed){
      fill(0);
      rect(250,100,200,200);
//    }
  } 
    
  for(int i=0; i<ballNumber; i++){
    fill(15,0,random(0,255));
    ellipse(xPos[i],yPos[i],random(0,50),random(0,50));
    xPos[i]= xPos[i] + xSpeed[i];
    yPos[i] = yPos[i] + ySpeed[i]*1;
  if(yPos[i]>height-ballSize/2||yPos[i]<ballSize/2){
      ySpeed[i] = ySpeed[i]*-1;
  for(int j=0;j<ballNumber;j++){
        if(i!=j)
          if(dist(xPos[i],yPos[i],xPos[j],yPos[j])<ballSize/2){
                xSpeed[i]=xSpeed[i]*-1;
                ySpeed[i]=ySpeed[i]*-1;
           
          }
}
  }
  }
  cursor(shark2);
}
//  
//  for(int s=0; s<sharks; s++){
//    sharks(xPosShark[s],yPosShark[s],random(0,50),random(0,50));
//    xPosShark[s]= xPosShark[s] + xSpeedShark[s];
//    yPosShark[s] = yPosShark[s] + ySpeedShark[s]*1;
//  if(yPosShark[s]>height-sharkSize/2||yPosShark[s]<sharkSize/2){
//      ySpeedShark[s] = ySpeedShark[s]*-1;
//  for(int j=0;j<sharks;j++){
//        if(i!=j)
//          if(dist(xPosShark[i],yPosShark[i],xPosShark[j],yPosShark[j])<sharkSize/2){
//                xSpeedShark[i]=xSpeedShark[i]*-1;
//                ySpeedShark[i]=ySpeedShark[i]*-1;
//          }
//  }
//  if (mouseX > 100) {
//    cursor(shark2);
//  } else {
//    cursor(ARROW);
//}
//if(mousePressed){
//  image(bethany,100,100);
//
//}
//}
//}

//void mouseDragged(){
//  startX = endX;
//  startY = endY;
//  
//  endX = mouseX-150;
//  endY = mouseY-150;
//  
//  if(!dragging){
//    startX = endX;
//    startY = endY;
//  }
//  dragging = true;
//}
//
//void mouseReleased(){
//  dragging = false;
//}



