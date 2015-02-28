
/* Title    :flick book animation
   Authors  :Adam Cottis, Michael hawthorne, Forbes Ramsay
   
*/

//Declare vars
float x;
float y;
float xi;
float yi;
int a = 0;
int b = 70;
float z = 0;

PFont font;


void setup()
{
  size(500,200);
  smooth();
  frameRate(25);
  font = loadFont("Aharoni-Bold-48.vlw");
  
}


void draw()
{
  
  background(255);
  strokeWeight(2);
  line(0,175,500,175); // Draw track
  //draw ground
  fill(20,225,50);
  rect(0,175,500,25);
  noFill();
  fill(40,40,240);
  rect(0,0,500,175);
  
  noFill();
  
  noStroke();
  fill(255,247,0);
  ellipse(40,40,30,30);
  noFill();
  
  line(b, 150, xi, yi);
 
  strokeWeight(4);
  line(a+25,150,b-25,150);  //Draw cabin and train
  fill(139,70,0);
  rect(a-50,75,74,75);
  rect(a+20,100,100,50);
  noFill();
   
  //window
  fill(20,20,255);
  rect(a-40,85,50,20);
  noFill();
  rect(a-40,85,17,50);
  fill(20,20,20);
  rect(a+80,50,20,50);
  noFill();
  strokeWeight(1);
  for(int i = 0; i < 80; i++) //sudo smoke :)
  {
    stroke(1);
    point((int)random(a+80,a+100),(int)random(20,50));    
  }  
  noStroke();

  fill(0);
  ellipse(a,150,50,50);  //Draw wheels
  ellipse(b,150,50,50);
  noFill();

  point(a,150);    //Draw hub of wheels
  point(b,150);
  float angle = PI -((z / 0.25) / -114.591); // the long way
  x = a + 15 * cos(angle);
  y = 150 + 15 * sin(angle);
  xi = b + 15 * cos(angle);
  yi = 150 + 15 * sin(angle);
  line(a, 150, x, y);    //draw spoke of wheels
  fill(131,69,5);
  rect(x-2,y-5,75,8);  //things that moves next to wheels
  noFill();
  textFont(font, 20);
  fill(0,0,200);
  text("ScotRail", a+30, 120);
  noFill();
  
  
  //increment vars
  a++;
  b++;
  z++;
  if(a == width+30){
  a=0;
  b=70;
  }
  
  
}               
