
Bird[] myBird = new Bird[22];
//int n;
int xpos;
int ypos;
int xspeed;
int yspeed;


void setup(){
  size(800,600);
  for(int i=0; i<22; i++){
  myBird[i] = new Bird();
  }
}

class Bird{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float size;


Bird(){
  xpos=random(50,300-50);
  ypos=random(50,300-50);
  size=1;
  xspeed=random(1,5);
  yspeed=random(1,5);
}


void draw_bird(){
  //snavel
  fill(242, 102, 7);
  triangle(xpos-65*size, ypos-25*size, xpos-50*size, ypos-19*size, xpos-50*size, ypos-30*size);


  // body 
  fill(random(220,255), random(100,200), random(100,255));
  ellipse(xpos*size, ypos*size, 70*size, 70*size); 
  ellipse(xpos-30*size, ypos-30*size, 50*size, 50*size);
  fill(255);
  ellipse(xpos-37*size, ypos-35*size, 15*size, 15*size);
  fill(0);
  ellipse(xpos-38*size, ypos-35*size, 7*size,7*size);

  //wing
  fill(255, 255, 137);
  ellipse(xpos+12*size, ypos+7*size, 30*size, 10*size);
  
   //legs
  line(xpos-10*size,ypos+33*size,xpos-10*size,ypos+50*size); 
  line(xpos+10*size,ypos+33*size,xpos+10*size,ypos+50*size); 
  //feet
  line(xpos-15*size,ypos+50*size,xpos-5*size,ypos+50*size);
  line(xpos+5*size,ypos+50*size,xpos+15*size,ypos+50*size);

}
  
void move_bird(){
  xpos = xpos + xspeed;
  ypos = ypos + yspeed;

if (xpos>=width-30*size) xspeed = xspeed*-1;
if (ypos>=height-50*size) yspeed = yspeed*-1;
if (xpos<=+60*size) xspeed = xspeed*-1;
if (ypos<=50*size) yspeed = yspeed*-1;

}
};


void draw () {
background(255);
for (int n=0;n<22;n++){
myBird[n].draw_bird();
myBird[n].move_bird();}
}
  

