
Pooh pooh1;
Pooh pooh2;

void setup() {
  size(640,480);
  smooth();
  pooh1= new Pooh(100,100,0.5,2);
  pooh2= new Pooh(250,300,6,1);
}

void draw() {
  background(0);
  pooh1.bounce();
  pooh1.display();
  pooh2.bounce();
  pooh2.display();
  
  pooh1.hit(pooh2);
  pooh2.hit(pooh1);
}

class Pooh {
  //pooh's variables
  float x;
  float y;
  float xspeed;
  float yspeed;
  float w;
  float h;
  float earSize;
  float limbLength;
  float eyeSize;
  float noseSize;
  float balloonSize;
  color c;
  color r;
  color p;
  boolean hit= false;
  
  //pooh constructor
  Pooh(float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) {
    x=tempXpos;
    y=tempYpos;
    xspeed=tempXspeed;
    yspeed=tempYspeed;
    w=50;
    h=68;
    earSize=15;
    limbLength=20;
    eyeSize=7;
    noseSize=11;
    balloonSize=20;
    c=color(220,150,64);
    r=color(232,38,16);
    p=color(242,114,15);
  }

  //bounce pooh
  void bounce() {
   x=x+xspeed;
   y=y+yspeed;
 
   if ((x>width) || (x<0)) {
     xspeed=xspeed*-1;
   }
   if((y>height) || (y<0)) {
     yspeed=yspeed*-1;
   }
  }
 
 //display pooh
 void display() {
   //set modes
   ellipseMode(CENTER);
   rectMode(CENTER);
   
   // pooh's body
   noStroke();
   fill(c);
   ellipse(x,y,w,h);

   // pooh's legs
   ellipse(x-15,y+24,limbLength,limbLength+10);
   ellipse(x+15,y+24,limbLength,limbLength+10);

   //pooh's arms
   ellipse(x-20,y-15,limbLength+10,limbLength);
   ellipse(x+20,y-15,limbLength+10,limbLength);

   //pooh's ears
   ellipse(x-20,y-53,earSize,earSize);
   ellipse(x+20,y-53,earSize,earSize);

   //pooh's shirt
   fill(r);
   rect(x,y-11,w,h-41);

   // pooh's head
   fill(c);
   ellipse(x,y-37,w,w);

   //pooh's eyes and nose
   fill(0);
   ellipse(x-11,y-40,eyeSize,eyeSize+2);
   ellipse(x+11,y-40,eyeSize,eyeSize+2);
   //nose
   ellipse(x,y-30,noseSize,noseSize-2);

   //balloon string
   stroke(255);
   line(x+50,y-50,x+25,y-15);

   //balloon
   noStroke();
   fill(mouseX,0,mouseY);
   ellipse(x+50,y-50,balloonSize,balloonSize+3);
   
   if(hit) {
   // pooh's head
   fill(p);
   ellipse(x,y-37,w,w);
   //pooh's eyes
   fill(0);
   ellipse(x-11,y-40,eyeSize,eyeSize+2);
   ellipse(x+11,y-40,eyeSize,eyeSize+2);
   //nose
   ellipse(x,y-30,noseSize,noseSize-2);
   //pooh blushes
   fill(r);
   ellipse(x-11,y-30,eyeSize,eyeSize);
   ellipse(x+11,y-30, eyeSize,eyeSize);
   //oh mouth
   fill(0);
   ellipse(x,y-20,eyeSize,eyeSize);
   }
 }
 
 //hit test
   void hit(Pooh pooh) {
    float rad = (w > pooh.w ? w : pooh.w);
    // "if expressions" are if statements that return a value
     
    if (dist(x, y, pooh.x, pooh.y) <= rad) {
      pooh.hit = true;
      hit = true;
    } else {
      pooh.hit = false;
      hit = false;
    }
  }
}

