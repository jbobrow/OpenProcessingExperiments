
//DIGI bRUSH
//created by Deepak Chandran
//for Coursera - Creative Programming for Digital Media & Mobile Apps

PImage intImg;  //declaring variables
PImage cont;
PImage chImg;
PImage choice1;
PImage choice2;
PImage choice3;
boolean intro = true;
boolean prgrm = false;
int i = 0;
int ch = 0;
int choice = 0;
float red, green, blue, speed, alpha, lineWidth;

void setup()
{
  smooth();
  size(500,500);
  noStroke();
  background(200);
  intImg = loadImage("intro2.png");
  cont = loadImage("enter.png");
  chImg = loadImage("ch1.png");
  choice1 = loadImage("boxes.png");
  choice2 = loadImage("circles.png");
  choice3 = loadImage("Psychadelia.png");
  imageMode(CENTER);
  rectMode(CENTER);
}

int j = 500;

void draw()
{
  if (choice==0)
  {
    if (intro)
    { 
      introAnim();  //contains code for intro animation
    }
    else
    {
      choose();
    }
  }

  
}

void introAnim()
{
      fill(36,255-int(i/2));
      ellipse(i,(height/2)*(1+0.5*cos(i)),i/4,i/4);
      i++;
      fill(255-36,int(255*j/width));
      ellipse(j,(height/2)*(1+0.5*cos(j)),(width-j)/4,(width-j)/4);
      j--;
     
     if(i>width/2)
    {
     tint(255,i-150);
     image(intImg, width/2, 50);
    }
      if(int(i/2)==255)
      {
         intro = true;
         
      } 
      if(i==width-30)
      {
       
        image(cont,width/2,height-40);
      }
     
}

void choose()
{
  prgrm = true;
  if(ch<3)
  {
    image(chImg, width/2, 50);
  
  }
  
  noStroke();
  
  if(mouseX>30&&mouseX<width-30&&mouseY>140&&mouseY<220){  //roll-over animation
    fill(220);
  }
  else{
    fill(100);
  }
  
  rect(width/2, 180,width-60,80);
  image(choice2, width/2, 180);
  
  if(mouseX>30&&mouseX<width-30&&mouseY>260&&mouseY<340){
    fill(220);
  }
  else{
    fill(100);
  }
  
  rect(width/2, 300,width-60,80);
  image(choice1, width/2, 300);
  
  if(mouseX>30&&mouseX<width-30&&mouseY>360&&mouseY<440){
    fill(220);
  }
  else{
    fill(100);
  }
  
  rect(width/2, 400,width-60,80);
  image(choice3, width/2, 400);
 
   ch++;

}  

void mouseDragged()
{
  if(prgrm)
  {
     red = map(mouseX, 0, width, 0, 255);
      blue = map(mouseY, 0, width, 0, 255);
      green = dist(mouseX,mouseY,width/2,height/2);
      
      speed = dist(pmouseX, pmouseY, mouseX, mouseY);
      alpha = map(speed, 0, 20, 0, 10);
      lineWidth = constrain(lineWidth, 0, 10);
      
      noStroke();
       fill(0, alpha);
       rect(width/2, height/2, width, height);
    
      stroke(red, green, blue, 255);
      strokeWeight(lineWidth);  
      fill(red, green, blue, 255);
      if (choice==1)
      {
     
       Circles(mouseX, mouseY,speed, speed,lineWidth);
    
        
      }
      
      if (choice==2)
      {
         
       Boxes(mouseX, mouseY,speed, speed,lineWidth);
        
      }
      
      if (choice==3)
      {
       psychadelia(mouseX, mouseY,speed, speed,lineWidth);
      
      } 
  }
}

void mouseClicked()
{
  if (prgrm)
  {
    if(choice == 0)
    {
      background(200);
      if(mouseX>30&&mouseX<width-30&&mouseY>140&&mouseY<220){
        choice = 1;
      }
      if(mouseX>30&&mouseX<width-30&&mouseY>260&&mouseY<340){
        choice = 2;
      }
      if(mouseX>30&&mouseX<width-30&&mouseY>360&&mouseY<440){
        choice = 3;
      }
    }
  }
}

void keyPressed()
{
  if(key==ENTER)
  {
     if(i>=30)
     {
        intro = false;
        background(240);
        
     }
  }
  if(key=='r')
 {                  //Re-initialize variables when program is reset
   i=0;
   j=500;
   ch=0;
   choice=0;
   prgrm=false;
   background(200);
   intro = true;
   introAnim();
 }
}


void Circles(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  ellipse(x,y,px,py); 
  
  return;
}


void Boxes(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  rect(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}


void psychadelia(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  px=px+random(50);
  py=py+random(50);
  ellipse(x,y,px,py);
  ellipse(width/2+((width/2)-x),y,px,py);
  ellipse(x,height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-x),height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-y),width/2-((width/2)-x),px,py);
  ellipse(height/2-((height/2)-y),width/2-((width/2)-x),px,py);
  ellipse(width/2+((width/2)-y),height/2+((height/2)-x),px,py);
  ellipse(width/2-((width/2)-y),height/2+((height/2)-x),px,py);  
  return;
}



