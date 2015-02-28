
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
ellipse(x,y,30,30);
ellipse(mouseX,mouseY,x-200,y-200);
smooth();
strokeWeight(3);
stroke(beauty,255,255,100);




}
}
