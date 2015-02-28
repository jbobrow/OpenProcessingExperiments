
//Homework 2: Arthur Siebesian.  
//Animated Drawing with Variables
//January 28, 2014

float c = 0;
float d = 50;

float x = 0; //moving circle
float y = 250; //moving circle

float a = 0;
float b = 450;

void setup() {
  size(500,500);
  smooth();
  strokeWeight(20);
  frameRate(10);
  
}
 
void draw() {
  background(random(0,255),random(0,255),random(0,255));
  strokeWeight(20);
   x = x + 1; //speed of the circle moving
   a = a + 2;
   c = c + 2;
   fill(255,255,255);
  ellipse(100,100,100,random(100));
  ellipse(400,100,100,random(100));
  rect(100, 200,random(100), random(100));
  rect(400, 200,random(100), random(100));
  strokeWeight(5);
  strokeCap(PROJECT);  //Square stroke
  line(0,random(120),499,120);
  line(0,140,499,140);
  line(0,160,499,160);
  line(0,180,499,random(180));
  line(0,200,499,200);
  line(0,220,499,220);
  line(0,random(240),499,240);
  line(0,260,499,260);
  line(0,280,499,280);
  line(0,300,499,300);
  line(0,320,499,random(320));
  line(0,340,499,340);
  line(0,360,499,360);
  line(0,380,499,380);
  line(0,random(400),499,random(400));
  line(0,420,499,420);
  line(0,440,499,440);
  line(0,460,499,random(460));
  line(0,random(480),499,480);
  line(0,100,499,100);
  line(0,80,499,80);
  line(0,60,499,60);
  line(0,40,499,40);
  line(0,20,499,20);
  line(20,0,20,499);
  line(40,0,40,499);
  line(60,0,60,499);
  line(80,0,80,499);
  line(random(100),0,100,499);
  line(120,0,120,499);
  line(140,0,140,499);
  line(160,0,160,499);
  line(180,0,random(180),499);
  line(200,0,200,499);
  line(220,0,220,499);
  line(240,0,240,499);
  line(random(260),0,260,499);
  line(280,0,280,499);
  line(300,0,300,499);
  line(320,0,320,499);
  line(340,0,random(340),499);
  line(360,0,360,499);
  line(380,0,380,499);
  line(400,0,400,499);
  line(random(420),0,420,499);
  line(440,0,440,499);
  line(460,0,460,499);
  line(480,0,random(480),499);
 frameRate(7);
 strokeWeight(20);
 fill(255,255,255);
  ellipse(100,400,100,random(100));
  ellipse(400,400,100,random(100));
  ellipse(mouseX,mouseY,random(50),random(50));  //Circle that moves with mouse 
  ellipse(x,y, 60, 60); //moving ellipse
  rect(a,b,60,60);
  rect(c,d,60,60);
  drawEllipse();
}

void drawEllipse(){ //use mouse to see how all these move
 ellipse(mouseX, 250, 50,50); //moves up!
 ellipse(250, mouseY, 50, 50); //moves down
 ellipse(250,250,mouseX,50); //stretchy!
  
}
