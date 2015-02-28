
int c_num = 4;

Clouds[] cloud=new Clouds[c_num]; 

Bombs bomb1;

Splashb splashb;

Stickmen stickman1;
Stickmen stickman2;

// loads bomb and cloud image
PShape b;
PImage cloudimage;

// globally defined position stickman

float x_stick;
// float y_stick;  (immer gleich, noch nicht nötig)

float x_bomb;
float y_bomb;


void setup() {
  
  size(800,600);
  smooth();

for (int i=0; i<c_num; i++)
  {
    cloud[i] = new Clouds();
  }

  splashb= new Splashb();

  b = loadShape("bomb.svg");

  cloudimage = loadImage("cloud.gif");
 
  
  stickman1 = new Stickmen((int)random(200,300),255,1);
  stickman2 = new Stickmen((int)random(500,700),255,1);

 bomb1 = new Bombs();
  
}

void draw() {
  background(200);

  // creating the horizon
  fill(120);
  noStroke();
  rect(0,height*0.75,width,height*0.25);
  noFill();
  
  for(int i=0; i<c_num; i++)
  {
    cloud[i].display(); 
    cloud[i].move(); 

 }

  
splashb.display();

  bomb1.move();
  bomb1.display();

  stickman1.move();
  stickman1.display();
  //stickman2.move();
  stickman2.display();



}

class Clouds {
  float xpos = random(width);
  float xspeed;
  float ypos = random(40,200);
  
Clouds() {
  xspeed = random(0.2,0.9);
  }

void move() {
  xpos += xspeed;

  // resetting cloud to left corner
  if (xpos >= width) {
    xpos = -100;
  }
}

void display() {
image(cloudimage,xpos,ypos,120,107);
}
}

class Stickmen
{
  float s; //size
  float x; //position
  float y = 500; //position
  color c; //color
  float vx=1;
  float vy;
  float g = 0.03;
  float f = -0.9;



Stickmen(int x_temp, color c_temp, float s_temp)
{
  x=x_temp;
  c=c_temp;
  s=s_temp;
  y= height - (height*1/4*s);
 

}

void move() {
  x += vx;
  x_stick = x;
}

void display()
{

  fill (255);
  
  strokeWeight(4*s);
  
  stroke(c);
  
 
  
  //body
  line(x, y, x, y+(80*s));  
  
  //head
  ellipse(x, y, 40*s, 40*s);
  
  
  //leftarm
  line(x, y+(40*s), x-(30*s), y+(60*s));
  
  //rightarm
  line(x, y+(40*s), x+(30*s), y+(25*s));
  
  //leftleg
  line(x, y+(80*s), x-30*s, y+(110*s));
  
  //rightleg
  line(x, y+(80*s), x+30*s, y+(110*s));
  
  fill (0);
  
  strokeWeight(1*s);
  
  //eyes
  if (vx > 0) //eyes right
  {
   ellipse (x, y-(3*s), 5*s, 5*s);
   ellipse (x+(10*s), y-(3*s), 5*s, 5*s);
  }
  else //eyes left
  {
   ellipse (x, y-(3*s), 5*s, 5*s);
   ellipse (x-(10*s), y-(3*s), 5*s, 5*s);
  }
}
}


class Bombs {
  float angle = PI/3;
  float r;
  float xspeed, yspeed;
  float x;
  float y = height*0.75;
 
  // variables for the parabola
  float speed = 5;  
  float gravity = 0.1;  
  float accel = 0.95;
 
  // maybe useless :D
  int c;
 
  Bombs() {
  x = x_stick;
    
  // calculating the parabola (to be improved)
  xspeed = speed * cos(angle);
  yspeed = speed * sin(angle);
  }
 
  void move() {
  	
  x += xspeed;
  yspeed += gravity;
  y += yspeed;
    


  x_bomb = x;
  y_bomb = y;

  }
 
 
  // draw the bomb
  void display() {
	shape(b,x,y,20,30);
  }
}



class Splashb {
   color c;//muss dem Ball angepasst werden, daher grundfarbe egal
   float s, x, y, speed; //x&ypos hängt davon ab, wo unser boden ist und wo der Ball einschlägt
   
   Splashb() {
  c= color(200,20,20);
  x=100;
  y=100; //beispiele
  speed= random(1,2);
  s= (speed*100);



   }
   
 void display() {
   fill(c);
   stroke(c);
   ellipse(x ,y, s, s/2.5);
   ellipse(x/2, y-s/10, s/2, s/5);
   ellipse(x/2, y+s/10, s/1.2, s/4);
   ellipse(x*1.5, y+s/20, s/1.4, s/5);
   ellipse(x*1.5, y-s/20, s/3, s/5);
   }
}





