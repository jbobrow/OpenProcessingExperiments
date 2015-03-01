
//Assignment 4b: Write a function with two parameters that does something that is visually compelling. 2pts
 float x = 300;
 float y = 350;
float z = 300;
float a = 350; 
float speed = 0;
void setup()
{
 size(720, 600);
  
}

void draw() {
  background(0);
  frameRate(30);
 
  noFill();
  stroke(255);
  triangle();
  explosion();
  moon(200,200);
  stars();
  
}

void triangle(){
  triangle(x, y, x+100, y, x+50, y-100);

  
  for(int i = 10; i<60; i+=3)
  {
    noStroke();
    fill(0,255,255);
  rect(a-(i*10)+30,(z+i),10,10);
   fill(150,255,255);
  rect(a-(i*10)+40,(z+i)-15,10,10);
   fill(100,255,255);
  rect(a-(i*10)+50,(z+i)-30,10,10);
   fill(50,255,255);
   rect(a-(i*10)+60,(z+i)-45,10,10);
    fill(200,255,255);
   rect(a-(i*10)+70,(z+i)-60,10,10);
  }
  z = z+speed;
  y = y+speed;
  if(y > 320)
  {
    speed-=1;
  }
  else
  {
    speed+=1;
  }
}
void stars(){
  
  
  float starx = random(720);
  float stary = random(600);
  fill(255);
  ellipse(starx,stary,5,5);
 // for(i = 0; i<400; i+=10){
 
  
  }
  
  void explosion()
  {
    pushMatrix();
    colorMode(HSB);
    if(mousePressed)
    {
      fill(random(255),255,255);
      ellipse(mouseX,mouseY,40,40);
    }
    popMatrix();
  }
 void moon(float moonWidth, float moonHeight)
 {
  stroke(5);
  ellipse(width-moonWidth, 100,moonWidth,moonHeight); 
  ellipse(width-moonWidth, 100,moonWidth/3,moonHeight/3); 
 }






