
int X;
int Y;

//hw2 variable and keypressed rotation...

void setup(){
  size(640,480);
  smooth();
  X=0;
  Y=20;
}

void draw(){

  noStroke();
  fill(Y);
  ellipse(320,240,100+X*10,100+X*10);
  
  fill(255);
  ellipse(320,240,200,200);
  triangle(135,90,297,153,225,63);
  triangle(135,90,135,153,215,81);
  triangle(333,153,419,63,504,90);
  triangle(419,63,504,90,504,153);
  fill(255,214,214);
  ellipse(250,280,60,60); 
  ellipse(390,280,60,60);
  fill(200,50,50);
  triangle(320,342,220,290,220,350);
  triangle(320,342,420,290,420,350);
  ellipse(320,342,40,20);
  ellipse(280,240,19,55);
  ellipse(360,240,19,55);
  fill(90,50,50);
  ellipse(320,280,25,19);
  
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
