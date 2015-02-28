


float Bx; //bot's x location
float By; //bot's y location
float targetX, targetY; // where the bot is going to
float speed = 0.5; // speed the bot moves ( not sure if I need this)
float easing = 0.06; // easing.. not sure if i need this either 
int frame = 0;
float time = frame/30;
//float X = mouseX;
//float Y = mouseY;
int num = 0;
int [] WayPx = new int[num]; // declare an 2d array with 100 cubbys for 2 numbers each
int [] WayPy = new int[num];
int wp = 0;
int Animate = 0;
int start = 0;
/*
************************* SETUP *********************
*/

void setup(){
  size(450,450);
  smooth();
  stroke(2);
  frameRate(30);
  println("Draw Vehicle Path");  
}

/*
************************* Draw *********************
*/

void draw(){
  background(255);

 
/*
************************* Waypoints *********************
*/

  if ((mousePressed) && (wp>=0)) {
    //waypoints 
   
     WayPx = expand(WayPx,WayPx.length +1); //infinitley expands array for new Waypoints
     WayPy = expand(WayPy,WayPy.length +1);  
      WayPx[wp] = mouseX;
      WayPy[wp] = mouseY;
      
      noFill();
  
  println("Point Number."+wp);    
  println(WayPx[wp] + " , " + WayPy[wp]);    
  
  wp++ ;  //advance the index position
  
  delay(100); // delays recording a new waypoint to account for sticky mice.
   if (wp >=4) {
     println("press 'g' to activate car");
   
 }
    }
 
 frame++;  //progresses the frame along with framerate

/*
************************* Redraw Waypoints and Lines  *********************
*/
 path();
 WayPoints();
 
 
 
 // these below have been transfered into void functions down lower 
//if (wp>=1){
//
//   //forstructure draws points
//for (int i = 0; i < WayPx.length; i++ ){
// ellipse(WayPx[i],WayPy[i],4,4);
//}  
//  //forstructure redraws the lines
//for (int i = 1; i < WayPx.length; i++ ){
// line(WayPx[i-1],WayPy[i-1],WayPx[i],WayPy[i]);
//}
//}

/*
************************* Bot Movement *********************
*/
// Animate only kicks in when "g" is pressed. 


if (Animate >= 1) {
 targetX = WayPx[Animate];
 targetY = WayPy[Animate];

  //targetX = mouseX;
  float dx = targetX - Bx;
  if (abs (dx) > 1) {
  Bx += dx * easing;
  }

  //targetY = mouseY;
  float dy = targetY - By;
  if (abs(dy) > 1) {
  By += dy * easing;
  } 
  
  bot2(Bx,By,Animate);
  
   if (((abs(targetX-Bx)) < 4) && ((abs(targetY-By)) < 4)) {
     if (Animate < wp-1) {
    Animate++;
    } 
   }
  }
//}
/*
************************* Bot Placement  *********************
*/

if ((Animate == 0) && (wp >= 2)) {
//if g is not pressed, and wp is higher than one place bot at first waypoint
 Bx = WayPx[0];
 By = WayPy[0];
bot1(Bx,By);


 }
}

/*
************************* Functions *********************
*/

void keyPressed () { 
  if (key == 'g') {
//  if (key == CODED) {
//    if (keyCode == UP) {
println("press 's' to stop");

Animate++;
delay(100);
  
}



//  if (key == 's') {
////  if (key == CODED) {
////    if (keyCode == UP) {
//println("press 'r' to resume");
//
//Animate = 1;
//
//  
//}
//
//
//  if (key == 'r') {
////  if (key == CODED) {
////    if (keyCode == UP) {
//println("press 's' to stop");
//
//Animate = 1;
//}
}

/*
************************* DrawPath *********************
*/

void path () {
  beginShape();
  for (int i = 0; i < WayPx.length; i++) {
    vertex(WayPx[i], WayPy[i]);
  }
  endShape();
}

/*
************************* DrawPoints *********************
*/

void WayPoints() {

for (int i = 0; i < WayPx.length; i++ ){
 ellipse(WayPx[i],WayPy[i],4,4);
}  
}

/*
************************* Bot movement *********************
*/

//void botmove() {
//  float targetX,targetY;
//  float easing = 0.04;
//  float Dir;
//  
//  //forstructure selects way points to send car to
//  for (int i = 1; i < WayPx.length; i++ ){
//     targetX = WayPx[i];
//     targetY = WayPy[i];
//     
//  }
//  
//}
/*
************************* intial bot placement *********************
*/  

void bot1(float x,float y){
  pushMatrix();
  translate(x, y);
  float a = atan2(WayPy[1]-y,WayPx[1]-x); // rotates car to face first way point
  
  //float a = atan2(mouseY-y,mouseX-x); // rotates bot to face mouse location. 
  rotate(a);
  rectMode(CENTER);
  botBody(0,0);
  popMatrix();
}
/*
************************* Moving bot *********************
*/

void bot2(float x, float y,int A){
    
// Can I use a for structure for this?   
//for (int i = 1 ; i > WayPx.length; i ++) {
   
  
  pushMatrix();
  translate(x,y);
  float a = atan2(WayPy[A]-y,WayPx[A]-x); // rotates car to face first way point
  
  //float a = atan2(mouseY-y,mouseX-x); // rotates bot to face mouse location. 
  rotate(a);
  //rectMode(CENTER);
  botBody(0,0);
  popMatrix();
  
 

}



/*
************************* Bot Object (body,wheels, etc..) *********************
*/

void botBody (float x,float y){

pushMatrix();
translate(x,y);
//pushMatrix();
rotate(-PI/2);
rectMode(CENTER);
fill(100);
rect(0,0,30,60);
beginShape(LINES); //wheel axles
  vertex(-18,25);
  vertex(-15,25);
  vertex(15,25);
  vertex(18,25);
  vertex(-18,-25);
  vertex(-15,-25);
  vertex(15,-25);
  vertex(18,-25);
 endShape();
 
 
beginShape(TRIANGLES); //DIRECTION MARKER
  fill(255);
 vertex(0,25);
  vertex(-5,20);
  vertex(5,20);
  
endShape();
noFill();
botFwheel(-18,25,-1);
botFwheel(18,25,1);
botRwheels(0,-25,1);  
popMatrix();
//popMatrix();

}


void botFwheel(float x,float y,float RL){
  pushMatrix();
  translate(x, y);
  //TODO - notworking yet
  //rotate wheels to get them to point in the direction you want
  //float a = atan2(mouseY-y, mouseX-x);
  //rotate(a);
  rectMode(CENTER);
  fill(100);
  rect(5*RL,0, 10*RL, 20);
  popMatrix();
}

void botRwheels(float x, float y, float Dir){
  pushMatrix();
  translate(x,y);
  rectMode(CENTER);
  rect(-24,0,10,20);
  rect(24,0,10,20);
  noFill();
  popMatrix();
  
}


