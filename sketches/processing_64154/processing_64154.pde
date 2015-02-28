
float[] x=new float[200];
float[] y=new float[200];
float[] spd=new float[200];
float d=100;
float a=0;
float health=0;
int time=0;
int chrono=0;

//import ddf.minim.*;
//Minim minim;
//AudioSample dubwub;

void setup() {
  size(500, 500);
  background(0);
  strokeWeight(5);

//minim= new Minim(this);
//dubwub = minim.loadSample("dubwub.mp3",2048);


  fill(255);
  int i =0;
  while (i<100) {
    x[i]=random(width);
    y[i]=random(height);
    spd[i]=random(1, 5);
    i=i+1;
    
  }
  //Plays music way to epic for this game
  //dubwub.trigger();
  noCursor();
}
void draw() {

  background(0);




  fill(255);
  stroke(255);






  int i =0;

  while (i<200) {



    ellipse(x[i], y[i], spd[i]*2, spd[i]*2);
    x[i]=x[i]-spd[i];
    if (x[i]<0) {
      x[i]=width;
    }
    i=i+1;
  }
time=time+1;


  if (time>=60) {
    time=0;
    chrono=chrono+1;
  }
  fill(0,255,0);
textSize(20);
text(chrono,400,50);



  noStroke();
  fill(255, 0, 0);
  rect(0, 0, 20, height);


  fill(0);
  rect(0, 0, 20, health);
  noFill();
  stroke(0, 255, 0);


  float enemyX=noise(a, 10)*width;
  float enemyY=noise(a, 20)*height;
  float distance=dist(enemyX, enemyY, mouseX, mouseY);


  ellipse(mouseX, mouseY, d, d);
  ellipse(mouseX, mouseY, d-20, d-20);
  ellipse(mouseX, mouseY, d-50, d-50);
  ellipse(mouseX, mouseY, d-70, d-70);
  ellipse(mouseX, mouseY, d-90, d-90);
  stroke(255, 0, 0);
  ellipse(enemyX, enemyY, d, d);

  if (distance <= 100) {
    strokeWeight(10);
    health=health+5;
  }
  else {
    strokeWeight(5);
  }

  if (health>height-10) {


time=time-9001;
    fill(0, 200);
    rect(0, 0, width, height);
    fill(255, 0, 0);
    textSize(50);
    text("GAME OVER", 100, 250);
    fill(0,255,0);
    text(chrono,230,300);
  }


  a=a+0.01;
  
  
}

//void stop(){
  //dubwub.close();
 // minim.stop();
  //super.stop();
//}
