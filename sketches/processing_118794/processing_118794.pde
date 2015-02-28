
int smileyY = 256;
int smileyX = 256;

Circles Jerry;
Circles Vezenelle;
Circles Celesto;
Circles Lior;
Circles Joseph;
Circles Evangelo;
Circles Prymoxander;
Circles Dizmer;
Circles Alexandrus;
Circles Devazone;
 
void setup() {
  background(0);
  colorMode(HSB);
  size(500, 500);
  Jerry = new Circles(color(random(255), 255, 255, 100));
  Jerry.y=0;
  Jerry.velocity=random(1);
   
  Vezenelle = new Circles(color(random(255), 255, 255.100));
  Vezenelle.y=50;
  Vezenelle.velocity=random(1);
  Vezenelle.beauty=10;
 
  Celesto= new Circles(color(random(255), 255, 255, 100));
  Celesto.y=100;
  Celesto.beauty=20;
  Celesto.velocity=random(1);
 
    Lior= new Circles(color(random(255), 255, 255, 100));
  Lior.y=150;
  Lior.beauty=30;
  Lior.velocity=random(1);
   
  Joseph=new Circles(color(random(255),255,255,100));
  Joseph.y=200;
  Joseph.beauty=40;
  Joseph.velocity=random(1);
   
  Evangelo=new Circles(color(random(255),255,255,100));
  Evangelo.y=250;
  Evangelo.beauty=50;
  Evangelo.velocity=random(1);
   
  Prymoxander=new Circles(color(random(255),255,255,100));
  Prymoxander.y=300;
  Prymoxander.beauty=60;
  Prymoxander.velocity=random(1);
   
  Dizmer= new Circles(color(random(255),255,255,100));
  Dizmer.y=350;
  Dizmer.beauty=70;
  Dizmer.velocity=random(1);
   
  Alexandrus= new Circles(color(random(255),255,255,100));
  Alexandrus.y=400;
  Alexandrus.beauty=80;
  Alexandrus.velocity=random(1);
   
  Devazone= new Circles(color(random(255),255,255,100));
  Devazone.y=450;
  Devazone.beauty=90;
  Devazone.velocity=random(1);
}
 
void draw() {
  //background(0);
  Jerry.update();
  Jerry.display();
  Vezenelle.update();
  Vezenelle.display();
  Celesto.update();
  Celesto.display();
  Lior.update();
  Lior.display();
  Joseph.update();
  Joseph.display();
  Evangelo.update();
  Evangelo.display();
  Prymoxander.update();
  Prymoxander.display();
  Dizmer.update();
  Dizmer.display();
  Alexandrus.update();
  Alexandrus.display();
  Devazone.update();
  Devazone.display();
  
   
  if(key == 'w') smileyY = smileyY - 6;
  if(key == 's') smileyY = smileyY + 6;
  if(key == 'a') smileyX = smileyX - 6;
  if(key == 'd') smileyX = smileyX + 6;
  if(key == 'r') smileyY = smileyX + 6;
  if(key == 'q')
  {
   smileyY = smileyY - 5;
   smileyX = smileyX - 5;
  }
  if(key == 'e')
  
  {
   smileyX = smileyX + 5;
   smileyY = smileyY + 5; 
  }
  
  if(key == 'c') 
  {
    
    smileyX=256;
    smileyY=256;
    clear();
    
  } 
  drawSmiley(smileyX, smileyY);
  
}
 
// Do Now Requirements:
// Name your function ‘drawSmiley’
// The largest ellipse of your smiley should be no larger 80 units in diameter.
// The smiley should be drawn at the at the x and y coordinates that you give the function, just like the drawBalloon function.
 
 
void drawSmiley(int x, int y)
{
  // Draw the string
  //stroke(0);  // The color of the string
  //strokeWeight(3); // The thickness of the string
  //line(x, y, x, y + 200);
 
  // Draw a Smiley
  noStroke(); // head
  fill(random(255),100,255,50);
  ellipse(x, y, 80, 80);

noStroke(); // eye
  fill(0, 160, 150); // color of eye
  ellipse(x + 20 , y - 20, 20, 20);
  
  noStroke(); // eye
  fill(0, 160, 150); // The color of the balloon
  ellipse(x - 20, y -20, 20, 20);
  
  noStroke(); // mouth
  fill(0, 160, 150); // The color of the mouth
  ellipse(x , y + 20, 45, 30);

}
  {
if(key == 'f') smileyY = smileyY + 8;
if(smileyX < 0) smileyX=512;
if(smileyX > 512) smileyX = 0;
if(smileyY < -20) smileyY = 512;
if(smileyY > 520) smileyY = 512;


  }

   

 
class Circles{
  float x;
  float y;
  float xspeed;
  float yspeed;
  float velocity;
  color fillValue;
  float beauty;
  float z;
   
   
   
Circles(color c){
 
   
  z=random(75);
  x=0;
  y=0;
  xspeed=0;
  yspeed=1;
  fillValue =c;
  velocity=0;
  beauty=0;
   
}
 
void update(){
  println(velocity);
   
if (x>=width){x=0;}
if (velocity>=35){velocity=random(35);}
 
x=x+xspeed+velocity;
velocity=velocity+random(1);
 
 
beauty= beauty+5;
if(beauty>=255){beauty=0;}
}
 
void display(){
   
 //noStroke();
fill(beauty,255,255,150);
rect (x,y,z,30);
rect(x+100,y+50,z,30);
rect(x,y+75,z,30);
 
smooth();
strokeWeight(3);
stroke(beauty,255,255,100);
 
 
 
 
}
}

