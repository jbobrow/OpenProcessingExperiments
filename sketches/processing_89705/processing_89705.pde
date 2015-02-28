
PImage[] imageArray;
int timer = 0;
int balloonCount = 0;

 
void setup() {
   imageArray = new PImage[10];
   size(640,480);
   background(0);
   imageArray[0] = loadImage("balloon1.JPG");
   imageArray[1] = loadImage("balloon2.jpg");
   imageArray[2] = loadImage("balloon3.jpg");
   imageArray[3] = loadImage("balloon4.jpg");
   imageArray[4] = loadImage("balloon5.jpg");
   imageArray[5] = loadImage("balloon6.jpg");

}

 
void draw() {   

  if(timer > 15 && balloonCount < 99)
  {
    balloonCount++;
    int temp = int(random(50, 200));
  
    image(imageArray[int(random(0,5))],int(random(0,540)),int(random(0,480)), temp,temp);
   timer = 0; 
  }
  if(balloonCount == 99 && timer > 10)
  {
    timer = 0;
    int temp = int(random(50, 200));
  
    
    background(random(0,255),random(0,255),random(0,255));
    image(imageArray[int(random(0,5))],int(random(0,540)),int(random(0,480)), temp,temp);
  }
   timer++;
   
   textAlign(CENTER);
   textSize(64);
   ellipseMode(CENTER);
   fill(0);
   ellipse(width/2,height/2-20,100,100);
   fill(255);
   text(balloonCount,width/2,height/2);
   
}


