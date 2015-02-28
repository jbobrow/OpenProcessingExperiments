
int card = 0; 
int offset  = 10;
int timeOpen = 1000; //time to open eyes 
int timeClosed = 250; //time to cloase eyes 
int last = 0;
boolean closed = false;
PFont f; 
PFont f1;
PFont f2;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage g;
PImage t;
int x = 690;
int y = 565;
int w = 15;
int h = 15;
float c1;
void setup() {
  size(800,600); 
  frameRate(10);  
  // mws = new MichaelWS[num];  for (int i = 0; i < num; i++) {   mws[i]= new MichaelWS(i);  }
  f = loadFont("Helvetica-13.vlw");
  f1= loadFont("Helvetica-11.vlw");
  f2= loadFont("Helvetica-17.vlw");
  a=loadImage("page2.jpg");
  b=loadImage("2page_1.jpg");
  c=loadImage("page3_1.jpg");
  d=loadImage("page4_4.jpg");
  e=loadImage("page5.jpg");
  g=loadImage("page6_2.jpg");
 t=loadImage("title.jpg");
  textFont(f);
  smooth();
  /*
  noLoop();
  */}
void draw() {
   strokeWeight(3);
   //title page
  if (card == 0) { 
    background(255); 
    image(t,0,0);
    textFont (f1);
    text("KONKUK  UNIVERCITY  ART & CULTURE   COLLEGE  COMUNICATION DESIGN    (200415141 MOON SAE  BYEOK)",width/20+65,577); 
    fill(0);
    rect (x,y,w,h);}
  
  //1page  
 
  else if (card == 1) {  
    background(150);
    image(a,0,0); 
    textFont(f);
    text("NEXT PAGE -",width/2+190, height-31); 
    ellipse(x, y, 15, 15); 
  //transformer star  
    for(float c1=100; c1<=180; c1+=1)//color
 {float u= random(30,780);//x (30~580)
 float k= random(100,370);//y (100~270)
 float z= random(0.2,0.6);//size (0.1~0.5)
 star(u,k,z,70,c1); }
 mainstar(400,450,0.5,70,200);
  int now = millis();
  int time;
if (closed) {time = timeClosed;}  
  else {time = timeOpen;}
if (now - last > time) {if (closed) {closed = false;} 
    else {float a = random(0,1);if (a > 0.3) {closed = true;}}last = now; }
translate(369,492);
  if (closed){line (3, 0, 3 + offset*1, 0);line (3 - offset*2, 0, 3 - offset*1, 0);}
 else { ellipse( 0 + offset, 0, offset/3,6); ellipse( 0 - offset*1, 0, offset/3,6);}
    } 
   
   //2page
  
  else if (card  == 2) {   
    background(30);
    image(b,0,0);
    strokeWeight(0);
    text("NEXT PAGE -",width/2+190, height-31); 
    ellipse(x, y, 15, 15); }
   
   //3page
  
  else if (card  == 3) {   
    background(5);

strokeWeight(0);
    image(c,0,0);
       text("NEXT PAGE -",width/2+190, height-31); 
    ellipse(x, y, 15, 15);  
     
     stroke(223); 
     mainstar(384,460,0.8,70,240);  
     strokeWeight(6);
   
  int now = millis();
  int time;
if (closed) {time = timeClosed;}  
  else {time = timeOpen;}
if (now - last > time) {if (closed) {closed = false;} 
    else {float a = random(0,1);if (a > 0.3) {closed = true;}}last = now; }
translate(340,528);
  if (closed){line (0, 0, 0 + offset*1.5, 0);line (0 - offset*3, 0, 0 - offset*1.5, 0);}
 else { ellipse( 0 + offset, 0, offset/3,6); ellipse( 0 - offset*2, 0, offset/3,6);}
    star(310,430,1,20,150);
    }
   
    //4page
 
  else if (card  == 4) {   
    background(85);
    image(d,0,0); 
   {float c1= random (0,255);//color
    mainstar(295,320,1.4,0,c1);}
    text("NEXT PAGE -",width/2+190, height-31);
       strokeWeight(0); 
    ellipse(x, y, 15, 15);
     
  }
 
  //5page
  
  else if (card  == 5) {   
    background(90);
    image(e,0,0);
    {float c1= random (0,255);
  mainstar(70,95,0.4,0,c1);}
      strokeWeight(0);
    
    text("NEXT PAGE -",width/2+190, height-31); 
    ellipse(x, y, 15, 15); 
      strokeWeight(2);
  int now = millis();
  int time;
if (closed) {time = timeClosed;}  
  else {time = timeOpen;}
if (now - last > time) {if (closed) {closed = false;} 
    else {float a = random(0,1);if (a > 0.3) {closed = true;}}last = now; }
translate(95,127);
  if (closed){line (3, 0, 3 + offset*1, 0);line (3 - offset*2, 0, 3 - offset*1, 0);}
 else { ellipse( 0 + offset, 0, offset/3,6); ellipse( 0- offset*1, 0, offset/3,6);}
  }
  
  //6page
  
  else if (card  == 6) {   
    background(100);
    image(g,0,0);
    ;
    strokeWeight(0);
   fill(255);
    text("NEXT PAGE -",width/2+190, height-31); 
    ellipse(x, y, 15, 15);
  }
  
  //7page
 
  else if (card  == 7) {  
    background(200);
    image(a,0,0); 
  
   //star rotation 
  
  {float r= random(0,360);//x (30~580)
  for(int a=0; a<800; a+=100) {stroke(2); star(50+ a,32,0.5,r,0);}
     for(int a=0; a<800; a+=100) {stroke(2); star(50+ a,132,0.5,r,0);}
      for(int a=0; a<800; a+=100) {stroke(2); star(50+ a,432,0.5,r,0);}
       for(int a=0; a<800; a+=100) {stroke(2); star(50+ a,532,0.5,r,0);}
 star(50,232,0.5,r,0);
    star(150,232,0.5,r,0);
       star(250,232,0.5,r,0);
       star(550,232,0.5,r,0);
    star(650,232,0.5,r,0);
   star(750,232,0.5,r,0);
    star(50,332,0.5,r,0);
    star(150,332,0.5,r,0);
     star(250,332,0.5,r,0);
      star(550,332,0.5,r,0);
    star(650,332,0.5,r,0);
    star(750,332,0.5,r,0); }
 
  {float c1= random (0,255); mainstar(490,160,1.5,70,c1);}
  
  strokeWeight(7);
  
  textFont(f2);
  text("END",width/2-15, height/2+90);
    
  int now = millis();
  int time;
if (closed) {time = timeClosed;}  
  else {time = timeOpen;}
if (now - last > time) {if (closed) {closed = false;} 
    else {float a = random(0,1);if (a > 0.3) {closed = true;}}last = now; }
translate(403,290);
  if (closed){line (0, 0, 0 + offset*1.5, 0);line (0 - offset*3, 0, 0 - offset*1.5, 0);}
 else { ellipse( 0 + offset, 0, offset/3,6); ellipse( 0 - offset*2, 0, offset/3,6);}
    fill(0,0,255);
    
    fill(0, 255, 255);
  }
  
}

