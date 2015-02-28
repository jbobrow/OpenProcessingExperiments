
// hw05
// copy wright Risa Hiyama

//making a box
float x,y,diam,dy,speed;
float x2,y2,diam2,speed2;
color colorBackground, colorCircleA, colorCircleB;


//setting up. 
void setup(){
size(400,400);
smooth();
//set up for circle 01
diam=30;//diameter of the circle
x=diam/2;//half of diameter to position the circles so it dosent hide 
y=diam/2;//to position the circle so it dosent hide 
speed=4;


//set up for cirlce 02
diam2=70;
x2=width-diam2/2;
y2=height-diam2/2;
speed2=5;

}

void draw(){
prepWindow();
moveFigures();
drawFigure();
colorCircleA = color (100,random(120,130),250);
colorCircleB = color (250,100,random(230,250));
}

void prepWindow(){
colorBackground = color (0,40);
noStroke();
fill(colorBackground);
rect(0,0,width,height);
}

void figure(float x, float y, float diam){
//function (arguments) its giving you the name 
//giving the infomation. arguments of the function tell the leader (which ever ones happens first) what the function needs to know
arc(x,y,diam, diam,0.52,5.76);
}

void drawFigure(){
strokeWeight(2);
noStroke();
fill(colorCircleA);
figure(x,y,diam);
//this is the actual value 
fill(colorCircleB);
figure(x2,y2,diam2);
//this is the actual value 
}

void moveFigures(){
  //movement of CircleA
  x += speed; //this is where it actually moving
  if (x > width-diam/2)
  {
  y += speed;
  x = width-diam/2; 
   }
   if (y > height-diam/2)
  {
  x += speed;
  speed = -speed;
  y = height - diam/2;
  }
  if (x<diam/2)
  {
  x = diam/2;
  y += speed;
  } 
  if (y<diam/2)
  {
  y = 0+diam/2;
  x += speed;
  speed = -speed; 
  } 

  //movement of CircleB
  x2 += speed2;
  if (x2 > width-diam2/2)
  {
  y2 += speed2;
  x2 = width-diam2/2; 
   }
   if (y2 > height-diam2/2)
  {
  x2 += speed2;
  speed2 = -speed2;
  y2 = height - diam2/2;
  }
  if (x2<diam2/2)
  {
  x2 = diam2/2;
  y2 += speed2;
  } 
  if (y2<diam2/2)
  {
  y2 = diam2/2;
  x2 += speed2;
  speed2 = -speed2; 
  } 
}




