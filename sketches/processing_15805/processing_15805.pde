
//20 bouncing swordshman made into an object in the class of man
//Then adjusted it so they will bounce from the walls and from eachother.
//By pressing the mouse there will be 1 swordsman so you can see if you can follow the 1 original swordsman.


//prepare to create up to 20 swordshman
Man[] swordshman = new Man[20];

//Create the window size and the swordshman
void setup() {
  size(500,500);
  smooth();
  for(int i=0;i<20;i++)
  {

//This will make them spawn randomly and with random speeds
  swordshman[i] =  new Man(int(random(50,width-50)), int(random(50,height-50)), int(random(1,3)),int(random(1,3)), random(0.2,0.5));
  }
}

void draw() {
//Draw the background
  rectMode(CENTER);
  fill(0,102,255);
  stroke(0,102,255);
  rect(250,200,500,400);
  fill(0,255,0);
  stroke(0,255,0);
  rect(250,450,500,100);
  fill(255,255,0);
  stroke(255,255,0);  
  ellipse(180,20,50,50);
  stroke(0);
  for(int i=0; i<20; i++)
  {
//Declare that you want to make something for display, move and collision
  swordshman[i].display();
  swordshman[i].move();
  swordshman[i].collision();
}
}
 
//create the swordshman
class Man {
//variables
  int x_position, y_position, xspeed, yspeed;
  float s;
  
