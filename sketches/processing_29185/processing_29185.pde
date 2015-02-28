
int a,x;
void setup(){
  size(400,400);
a=0;
x=375;
frameRate(200);
}
void draw(){
  background(HSB);
  background(random(255),random(255),random(255));
  ellipseMode(CENTER);
  ellipse(200,a,50,50);
  a++;
  
   noFill();
   stroke(random(0,255));
    ellipseMode(CENTER);
  ellipse(200,a,10,10);
  
   stroke(random(0,255),random(0,255),random(0,255));
   ellipseMode(CENTER);
  ellipse(60,a,5,5);
   stroke(random(0,255),random(0,255),random(0,255));
ellipseMode(CENTER);
  ellipse(97,a,5,5);
   stroke(random(0,255),random(0,255),random(0,255));
ellipseMode(CENTER);
  ellipse(350,a,80,80);
   stroke(random(0,255),random(0,255),random(0,255));
ellipseMode(CENTER);
  ellipse(50,a,41,41);
   stroke(random(0,255),random(0,255),random(0,255));

ellipseMode(CENTER);
  ellipse(250,a,4,4);
   stroke(random(0,255),random(0,255),random(0,255));
ellipseMode(CENTER);
  ellipse(100,a,2,2);
   stroke(random(0,255),random(0,255),random(0,255));
ellipseMode(CENTER);
  ellipse(380,a,2,2);  
if (a>375){
    a=x;
    x--;}
 

}

