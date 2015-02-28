

float angle;// the current angle of the pendulum as a function of time
            //relative to vertical
float bigAngle;  //the current angle of the pendulum relative to the positive x-axis
float angleStart=PI/6; //the initial angle from which the pendulum is released
float period;
float t;
float xCenter,yCenter; //the position of the top of the rod
int num=99;//the number of pendula
Pendulum[] pendulist = new Pendulum[num];


void setup(){
  frameRate(15);
  size(500,500);
  xCenter=width/2;
  yCenter=0;
  t=0;
  for (int i=0;i<num;i++){
     float red=0;
    float green=0;
    float blue=0;
    int colr=int(random(3));
    if(i%3==0){
      red=255;
    }//end if
    if(i%3==1){
      green=255;
    }//end if
    if(i%3==2){
      blue=255;
    }//end if
    pendulist[i]= new Pendulum(60.0/(50.0+i),red,green,blue);
  }//end for
  
}//end setup

void draw(){
  background(255);
  for (int i=0;i<num;i++){
    pendulist[i].move();
    pendulist[i].display();
  }//end for
 
  
  t=t+1.0/60.0;
}//end draw

/*class Pendulum
Defines objects which are circles of radius 5
center at (x,y) which are dreated from its current angle whic is a function of t
period p
object must create it's own length from its period
*/
class Pendulum{
  float period;
  float len;
  float scaledL;
  float xbob,ybob;
  float red, green, blue;
  
  
  Pendulum(float period_, float red_,float green_, float blue_){
    period=period_;
    red=red_;
    green=green_;
    blue=blue_;
    len=(pow(period,2)*9.8)/(4*pow(PI,2));
    scaledL=len*1000;
  }//end constructor
  
  void move(){
    angle=angleStart*sin(sqrt(9.8/len)*t);
    bigAngle=1.5*PI + angle;
    float scaledL=len*1250;// notice that the letter "l" is
                    //a crappy choice for a variable as it
                    //looks like the number "1"
  
    xbob=scaledL*cos(bigAngle)+xCenter;
    ybob=-scaledL*(sin(bigAngle))+yCenter;
  }//end move method
  
   void display(){
    fill(red,green,blue);
    ellipse(xbob,ybob,10,5);
 
   // line(xCenter,yCenter,xbob,ybob); 
     
  }//end display method
  
}//end class











