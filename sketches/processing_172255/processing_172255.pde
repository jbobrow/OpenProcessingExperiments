
int num_stripes = 5;
float radius = 100;
float bearing,angle;
PVector heading = new PVector(0,-1);
PVector pos;

void setup()
{
 size(600,600);
 bearing = 0;
 angle =0;
 strokeWeight(2);
 strokeCap(SQUARE);
 smooth();
  pos = new PVector(width/2,height/2);
 background(255); 
ellipseMode(CENTER);
 rectMode(CENTER);
}
void draw()
{
  heading.y=sin(radians(angle));
   heading.x=cos(radians(angle));
   if(frameCount %90 ==0)
   make_a_choice();
   
   if(bearing > angle)
   angle+=1;
   if(bearing < angle)
   angle-=1;
   
 stroke(0);
  fill(0);
  pos.add(heading);
  if(pos.x > width+50)
  pos.x = -50;
  if(pos.x < -50)
  pos.x = width+50;
  if(pos.y > height+50)
  pos.y = -50;
  if(pos.y < -50)
  pos.y = height+50;
  pushMatrix();
  translate(pos.x,pos.y);
 float r = atan2(heading.y,heading.x);
 rotate(r);
 float sw = 5;
 int stripes =10;
 stroke(111,177,211);
 line(0,stripes*sw);
 line(0,-stripes*sw);
 for(int i = 0; i < stripes;i++)
 {
  noStroke();
   //stroke(0);
   fill(0);
   pushMatrix();
   translate(0,i*sw);
   ellipse(0,0,3,3);
   translate(0,i*-sw*2);
   ellipse(0,0,2,2);
   popMatrix();
    if(i==stripes-1)
    {
   fill(229,126,0);
 
   pushMatrix();
   translate(0,i*sw);
   ellipse(0,0,6,6);
   translate(0,i*-sw*2);
  noStroke();
   fill(255);
   ellipse(0,0,5,5);
   popMatrix();
   }
 
 }
  popMatrix();


  
}
void make_a_choice()
{
 int choice = int(random(3));
   switch(choice)
   {
     case 0:
       break;
       case 1:
       left();
       break;
       case 2:
       right();
       break;
   }
  
}

void left()
{
  bearing-=90;

   //wrap_vector();
}

void right()
{
  bearing+=90;

// wrap_vector(); 
}