//mouse button

void mousePressed() { 
  if (card == 0) {  
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 1;
    } 
    else card = 0;
  }
  else if (card == 1) { 
    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 2;
    }
    else card = 1;
  }   
  else if (card == 2) {
    float d = dist(mouseX, mouseY, x, y); 
    if (d < 20) {
      card = 3;
    } 
    else card = 2;
  }
  else if (card == 3) {
    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 4;
    } 
    else card = 3;
  }  
  else if (card == 4) {
    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 5;
    } 
    else card = 4;
  }   
  else if (card == 5) {
    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 6;
    } 
    else card = 5;
  }   
  else if (card == 6) {
    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 7;
    } 
    else card = 6;
  }
}

//star objet
void star(float x, float y,float s,float r,float c) 
{    
pushMatrix(); 
translate(x,y);    scale(s);    rotate(radians(r));    smooth();  fill(255,245,c);   
 strokeWeight(2);
beginShape(); vertex(0,-50);  vertex(16,-23);  vertex(53,-12);  vertex(26,14);  vertex(33,51);  vertex(0,34);  
vertex(-34,51);  vertex(-27,14);  vertex(-54,-12);  vertex(-17,-23);  vertex(0,-50);  endShape(); 
 fill(0);
  ellipse(-9,22,20,10);
  ellipse(2,-9,20,10);
popMatrix();} 


//main star
void mainstar(float x, float y,float s,float r,float c) 
{    
pushMatrix(); 
translate(x,y);    scale(s);    rotate(radians(r));    smooth();  fill(255,245,c);   
 strokeWeight(2);
beginShape(); vertex(64,32);  vertex(80,66);  vertex(117,71);  vertex(90,97);  vertex(97,134);  vertex(63,117);  
vertex(30,134);  vertex(37,97);  vertex(10,71);  vertex(47,66);  vertex(64,32);  endShape(); 
 fill(0);
  popMatrix();} 


