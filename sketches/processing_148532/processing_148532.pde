
void setup(){
  size(400,500);
  background(255);
 
}
// fields:
 
final float x1 = 10; // x cordinate of starting point
final float y1 = 420; // y cordinate of starting point
int x2 = 490;
int y2 = 420;
 
float hypo; // hypothenuse of triangle
float initVel; // initial velocity, determined by the distance from starting point to mouseX
float oppDis; // distance from mouseY to y- value of starting point
float angle;
float time;
 
float topx;
float topy;
float rangex;
float rangey;
 
 
float ballx = 10;
float bally = 420;

void draw(){ // called forever until stopped
 
  stroke(0);
  strokeWeight(10);
  background(255);
  line(x1,y1,x2,y2);
  stroke(255, 100, 0);
  strokeWeight(20);
  point(x1, y1); // change to rectangle later!
  stroke(0);
  point(mouseX, mouseY);
   
  hypo = whatThedistance(x1, y1, mouseX, mouseY)/5 ;
  initVel = hypo;
  oppDis = whatThedistance(mouseX, y1, mouseX, mouseY) /5;
  angle = determineAngle();
 
  textSize(10);
  fill(0);
  text("angle : " + (int)(angle) + " degrees", 50, 70);
  text("initial velocity : " +(int) (hypo ) + " meters/sec ", 50, 50);
 
  time = initVel * (sin(radians(angle))) / 10; // only half
  rangex = initVel * cos(radians(angle)) * time * 2  ;
  rangey = y1;
  topx = rangex / 2;
  topy = initVel * sin(radians(angle)) + (5 * pow(time,2)) ;

 
   
  strokeWeight(1);
 
  point(t1,t2);
  point(r1, r2); // what is this for? i forgot
  
  line(x1,y1,t1 + x1 , y1 - t2 );
 
  line(t1 + x1 ,y1 - t2 , r1 + x1 ,r2);
  //fill(255);
 // arc(t1,t2, whatThedistance(t1,t2,t1,420), whatThedistance(10,420, r1, 420), -PI, 0);
//line(0,465, 800, 465);
//ellipse(30, 450, 50, 15);
  stroke(255,0,0);
  strokeWeight(5);
  
   
 
  textSize(10);
   
  text("target", 275, 380);
  text("cannon", 10,380);
  text("ground line ", 150, 455);
  rect(275,400,25,50);
  
  if (ballx  < t1 + x1) {
    
    ballx = ballx +10;
      
  }
  if (bally > y1 -t2) {
        bally = bally - 10; 
  }
  if (ballx > t1 + x1 && 
  ellipse(ballx, bally, 40, 40);
    
   
}
 
float t1 = 0;
float t2 = 0;
float r1 = 0;
float r2 = 0;
void mousePressed() {
  t1 = topx;//200;//topx;
  t2 = topy ; //150;//topy;
  r1 = rangex ;//675;// rangex;
  r2 = rangey;
   
}
 
float whatThedistance(float x1,float y1,float x2,float y2) {
  return sqrt(pow(x1-x2, 2) + pow(y1-y2, 2));
}
float determineAngle() {
  return degrees(asin(oppDis/hypo)) ;
     
       
}
float getSlopey(float rise, float run) {
  return rise / run;
}
float getSlopex(float rise, float run) {
  return rise/ run;
}

