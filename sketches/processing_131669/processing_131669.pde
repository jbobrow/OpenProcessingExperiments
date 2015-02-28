
//Nicolette Hashey
//House
//1/22/2014

clouds c,c1,c2,c3,c4;

int w=250;
int h=250;
int triwidth=120;
int triheight= 110;
int cwidth=16;
int cheight=110;
int scolwidth=12;
int scolheight=60;
int bottom=370;
int addupleftx=100;
int adduplefty=280;
int addlefth=90;
int addleftcenterx=157;
int addtopwindowy=242;
float x = 0;
boolean night=true;
color bday=color(35,255,239);
color b=#99FFCC;
float hour=0;
int radius = 14;
//int sunradius=
int clockx=280;
int clocky=230;
float nighta;

// Sun Variables
int sunRadius = 40;      // size of the sun
int xStart = -sunRadius; // The initial x position
int yStart = 20;         // The initial y position
float xSun = xStart;     // the x position of the sun
float ySun = yStart;     // the y position of the sun

// Arc variables
float t = 0;   // Start time
float duration = 60 * 1000; // Complete a full circle every 60 seconds
float conversionFactor = 10 * 3.14 / duration; // A full circle (2*pi) occurs every duration milliseconds



void setup() {
  size(500, 500);
  c = new clouds();
  c1 = new clouds();
  c2 = new clouds();
  c3 = new clouds();
  c4 = new clouds();
}

