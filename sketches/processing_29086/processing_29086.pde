
float angle;
int no=20;

float side1 =350;
float d = 15;
int c=1;
int flag=0;
float s=0;
float m;
float incr = 0.002; //speed of rotation

void setup()
{
  size(700, 700);
  smooth();
  noStroke();
  rectMode(CENTER);
}

void draw()
{
  background(0);
  translate(width/2, height/2); //translates to the centre 

  angle += incr;

  //to make the colors progress from blue to yellow and then back 
  if(flag==0)
    c++;

  if(c==510)
    flag=1;

  if(flag==1)
    c--;

  if(c==0)
    flag=0;

  println(c);


  for(int j = 0; j < no; j++) 
  {
    stroke(s,s-255,255-s,50);
    fill(c,c-255,255-c,50+j); 
    
    rotate(angle); //makes each rectangle rotate
    rect(0,0, side1 - j * d, side1- j * d);
  }

  s=c+10;
  //delay(200);
}



