
int X;
int Y=20;
float moX;
float moY;
float outCome;
int Xmove=0;
int in=0;

//hw2 variable and keypressed rotation...

void setup(){
  size(640,480);
  smooth();
  frameRate(100);
  X=0;
}

void draw(){

  noStroke();
  
  if(in<200)
  {
  moY= map(mouseY,0,height,0,150);
  moX= map(mouseX,0,height,0,150);
  outCome= (moX+moY)%151;
  fill(moY,moX,outCome);
  }
  else
  {
  fill(Y);
  }
  
  ellipse(320+Xmove,240,100+X*10,100+X*10);
  fill(255);
  //face
  ellipse(320+Xmove,240,200,200);
  triangle(135+Xmove,90,297+Xmove,153,225+Xmove,63);
  triangle(135+Xmove,90,135+Xmove,153,215+Xmove,81);
  triangle(333+Xmove,153,419+Xmove,63,504+Xmove,90);
  triangle(419+Xmove,63,504+Xmove,90,504+Xmove,153);
  
  
  fill(200,50,50);//red

  
  
  //splash
    if( ((mouseX>220 && mouseX<280) || (mouseX>370 && mouseX<410)) && (mouseY<310 && mouseY>250 )  )
  {
      println(in);
      stroke(0);
      strokeWeight(8);
      line(250+Xmove,220,290+Xmove,240);
      line(250+Xmove,250,290+Xmove,240);
      line(390+Xmove,220,350+Xmove,240);
      line(390+Xmove,250,350+Xmove,240);
      noStroke();
      fill(255,120,120);//pink
      in++;
  }
  else
  {
    //eye
  ellipse(280+Xmove,240,19,55);
  ellipse(360+Xmove,240,19,55);
  fill(255,214,214);//pink
  }
  ellipse(250+Xmove,280,60,60); 
  ellipse(390+Xmove,280,60,60);
  
    fill(200,50,50);//red
  //rib
  triangle(320+Xmove,342,220+Xmove,290,220+Xmove,350);
  triangle(320+Xmove,342,420+Xmove,290,420+Xmove,350);
  ellipse(320+Xmove,342,40,20);
  
  fill(90,50,50);
  ellipse(320+Xmove,280,25,19);//nose
  
  if(in>200)//escape
  {
    Xmove++;
    frameRate(100+Xmove);
  }
  
  
  X++;
  if(X>70)
  {
    Y=Y+20;
    X=0;
  }
  if(Y>255)
  {
    Y=20;
  }
}

void keyPressed(){
  if(key=='s' && key=='S'){
      saveFrame();//don't work
      }
}
