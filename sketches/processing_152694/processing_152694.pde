
float m=0;
float n=0;
float radio=0;

float angle=0.01;
float speed= 0.05;

void setup(){
  size (600,600);
  background(200);
}

void draw(){
 fill(random(16,164,60));
  float x=width/2 + cos(2*m)  *n; //spiral reduced in the coordinate axis, for points ratetes in the screenshot
  float y=height/2 + sin(2*m) * n;
  ellipse(x, y, 10, 10);
  m=m+1.5;                        // the variable of separation, alter the separation and spiral amplitude
  n=n+1.25;
}
void mousePressed(){
  if(mouseButton==RIGHT){        //comand of enter (change of enter information).
  m=1.5+5*sin(5*cos(angle)); 
  n=1.5+5*cos(5*sin(angle));
fill(random()+1);
  }
  angle=m+n+ 2*speed;
}

//the next code mean a spiral with a work of one's own.
//It have got a sequence of its startup
//If you touch the mouse you can see the program making and operations, it completes spiral's spaces.
//Although the principal idea is taht this same, this moves in the  same screenshot but enjoying.
