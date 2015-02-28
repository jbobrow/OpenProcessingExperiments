
float counter=0;
float i;

void setup()
{
  size(650,650);
  noStroke();
}


void draw()
{  
//Hintergrund Tag=weiß und Nacht=schwarz

  if (hour() <= 6)
{background(0);}
else if (hour() <=18)
{background(255);}
else if (hour() >=19)
{background (0);}

translate(width/2, height/2);

 pushMatrix();
  noStroke();
   float h = map(sin(counter), -1, 10, 60, 360);
   fill(250, h, 40);
  popMatrix();
   
  pushMatrix();
  translate(sin(counter)*10, cos(counter)*10); 
  ellipse(0,0,5,5);
  translate(sin(counter)*30, cos(counter)*30);
  ellipse(0,0,5,5);
   translate(sin(counter)*31, cos(counter)*30);
  ellipse(0,0,5,5);
  translate(sin(counter)*32, cos(counter)*31);
  ellipse(0,0,5,5);
  translate(sin(counter)*33, cos(counter)*32);
  ellipse(0,0,5,5);
  translate(sin(counter)*34, cos(counter)*33);
  ellipse(0,0,5,5);
  translate(sin(counter)*35, cos(counter)*34);
  ellipse(0,0,5,5);
  translate(sin(counter)*36, cos(counter)*35);
  ellipse(0,0,5,5);
  translate(sin(counter)*37, cos(counter)*36);
  ellipse(0,0,5,5);
  translate(sin(counter)*38, cos(counter)*37);
  ellipse(0,0,5,5);
  popMatrix();
   counter -= 0.0018;



pushMatrix();
noFill();
stroke(i);
 ellipse(0,0,20,20);
//ellipse(0,0,80,80);
 ellipse(0,0,140,140);
// ellipse(0,0,200,200);
 ellipse(0,0,260,260);
// ellipse(0,0,320,320);
 ellipse(0,0,380,380);
// ellipse(0,0,440,440);
 ellipse(0,0,500,500);
// ellipse(0,0,560,560);
 ellipse(0,0,620,620);
// ellipse(0,0,680,680);
popMatrix();

//Stunden
float std = map(hour(),0,12,0,360);
pushMatrix();
rotate(radians(std));
translate(0,-60);
fill(i);
ellipse (0,-190,120,120);
popMatrix();


 if (hour() <= 6)
{i=255;}
else if (hour() <=18)
{i=0;}
else if (hour() >=19)
{i=255;}

//Minuten
float min = map(minute(),0,60,0,360);
for(int im=0;im<360;im+=6)
{
pushMatrix();
rotate(radians(min));
translate(0,-100);
fill(i);
ellipse(0,0,60,60);
popMatrix();


//Sekunden

fill(80);
pushMatrix();
noStroke();
float h1 = map(sin(counter), -1, 50, 60, 360);
fill(250, h1, 40);

float x = map(second(),0,59,0,300);
ellipse(x,0,20,20);

float y = map(second(),0,59,0,300);
ellipse(0,y,20,20);
popMatrix();

}
}
