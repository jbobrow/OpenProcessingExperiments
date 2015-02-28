
//these are called global variables, they apply to the whole program
//integers (whole number)

int radius = 150;
int a =5;
int d =5;
int sizes=20;
int counter;

void setup () {
  
  size (450,450);
  background (255);
  smooth();
  counter=0;
  
}

void draw () {
  
   counter++;
   stroke(1);
  fill(random(255),100,255,95);
  if (key =='s') {
    noLoop();
    saveFrame();
    
  }
  
}

void mouseDragged() {
  fill(random(255),random(255),random(255),75);
   ellipse(mouseX+random(30),mouseY+random(30),random(40), random(40));
     fill(random(255),random(255),random(255),90);
  ellipse(mouseX+random(30),mouseY+random(30),random(40), random(40));
  stroke(random(10,50),random(10,50),random(10,50),30);
  line(mouseX,mouseY+20,mouseX+50,mouseY+50);
}


                                
