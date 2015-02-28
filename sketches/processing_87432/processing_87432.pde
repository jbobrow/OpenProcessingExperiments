
//Ji-Young Lee
//jiyoung3@andrew.cmu.edu
//HOMEWORK 5
//Copyrights @JIYOUNG LEE

float x,y,qq,ww;
color col;

void setup()
{
  size (400,400);
  col=color(random(255),random(100),random(255));
  smooth();
  qq=25;
  ww=90;
  frameRate(30);
}

  

void draw()
{
  background(184,210,250);
 
  figure (mouseX,mouseY,qq,qq);
  
  
}

void figure ( float fx, float fy, float qq, float ww)
{
  
  noStroke();
  fill(col);
  ellipse(fx+30,fy,qq+90,qq+10);
  
  noStroke();
  fill(col);
  triangle(fx+80,fy,fx+100,fy-25,fx+100,fy+30);
  
  fill(0);
  ellipse(fx-10,fy-5,qq-30,qq-30);
  
  fill(55,122,227);
  ellipse(fx-40,fy-20,qq-15,qq-15);
  
  fill(55,122,227);
  ellipse(fx-50,fy-40,qq-10,qq-10);
  
  fill(55,122,227);
  ellipse(fx-60,fy-65,qq-5,qq-5);
  

  
  

}

void keyPressed()
{
  
  if (keyCode == ' ') {
    col=color(random(255),random(255),random(255)  );
  }
}


