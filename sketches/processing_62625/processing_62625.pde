
float xcent=width/2;
float ycent=height/2;
void setup() {
   
  size(800,600);
  smooth();
  noStroke();
  frameRate(50);
 background (200,.1);

}

float a = random(30,255);
float b = random(0,10);
float c = mouseY-300;
float d = mouseX-400;


void draw(){
 smooth();

ellipseMode(RADIUS);
ellipse(width/2,height/2, mouseX+random(0,10)-400,mouseX+random(0,10)-400); 

ellipseMode(CENTER);
fill(random(30,255),random(30,255),a,2);
arc(width/2,height/2, 150+random(300), 150+random(300),   radians(50+c), radians(180+c));
fill(10,10,50+a,1);
arc(width/2,height/2, 200+random(300),200+random(300),   radians(270+mouseX), radians(360+mouseX));
fill(a,a,50,1);
arc(width/2,height/2, 250+random(300),250+random(300),   radians(200), radians(300));
fill(a,50,100,1);
arc(width/2,height/2, 400+random(100),400+random(100),   radians(0+mouseY), radians(175+mouseY));
fill(a,a,200,1);

 smooth();
 fill(0,0,0,2-1);
 
arc(400,300, 100+b,100+b,   radians(30+mouseY), radians(80+mouseX)); 


ellipse (400,300,100,100);
  fill (200);
  }