  Man(int tempX, int tempY, int tempXspeed, int tempYspeed, float surface) {
  x_position = tempX;
  y_position = tempY;
  xspeed = tempXspeed;
  yspeed = tempYspeed;
  s = surface;
}

void display() {
//body
  fill(0);
  stroke(0);
  rect(x_position,y_position+30,2,40);
//head
  stroke(0);
  fill(255,153,102);
  ellipse(x_position,y_position,30,30);
//upper leg parts
  stroke(0);
  line(x_position,y_position+50,x_position-10,y_position+60);
  line(x_position,y_position+50,x_position-11,y_position+60);
  line(x_position,y_position+50,x_position+10,y_position+60);
  line(x_position,y_position+50,x_position+11,y_position+60);
  //lower leg parts
  line(x_position+11,y_position+60,x_position+11,y_position+80);
  line(x_position+10,y_position+60,x_position+10,y_position+80);
  line(x_position-11,y_position+60,x_position-11,y_position+80);
  line(x_position-10,y_position+60,x_position-10,y_position+80);
//arms
  fill(0);
  rect(x_position,y_position+20,50,2);
//eyes
  point(x_position-5,y_position-5);
  point(x_position+5,y_position-5);
//mouth
  line(x_position-5,y_position+5,x_position+5,y_position+5);
//sword
  fill(100,100,100);
  stroke(153,153,153);
  triangle(x_position+23,y_position-17,x_position+24,y_position-12,x_position+22,y_position-12);
  rect(x_position+23,y_position+4,2,38);
  line(x_position+20,y_position+17,x_position+26,y_position+17);
//shield
  fill(100,100,100);
  rect(x_position-20,y_position+30,20,40);
//hair
  stroke(255,204,0);
  line(x_position-10,y_position-8,x_position-10,y_position-11);
  line(x_position-8,y_position-9,x_position-8,y_position-12);
  line(x_position-6,y_position-10,x_position-6,y_position-13);
  line(x_position-4,y_position-11,x_position-4,y_position-14);
  line(x_position-2,y_position-12,x_position-2,y_position-15);
  line(x_position,y_position-13,x_position,y_position-16);
  line(x_position+2,y_position-12,x_position+2,y_position-15);
  line(x_position+4,y_position-11,x_position+4,y_position-14);
  line(x_position+6,y_position-10,x_position+6,y_position-13);
  line(x_position+8,y_position-9,x_position+8,y_position-12);
  line(x_position+10,y_position-8,x_position+10,y_position-11);
//shoes
  fill(102,51,0);
  rect(x_position-15,y_position+78,10,5);
  rect(x_position+15,y_position+78,10,5);

//Use the background to display only 1 swordsman  
if (mousePressed){ 
//background
  fill(0,102,255);
  stroke(0,102,255);
  rect(250,200,500,400);
  fill(0,255,0);
  stroke(0,255,0);
  rect(250,450,500,100);
  fill(255,255,0);
  stroke(255,255,0);  
  ellipse(180,20,50,50);
  stroke(0);
//body
  fill(0);
  stroke(0);
  rect(x_position,y_position+30,2,40);
//head
  stroke(0);
  fill(255,153,102);
  ellipse(x_position,y_position,30,30);
//upper leg parts
  stroke(0);
  line(x_position,y_position+50,x_position-10,y_position+60);
  line(x_position,y_position+50,x_position-11,y_position+60);
  line(x_position,y_position+50,x_position+10,y_position+60);
  line(x_position,y_position+50,x_position+11,y_position+60);
  //lower leg parts
  line(x_position+11,y_position+60,x_position+11,y_position+80);
  line(x_position+10,y_position+60,x_position+10,y_position+80);
  line(x_position-11,y_position+60,x_position-11,y_position+80);
  line(x_position-10,y_position+60,x_position-10,y_position+80);
//arms
  fill(0);
  rect(x_position,y_position+20,50,2);
//eyes
  point(x_position-5,y_position-5);
  point(x_position+5,y_position-5);
//mouth
  line(x_position-5,y_position+5,x_position+5,y_position+5);
//sword
  fill(100,100,100);
  stroke(153,153,153);
  triangle(x_position+23,y_position-17,x_position+24,y_position-12,x_position+22,y_position-12);
  rect(x_position+23,y_position+4,2,38);
  line(x_position+20,y_position+17,x_position+26,y_position+17);
//shield
  fill(100,100,100);
  rect(x_position-20,y_position+30,20,40);
//hair
  stroke(255,204,0);
  line(x_position-10,y_position-8,x_position-10,y_position-11);
  line(x_position-8,y_position-9,x_position-8,y_position-12);
  line(x_position-6,y_position-10,x_position-6,y_position-13);
  line(x_position-4,y_position-11,x_position-4,y_position-14);
  line(x_position-2,y_position-12,x_position-2,y_position-15);
  line(x_position,y_position-13,x_position,y_position-16);
  line(x_position+2,y_position-12,x_position+2,y_position-15);
  line(x_position+4,y_position-11,x_position+4,y_position-14);
  line(x_position+6,y_position-10,x_position+6,y_position-13);
  line(x_position+8,y_position-9,x_position+8,y_position-12);
  line(x_position+10,y_position-8,x_position+10,y_position-11);
//shoes
  fill(102,51,0);
  rect(x_position-15,y_position+78,10,5);
  rect(x_position+15,y_position+78,10,5);
}
}
//make the swordshman move
void move() 
{
  x_position += xspeed;
  y_position += yspeed;
//let the swordshman bounce off the walls
  if(x_position > width-20 || x_position <20)
    xspeed=-xspeed;
  if(y_position > width-20 || y_position <20)
    yspeed=-yspeed;
}
  void collision() {
  for(int i = 0; i<20 ; i++)
  {
//Create a virtual unseen area
    Man swordshman2 = swordshman[i];
//Check if the other swordshman is not the same
    if(swordshman2 != this)
    {
//Declare the size of this virtual area
      float totalsize = swordshman2.s*50 + s*50;
      int xdis = abs((swordshman2.x_position+int(50*swordshman2.s))-int(x_position+50*s));
      int ydis = abs((swordshman2.y_position+int(50*swordshman2.s))-int(y_position+50*s));
      if (abs(xdis) < abs(totalsize) && abs(ydis)<abs(totalsize))
      {
//Make it so that the swordshman will not stay overlapped when it happens.
        if (abs(xdis) > abs(ydis))
        {
          xspeed = -xspeed;
          while (abs(xdis)<abs(totalsize))
          {
            if(x_position>swordshman2.x_position)
            {
              x_position++;
              swordshman2.x_position--;
            }
            else
            {
              x_position--;
              swordshman2.x_position++;
            }
            xdis = abs((swordshman2.x_position+int(50*swordshman2.s))-int(x_position+50*s));
          }
        }
        else if(abs(ydis)>abs(xdis))
        {
           yspeed= -yspeed;
           while (abs(ydis)<abs(totalsize))
           {
             if(y_position>swordshman2.y_position)
             {
               y_position++;
               swordshman2.y_position--;
             }
             else
             {
               y_position--;
               swordshman2.y_position++;
             }
             ydis = abs((swordshman2.y_position+int(50*swordshman2.s))-int(y_position+50*s));
           }
        }
//if they both hit eachother let them both bounce off eachother
        else
        {
          xspeed = -xspeed;
          yspeed = -yspeed;
        }
      }
    }
  }
 }
}

