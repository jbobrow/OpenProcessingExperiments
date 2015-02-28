
Line myLine1;
Line myLine2;
Line myLine3;
Line myLine4;

void setup(){
  size(800,800);
  smooth();
  
myLine1=new Line(0.0,4,0.005);
myLine2=new Line(0.0,10,0.005);
myLine3=new Line(0.0,20,0.005);
myLine4=new Line(0.0,3,0.005);
}

void draw(){
  background(20,3,100);
  translate(400,400);
  myLine1.move();
  myLine1.display();
  myLine2.move();
  myLine2.display();
  myLine3.move();
  myLine3.display();
  myLine4.move();
  myLine4.display();
}
class Line{
  float angle;
  float angledirection;
  float speed;
  
  Line(float tempAngle, float tempangleDirection, float tempSpeed){
    angle=tempAngle;
   angledirection=tempangleDirection;
   speed=tempSpeed;
 
  }
  void display(){
    //translate(250,250);
    strokeWeight(100);
    stroke(213,113,229,40);
    rotate(angle);
//    line(0,0,0,40);
//    line(0,0,50,100);
//    line(150,100,100,200);
//

//horn
triangle(370,200,270,200,100,100);

//face
ellipse(300,220,100,100);
rect(210,210,90,45);

//eye
fill(0);
ellipse(292,202,25,20);
fill(156,248,252);
ellipse(292,202,15,10);


//nose
fill(121,35,193);
triangle(180,260,280,190,210,215);
arc(190, 250, 50, 50, 0, PI/2);


  }
 
  void move(){
    angle+=speed*angledirection;
   if((angle>TWO_PI*3)||(angle<0)){
    angledirection*=-1;
    }
   }
  }


