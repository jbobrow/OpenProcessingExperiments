
DominoEffect [] dominos= new DominoEffect[50];
Ball myBall;
Timer timer;
boolean time;
int totalFall=0;
void setup() {
  size(900, 500, P3D);
  frameRate(30);
  beginCamera();
  rotateZ(radians(30));
  rotateY(radians(0));          //-30 optional
  rotateX(radians(-30));
  endCamera();
  myBall= new Ball();
  timer=new Timer(100);
  //timer.start();

  for (int i=0; i< dominos.length;i++) {
    dominos[i]=new DominoEffect(369, 200, 100, 100, 1, 40, 40, i*-80);
      
  }
 //timer.start();
}
void draw() {
 
  background(0);
 // println(mouseX);
 // println(mouseY);
  myBall.circledisplay();
  myBall.move();
  myBall.circlestop();
 
  for (int i=0;  i< dominos.length;i++) { 

    
    if (timer.isFinished() && time == true) {
     
       dominos[totalFall].knockdown();
       println("it's finished and we're falling");
     
     
        println("total fall: " + totalFall);
      
    totalFall++;
    if (totalFall>=dominos.length) {
        //totalFall++;
      totalFall=0;
    }
    timer.start();
    //dominos[totalFall].knockdown();
    //totalFall++;
    }
  
  
    
    //for (int i=0;  i< dominos.length;i++) {  
      //dominos[totalFall].knockdown();
      dominos[i].collision(myBall);
      dominos[i].display();
      //dominos[i].dominosRotate();


      if ( dominos[i].intersection ==true&& time == false) {
        timer.start();
        time = true;
        println("intersect");
        myBall.highlight();
        totalFall = 0;
        //dominos[i].knockdown();
      }
    }}
  


// the boolean trigger
//if(dominios1[dominos.length - 1].knockdown)){
//trigger the next group
// dominos2[0].fall();
//}





class Ball {
  float r;
  float ellipsex;
  float ellipsey;
  float ellipsew;
  float ellipsel;
  float speed;
  //boolean circlstop;
  color c;
  Ball() {
    ellipsex=0;
    ellipsey=200;
    ellipsew=100;
    ellipsel=100;
    speed=1;
    c=color (255, 50);
  }
  void circledisplay() {
    fill(c);
    ellipse(ellipsex, ellipsey, ellipsew, ellipsel);
    c=color (255, 50);
  }

  void move() {
    ellipsex=ellipsex+speed;
  }
  void highlight() {
    c= color(0, 150, 45);
  }
  void circlestop() {
    //theta=90;
    if (myBall.ellipsex>369) {
      myBall.ellipsex=369;
      //theta=90;
    }
    
  }
}

class DominoEffect {
  boolean knockdown;
  int rectx;
  int recty;
  int rectw;
  int rectl;
  int speed;
  int ellispel;
  int ellipsew;
  int rectz;
  boolean intersection;
  int theta;
  //boolean  


  DominoEffect(int tempx, int tempy, int tempw, int templ, int tempspeed, int tempellispeW, int tempellispeL, int tempz) {
    rectx=tempx;
    recty=tempy;
    rectw=tempw;
    rectl= templ;
    speed= tempspeed;
    //theta=90;
    rectz=tempz;
  }

  void display() {
    fill(255);
    pushMatrix();
    translate(rectx, recty, rectz);
    rotateX(radians(theta));
    rectMode(CENTER);
    rect(0, 0, rectw, rectl);
    popMatrix();
  }
  
  void dominosRotate() {
    theta++;
  }
  void collision (Ball myBall) {

    float distance= dist(rectx, recty, myBall.ellipsex, myBall.ellipsey);

    if (distance < myBall.ellipsew/2 + rectw/2) {

      intersection = true;
    }

    else {
      intersection = false;
    }
  }


  void knockdown() {

 // if (intersection==369) {
    theta=90;
//  }
//  else{
//    //speed=0;
//  }

}}





class Timer{
  int savedTime;
  int totalTime;
  Timer(int tempTotalTime){
  totalTime=tempTotalTime;
  }
  void start (){
    savedTime=millis();
  }
  boolean isFinished(){
    int passedTime= millis()-savedTime;
    if(passedTime >totalTime){
      return true;
    }else{
      return false;
    }
  }
}



