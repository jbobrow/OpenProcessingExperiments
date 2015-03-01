
Block[] building = new Block[100];
Circle[] Circle_array = new Circle[200];

void setup() {
  size(700, 500);
  float newYpos = height;
  float newXpos = 10;
  for (int i = 0; i< building.length; i++) {
    building[i] = new Block(newXpos, newYpos);
    newXpos = building[i].widthB + building[i].xposB + random(0, 10);
  }
  for (int i=0; i<Circle_array.length; i++) {
    Circle_array[i] = new Circle(); 
   }
}

void draw() {
  background(133,182,182);
  noStroke();

  
     x+=vx;
   y+=vy;
 
   int j =4;
   for (int i=0; i<Circle_array.length; i++)
   {
   x+=vx;
   y+=vy;
    Circle_array[i].update();
    if (j == 4) {
      fill(125,12,81,80);

           Circle_array[i].display(); 
    } else if ( j == 3) {
      fill(52,51,93,50);
            Circle_array[i].display2();

    } else if ( j == 2) {
      fill(190,63,220,50);
             Circle_array[i].display3();   

    } else {
      fill(76,89,98,50);
              Circle_array[i].display4();
    }
    
    j--;
    if (j <= 0) 
    {
     j = 4;
    }
   }
   
     for (int i = 0; i< building.length; i++) {
    building[i].update();
    fill(255, random(40, 125));
    building[i].build();

  }
}


class Block {
  float widthB;
  float heightB;
  float xposB;
  float yposB;
  float stability = .02;
  float diam;
  
  Block(float xposB, float yposB) {
    this.widthB = random(0, 10);
    this.heightB = random(5, 100);
    this.xposB = xposB;
    this.yposB = yposB;
    diam =  random(15, 20); 
  }
  
  void update() {
    stability = stability * random(.1, 2.5);
  }
  
  void build() {
    pushMatrix();
    fill(255, random(50,125));
    rotate(radians(stability));
    rect(xposB, this.yposB-this.heightB, widthB, heightB);
    popMatrix();
  }
}




class Circle {
  float x,y,vx,vy;
  int direction;
  float speed;
  float diam;
  Circle() {
    speed = random(1,10);
    direction = int(random(0,8)); 
    x = random(0, width);
    y = random(0, height);
    diam = random(15, 60);
 //go up the stage.
 if(direction ==0) {
  vx =0;
  vy = -1;
}
//go to the right and up.
if(direction == 1)
{
  vx = 1;
  vy = -1;
}
//go to the right
if(direction ==2)
{
 vx = 1;
vy = 0; 
}
//go to the lower right..
if(direction ==3)
{
vx =1;
vy=1;
}
//go straight down the stage.
if(direction ==4)
{
vx=0;
vy=1;
}
//go lower left
if(direction ==5)
{
  vx=-1;
  vy=1;
}
//go left.
if(direction ==6)
{
  vx=-1;
  vy=0;
}
//go upper left
if(direction ==7)
{
  vx=-1;
  vy=-1;
}
 
} 
   
void update()
{
  x+=vx*speed;
  y+=vy*speed;
  
  if (y >height)
{
  
  //force the object back to the stage
  y =height;
 //reverse course in vy.
  vy*=-.8; 
}

  if (y <0)
{
  
  //force the object back to the stage
  y =0;
 //reverse course in vy.
  vy*=-.8; 
}
  
  if(x< 0)
  {
    x = 0;
    vx*=-1;
  }
  if(x > width)
  {
    x=width;
    vx*=-1;
  }
}

void display()
{
 pushMatrix();
translate(x,y);
//rotate(radians(random(360)));
ellipse(0, 0, diam, diam);
popMatrix();
}
 
 
void display2()
{
 pushMatrix();
translate(x,y);
ellipse(0, 0, diam, diam);
popMatrix();
}

void display3()
{
 pushMatrix();
translate(x,y);
ellipse(0, 0, diam, diam);
popMatrix();
}

void display4()
{
 pushMatrix();
translate(x,y);
ellipse(0, 0, diam, diam);
popMatrix();
}
 }

int direction;
float x,y,vx,vy;
float xt=random(0,width);
float yt=random(0,height);
float angle =0;

