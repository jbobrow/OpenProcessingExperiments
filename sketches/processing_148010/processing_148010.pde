
void setup(){
size(800,500);
background(255);

}
// fields:
boolean ready; 
final float x1 = 10; 
final float y1 = 420; 
int x2 = 790;
int y2 = 420;

float hypo; 
float initVel;
float oppDis; // floats or ints? 
float angle;
float time; 

float topx;
float topy;
float rangex;
float rangey;


   
void draw(){ // called forever until stopped
  //Cannon c1 = new Cannon();
  //c1.render();
  //float m1 = mouseX;
  //float m2 = mouseY;
  stroke(0);
  strokeWeight(10);
  background(255);
  line(x1,y1,x2,y2);
  stroke(255, 100, 0);
  strokeWeight(20);
  point(x1, y1); // change to rectangle later!
  stroke(0);
  point(mouseX, mouseY);
  
  hypo = whatThedistance(x1, y1, mouseX, mouseY);
  initVel = hypo-50;
  oppDis = whatThedistance(mouseX, y1, mouseX, mouseY);
  angle = determineAngle();
  textSize(10);
  fill(0);
  text("angle : " + angle + " degrees", 50, 70);
  text("oppDis : " + (oppDis - 50) + " meters", 50, 60);
  text("initial velocity : " + (hypo - 50) + " meters/sec ", 50, 50);
  time = initVel / 10; // only half
  //text("time " + time, 300, 40);
  rangex = abs(initVel * degrees(cos(angle)) * time * 2)  ;
  rangey = abs(y1);
  topx = rangex / 2; 
  topy = abs((initVel * degrees(sin(angle))) + (0.5 * 10 * pow(time,2))) ;
  text("topx : " + topx , 300, 50);
  text("topy : " + topy , 300, 60);
  text("rangex : " + rangex , 300, 70);
  text("rangey : " + rangey , 300, 80);

  
  strokeWeight(1);

  point(t1,t2);
  point(r1, r2);
 
  line(x1,y1,t1, t2 );

  line(t1 ,t2 , r1 ,r2);
  //fill(255);
 // arc(t1,t2, whatThedistance(t1,t2,t1,420), whatThedistance(10,420, r1, 420), -PI, 0);
//line(0,465, 800, 465);
//ellipse(30, 450, 50, 15);
  stroke(255,0,0);
  strokeWeight(5);
  text("Equations used for curve of projectile motion: ", 200, 100);
  text("x = Vot + 0.5 at^2 ", 200, 110);
  text("Vf = Vo + at ", 200, 120);


  textSize(20);
  
  text("target", 675, 380);
  text("cannon", 10,380);
  text("Ground Line ", 350, 455);
  rect(675,400,25,50);
  
  
}

float t1 = x1; 
float t2 = y1; 
float r1 = x1; 
float r2 = y1;
void mousePressed() {
  t1 = topx /1000;//200;//topx;
  t2 = topy / 100; //150;//topy; 
  r1 = rangex / 1000;//675;// rangex;
  r2 = rangey;
  
}

float whatThedistance(float x1,float y1,float x2,float y2) {
    return sqrt(pow(x1-x2, 2) + pow(y1-y2, 2));
}
float determineAngle() {
    return degrees(asin((oppDis-50)/hypo)) ;
    
      
}
 
