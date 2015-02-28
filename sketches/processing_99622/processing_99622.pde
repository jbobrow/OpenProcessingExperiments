

class Holder {
  boolean on;
  boolean match;
  int rectx;
  int rectw;
  int r;
  int id;
  int recth;
  PImage animal;
  Holder(int tempX, int tempr, PImage tempI, int tempid) {


    rectx=tempX;

    r=tempr;

    rectw=100;

    recth=100;

    animal=tempI;

    id=tempid;
  }

  void display() {

    if (on) {

    image(animal, rectx, r, rectw, recth);
    }

    else {

      fill(0);

      rect(rectx, r, rectw, recth);
    }
  }

  void click() {

    if (mouseX>rectx&&mouseX<rectx+rectw&&mouseY>r&&mouseY<r+recth) {
             on=!on;
    }
  }

  void check(Holder m) {
    if (id==m.id) {
      match=true;
   println("match");
    m.match=true;
    }
    if(match==true){
      println("score");
   score++;
   fill(100, 200, 255);
   rect(rectx, r, rectw, recth);
   
   }
   
    
}
}
class Timer {
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    savedTime = millis();
  }

    boolean isFinished() { //returns true if totalTime has passed (which you delcare when you make a new timer object)
      // Check how much time has passed 
     
      int passedTime = millis()  -savedTime; 
      if (passedTime > totalTime) {
         println("go");
        return true;   
      } 
      else {
        return false;
      }
    }
  }

int rows = 5;
int columns =5;
int num=0;
int state=0;
int id=0;
int score;
int mouseclicks;
Timer tiempo;
Holder[] slides=new Holder [rows*columns];
PImage[] foto=new PImage[6];

void setup() {
  size(675, 650);
  tiempo= new Timer(1000); // 1k= 1 second
  // tiempo.start();
  for (int i=0;i<foto.length;i++) {
    foto[i]=loadImage("foto "+ i +".jpg");
  }



  for (int i = 0 ; i<rows;i++) {

    for (int j= 0; j <columns; j++) {

      int id= int (random(foto.length));

      slides[num]= new Holder(i*125+25, j*125+25, foto[id], id);
      num++;
    }
  }
}

void draw() {
text(score, 300, 350);
  background(100, 200, 255);
  for (int i=0; i<slides.length;i++) {
    slides[i].display();
  }

  if (tiempo.isFinished() && mouseclicks ==2) {
    for (int i=0; i<slides.length;i++) {
      //        println("1++");
      slides[i].on = false;
    }
    mouseclicks = 0;
  }
  for (int i=0; i<slides.length;i++) { ///match for loop
    if (slides[i].on==true) {
      for (int m=0; m<slides.length;m++) {
        if (slides[m].on==true) {
          if (i!=m) {
            slides[i].check(slides[m]);
          }
        }
      }
    }
  }
}

void mousePressed() {
  if (mouseclicks==2) {
    tiempo.start();
  }

  for (int i = 0 ; i<slides.length;i++) {
    slides[i].click();
  }


  mouseclicks++;
  println(mouseclicks);
  println("click");
  if (mouseclicks ==2) {
    tiempo.start();
  }
}



