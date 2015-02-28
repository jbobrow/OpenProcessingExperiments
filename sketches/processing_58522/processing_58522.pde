
int x,y,state,rot_count;
float y_speed,x_speed,rrr;
boolean x_down,y_down,dondur;
void setup(){
  size(800,600);
  x=171;
  y=500;
  y_speed=0;
  state=0;
  rot_count=0;
  rrr = random(100);

  
}

void pervane(boolean dondurme,int rot_count)
{
  

    translate(171,550);
    rotate((PI/10.0)*rot_count);
    ellipse(0,0,2,33);
    ellipse(0,0,33,2);
  
}
void draw(){
 background(255,255,255);
 noStroke();
 rectMode(CENTER);
   fill(0);
  rect(round(300+rrr),480,2,60);
  rect(round(300+rrr+50),480,2,60);
   rect(450,150,100,100);
 fill(150);
  rect(400,560,800,100);
 fill(255);
 rect(171,530,35,90);

 
  
  fill(0);
  
  if (mousePressed && (mouseButton == LEFT)) 
  {
    if(state==0)
  {
  y_speed=y_speed-0.5;
  float r = random(30);
  r=r-10;
  if(y<(100+r))
  {
  y_speed=0.3;
  }
  
  state=0;
  dondur=true;
  rot_count++;
  }
  } 

  else
  {
    if(state==1)
   { 
    state=0;
    dondur=false;
   }
  }

   if (mousePressed && (mouseButton == RIGHT))
  {
    x_speed=5;
    state=2;
  }
  
      if(y<500)
  { y_speed=y_speed+0.3;}  //gravity
      if(y>500)
  {  y_speed=0;
      y=500;
  }

  y=y+round(y_speed);
  x=x+round(x_speed);
  
  
 ellipse(x,y,20,20);
 pervane(dondur,rot_count);
 
 if(mousePressed && mouseX < 500 && mouseX >400 && mouseY > 100 && mouseY<200)
{ state=0;
  x=171;
  y=500;
  y_speed=0;
  x_speed=0;
  state=0;
  rrr = random(100);
  rot_count=0;
}

}

