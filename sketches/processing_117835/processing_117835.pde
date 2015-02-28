
 Smile smile;
int m;
int s;
int h;

void setup(){
  size(600,600);
  background(0);
  smile= new Smile();
}
void draw(){
  m=minute();
  s=second();
  h=hour();
  background(0);
  noStroke();
  smile.face();
  smile.eye1();
  smile.eye2();
  smile.edge1();
  smile.edge2();
  smile.smile();
  
translate(300,300);

for (int i=0; i<60; i++){
  if(i%5==0){
    hours();
  }else{
minutes();
}
rotate(radians(6));
}
middle();

pushMatrix();
rotate(radians(6*second()));
secondHand();
popMatrix();

pushMatrix();
rotate(radians(6*(m)));
minuteHand();
popMatrix();

pushMatrix();
rotate(radians(30*h));
hourHand();
popMatrix();
textSize(24);
fill(255);
/*String[] time=new String[3];
       time[0]=Integer.toString(h);
       time[1]=Integer.toString(m);
       time[2]=Integer.toString(s);*/
     
 String[] time=new String[3];
       time[0]=str(h);
       time[1]=str(m);
       time[2]=str(s);
       
       
String time2 = join(time, " : "); 
text("Time is:  ", -300,250);
text(time2,-210,250);
}
//End draw function

void hours(){
  strokeWeight(3);
  stroke(0,255,0);
  line(0,-223,0,-210);
}
void minutes(){
  strokeWeight(1);
  stroke(255,0,0);
  line(0,-223,0,-213);
}
void middle(){
  noStroke();
  fill(0);
  ellipse(0,0,15,15);
}

//hours hand
void hourHand() {
  stroke(0);
  strokeWeight(2);
  line(0,0,0,-160);
}
//minutes hand
void minuteHand(){
  stroke(2);
  strokeWeight(1);
  line(0,0,0,-170);
}
//seconds hand
void secondHand() {
  stroke(0);
  strokeWeight(1);
  line(0,0,0,-200);
}
class Smile{
  
  void face(){
  fill(255,200,0);
  ellipse(300,300,450,450);
}
void eye1(){
  fill(0);
  //rotate (radians (10));
  ellipse(200,200,15,100);
  //rotate (radians (80));
}
void eye2(){
  fill(0);
//  rotate (radians (10));
  ellipse(400,200,15,100);
}
 
void edge1(){
  fill(0);
  ellipse(150,395,10,50);
}
void edge2(){
  fill(0);
  ellipse(450,395, 10,50);
}
void blood(){
 fill(100,3,3);
 strokeWeight(0);
 arc(117, 200, 45, 30, 0, PI);
 strokeWeight(0);
}
void smile(){
  noFill();
  stroke(0);
  strokeWeight(10);
 arc(300, 400, 300, 150, 0, PI);
 strokeWeight(1);
}
}


