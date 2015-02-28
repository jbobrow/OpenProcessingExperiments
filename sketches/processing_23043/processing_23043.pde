
int x=0;
int speedx=1;
int y=0;
int speedy=3;
int r;
int trans=50;
int back = 0;
Thing thing1;
Thing thing2;
Thing thing3;
Thing thing4;
Thing thing5;

color c1 = color (random(0,255), random(0,255), random(0,255));
color c2 = color (random(0,255), random(0,255), random(0,255));
color c3 = color (random(0,255), random(0,255), random(0,255));
color c4 = color (random(0,255), random(0,255), random(0,255));
color c5 = color (random(0,255), random(0,255), random(0,255));






void setup()
  
  {
    rectMode(CENTER);
    size(600,800);
    smooth();
    thing1 = new Thing (random(0,width), random(0,height), random(50,300), random(-5,5), c1 );
    thing2 = new Thing (random(0,width), random(0,height), random(50,300), random(-5,5), c2);
    thing3 = new Thing (random(0,width), random(0,height), random(50,300), random(-5,5), c2);
    thing4 = new Thing (random(0,width), random(0,height), random(50,300), random(-5,5), c2);
    thing5 = new Thing (random(0,width), random(0,height), random(50,300), random(-5,5), c2);
  }
 
void draw()

  {
    
    thing1.move();
    thing2.move();
    thing3.move();
    thing4.move();
    thing5.move();
    thing1.coloring();
    thing2.coloring();
    thing3.coloring();
    thing4.coloring();
    thing5.coloring();
    
    fill(back,trans);
    noStroke();
    rect(width/2,height/2,width,height);
    noFill();
    x=x+speedx;
    y=y+speedy;
   
    if((x>width) || (x<0))
   
   {
 
     speedx=speedx*-1;
    
   }
 
    if((y>height)|| (y<0)){
 
    speedy=speedy*-1;
  }
  //back+=1;
  r+=1;
  trans-=1;
  stroke(r,r,r);
  bezier(0,y,x,y,x,y,width,height-y);
  bezier(0,height-y,x,y,x,y,width,y);
  bezier(0,height-y,x,y,x,y,0,y);
  bezier(width,height-y,x,y,x,y,width,y);
  //r=constrain(r,0,255);
  trans=constrain(trans,10,50);
}



class Thing {
//date (variables)
float growth = 1;
float xpos;
float ypos;
float radius;
float speedx;
float speedy;
color cor;
//constructor
Thing (float tempX, float tempY, float tempRadius, float tempSpeed, color tempColor){
xpos = tempX;
ypos = tempY;
radius = tempRadius;
speedy = tempSpeed;
speedx = tempSpeed;
cor = tempColor;
}
//methods and functions
void move () {
ypos +=speedy;
xpos +=speedx;
radius+=growth;
if ((ypos > ((height-radius/2)+1)) || ((ypos<(0+radius/2)-1))) {
speedy *= -1;
}
if (xpos > ((width-radius/2)+1) || (xpos<(0+radius/2)-1)) {
speedx *= -1;
}
if (radius<=50 || radius>=300) {
  growth *=-1;
}
  
  

noStroke();
fill (cor);

rect (xpos, ypos, radius, radius);
}

void coloring() {
 
 cor = color(random(0,255),random(0,255),random(0,255)); 
  
}

}
