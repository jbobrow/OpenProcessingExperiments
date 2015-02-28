
float x1=0;
float y1=1;
float x2=0;
float y2=1;
float x3=0;
float y3=1;
float carSize=10;
int x_speed1=+10;
int x_speed2=+3;
int x_speed3=+1;


void setup(){
  size(400,400);
}
 
void draw(){
  background(250,255,3);
  
  move1();
  move2();
  move3();
  
  bounce1();
  bounce2();
  bounce3();
 
 
  
  display1(x1+0,y1+250,carSize+3);
  display2(x2+20,y2+20,carSize+10);
  display3(x3+3,100,carSize+5);
  
  
}


void move1(){
  x1+=x_speed1;
  }
  void move2(){
  x2+=x_speed2;
  }
  void move3(){
  x3+=x_speed3;
  }
  

void bounce1(){
  if((x1>=width)||(x1<=0)){
    x_speed1=x_speed1*-1;
  }
}
void bounce2(){
  if((x2>=width)||(x2<=0)){
    x_speed2=x_speed2*-1;
  }
}
void bounce3(){
  if((x3>=width)||(x3<=0)){
    x_speed3=x_speed3*-1;
  }
}


void display1(float x1, float y1,float carSize){
  fill(0);
 rect(x1, y1, carSize+40,carSize+10);
 fill(random(255));
 rect(x1,y1-13,carSize+10,carSize);
 fill(0);
 ellipse(x1+6, y1+25, carSize,carSize);
 fill(0);
 ellipse(x1+45, y1+25, carSize,carSize);
}
void display2(float x2, float y2,float carSize){
  fill(0);
 rect(x2, y2, carSize+40,carSize+10);
 fill(random(255));
 rect(x2,y2-20,carSize+10,carSize);
 fill(0);
 ellipse(x2+10, y2+30, carSize,carSize);
fill(0);
 ellipse(x2+50, y2+30, carSize,carSize);
}
void display3(float x3, float y3,float carSize){
  fill(0);
 rect(x3, y3, carSize+40,carSize+10);
 fill(random(255));
 rect(x3,y3-15,carSize+10,carSize);
 fill(0);
 ellipse(x3+9, y3+25, carSize,carSize);
 fill(0);
 ellipse(x3+45, y3+25, carSize,carSize);
}
                