void draw() {
  nighta= map(ySun,0,500,0,255);
  color bnight=color(0,32,88,nighta); 
  background(bday);
    fill(bnight);
    rect(0,0,width,height);
  
  if(x>500){
    x=0;
  }
  //this is supposed to change the background color each time the sun reaches the right side of the window
    //if(night=false){
      //x=0;
      //b=bday;
      //night=true;
    //}
    //if(night=true){
      //x=0;
      //b=bnight;
      //night=false;
    //}
 // }
  
  //clouds
    c.makeCloud(1);
    c1.makeCloud(.5);
    c2.makeCloud(1.25);
    c3.makeCloud(.75);
    c4.makeCloud(1.1);
  
  //sun
  sun();

  //ground
  fill(#669933);
  noStroke();
  rect(0, 370, 500, 500);


  //left addition roof
  fill(#000066);
  stroke(#000066);
  strokeWeight(20);
  triangle(addleftcenterx-55, adduplefty, addleftcenterx+55, adduplefty, addleftcenterx, 230);

  //left addition
  fill(#3399CC);
  noStroke();
  rect(addupleftx, adduplefty, triwidth-7, addlefth);

  //left addition rounded top
  fill(#3399CC);
  stroke(#FFFFCC);
  strokeWeight(5);
  arc(addleftcenterx, adduplefty+3, triwidth-10, 15, PI, 2*PI);

  //left addition column
  noStroke();
  fill(#660033);
  rect(addupleftx-4, adduplefty, cwidth-2, cheight-20);

  //left addition horizontal
  //fill(#FFFFCC);
  //rect(addupleftx, adduplefty, 113, cwidth-8);

  //left addition upper window
  fill(73,175,255);
  stroke(#FFFFCC);
  strokeWeight(3);
  rect(addleftcenterx-20, addtopwindowy, 40, 20);
  fill(232,208,12,nighta);
  noStroke();
  rect(addleftcenterx-20, addtopwindowy, 40, 20);

  //left addition upper window lines
  stroke(#FFFFCC);
  strokeWeight(3);
  line(addleftcenterx, addtopwindowy, addleftcenterx, addtopwindowy+20);
  line(addleftcenterx-20, addtopwindowy+10, addleftcenterx+20, addtopwindowy+10);




  //right addition roof
  fill(#000066);
  stroke(#000066);
  strokeWeight(20);
  triangle(addleftcenterx+191, adduplefty, addleftcenterx+302, adduplefty, addleftcenterx+247, 230);

  //right addition
  fill(#3399CC);
  noStroke();
  rect(addupleftx+248, adduplefty, triwidth-7, addlefth);

  //right addition rounded top
  fill(#3399CC);
  stroke(#FFFFCC);
  strokeWeight(5);
  arc(addleftcenterx+248, adduplefty+3, triwidth-10, 15, PI, 2*PI);

  //right addition column
  noStroke();
  fill(#660033);
  rect(addupleftx+357, adduplefty, cwidth-2, cheight-20);

  //right addition horizontal
  //fill(#FFFFCC);
  //rect(addupleftx+249, adduplefty, 113, cwidth-8);

  //right addition upper window
  fill(73,175,255);
  stroke(#FFFFCC);
  strokeWeight(3);
  rect(addleftcenterx+228, addtopwindowy, 40, 20);
  fill(232,208,12,nighta);
  noStroke();
  rect(addleftcenterx+228, addtopwindowy, 40, 20);

  //right addition upper window lines
  stroke(#FFFFCC);
  strokeWeight(3);
  line(addleftcenterx+248, addtopwindowy, addleftcenterx+248, addtopwindowy+20);
  line(addleftcenterx+228, addtopwindowy+10, addleftcenterx+268, addtopwindowy+10);

  //roof
  fill(#000066);
  noStroke();
  triangle(200, 260, 360, 260, 280, 175);

  //roof interior
  fill(#3399CC);
  stroke(#FFFFCC);
  strokeWeight(2);
  triangle(220, 260, 340, 260, 280, 195);

  //main blue center
  noStroke();
  fill(#3399CC);
  rect(220, 260, triwidth, triheight);

  //clock
  clock();

  //front horizontal bar
  noStroke();
  fill(#660033);
  quad(220, 260, 340, 260, 330, 250, 230, 250);

  //left column
  fill(#660033);
  rect(213, 260, cwidth, cheight);

  //right column
  fill(#660033);
  rect(332, 260, cwidth, cheight);

  //arc above door
  stroke(#FFFFCC);
  strokeWeight(10);
  noFill();
  arc(280, 310, 80, 60, PI, 2*PI);

  //left door column
  fill(#FFFFCC);
  noStroke();
  rect(235, 310, scolwidth, scolheight);

  //right door column
  fill(#FFFFCC);
  rect(314, 310, scolwidth, scolheight);

  //door overhead horizontal
  fill(#FFFFCC);
  rect(238, 308, 84, 10);

  //door
  fill(#993399);
  rect(247, 318, 67, scolheight-8);
  stroke(0);
  strokeWeight(1);
  line(280, 318, 280, bottom-1);
  
  //shrubbery
  
}

void clock(){
  //clock
  fill(#FFCCCC);
  ellipse(280, 230, 30,30);
  //start at 12 o'clock;
  // subtract HALF_PI to make them start at the top
  float m = map(second(), 0, 60, 0, TWO_PI);
  float h = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI); 
  //clock hands
  stroke(0);
  strokeWeight(1);
  line(clockx, clocky, clockx + cos(m) * radius, clocky + sin(m) * radius);
  strokeWeight(2);
  line(clockx, clocky, clockx + cos(h) * radius, clocky + sin(h) * radius);
  //line(280,230,cos(hour),sin(hour));
  hour++;
}

void sun(){
  //sun
  
  fill(#FFCC33);
  noStroke();
  ellipse(xSun, ySun, 75, 75);
  //ellipse(xSun, ySun, sunRadius, sunRadius);
  hour++;
  
  // Convert t to radians
  t = millis() * conversionFactor;

  // Use the parametric form for an ellipse. This method uses constant angular velocity
  float Rx = width/1.25 + sunRadius/2;
  float Ry = height/2 - sunRadius/2;
  float centerX = width/2;
  float centerY = 370;
  
  xSun = cos(t) * Rx + centerX;
  ySun = sin(t) * Ry + centerY;
  
}


class clouds{
//clouds
    float cx=random(0,500);
    float cy=random(0,225);
    float cw=random(30,50);
    float ch=random(30,50);
    float cw2=random(30,50);
    float ch2=random(30,50);
    float cw3=random(30,50);
    float ch3=random(30,50);
    float cw4=random(30,50);
    float ch4=random(30,50);
    float cw5=random(30,50);
    float ch5=random(30,50);
  
  clouds(){
    
  }
  void makeCloud(float b){
    if(cx>450){
      cx=0;
    }
      noStroke();
      fill(#CCFFFF);
      ellipse(cx,cy,cw,ch);
      ellipse(cx+25,cy+10,cw2,ch2);
      ellipse(cx+50,cy+15,cw3,ch3);
      ellipse(cx+40,cy+10,cw4,ch4);
      ellipse(cx+10,cy-10,cw5,ch5);
      cx+=b;
  }
}


