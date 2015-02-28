
Teacher[] teachers = new Teacher[0];
Football[] footballs = new Football[0];
int score = 0;
PImage teacherimage;
PImage rulerimage;
PImage footballimage;
boolean visible= false;
PImage img;
boolean gameOver= false;


void setup() {
  size(600, 400);
  teacherimage = loadImage ("teacher.png");
  rulerimage = loadImage ("ruler.png");
  footballimage = loadImage ("football.png");
  img = loadImage("blackboard.png");
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  background(img);
  fill(255);
  text("SCORE:" + score, 60, 50);

  if (!gameOver) {


    if (frameCount % 60 == 0) {
      Teacher teach = new Teacher();
      teachers = (Teacher[]) append(teachers, teach);
      Football foot = new Football();
      footballs = (Football[]) append(footballs, foot);
    }


    if (teachers.length>4) {

      teachers = (Teacher[]) subset(teachers, 1);
    }

    if (footballs.length>5) {
      footballs = (Football[]) subset (footballs, 1);
    }

    for (int i = 0; i<teachers.length; i++) {
      teachers[i].update();
      footballs[i].update();
    }


    image(rulerimage, mouseX-50, mouseY-50);
  }

    else{
    fill(255);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    if (keyPressed == true) {
     
    }
  }
}

void mousePressed() {
  for (int i = 0; i<teachers.length; i++) {
    Teacher teach = teachers[i];

    if ((mouseX>teach.x) && (mouseX<teach.x + teach.w) && (mouseY>teach.y) && (mouseY<teach.y+teach.h)) {
      teach.alive = false;
      score++;
    }
  }

  for (int i = 0; i<footballs.length; i++) {
    Football foot = footballs[i];

    if ((mouseX>foot.x) && (mouseX<foot.x + foot.w) && (mouseY>foot.y) && (mouseY<foot.y+foot.h)) {
      foot.alive = false;
      score++;
    }
  }
}



// name of class = Teacher, the properties for the teacher  
class Teacher {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  boolean alive;

  float showimage;


  //constructor = this is run when called 
  Teacher() {

    y = random(20, 200);
    w = 130;
    x = random (100, 400);
    h = 130;
    velY= 1;
    //velX = -4;
    alive = true;
  } 


  void update() {
    x+=velX;
    if (!alive) {
      x=-1000;
    }

    image(teacherimage, x, y, w, h);
  }
}

class Football {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  boolean alive;
  float showimage;

  Football() {

    y = random(20, 200);
    w = 50;
    x = random (20, 300);
    h = 50;
    velY= 1;
    //velX = -4;
    alive = true;
  } 


  void update() {
    x+=velX;
    if (!alive) {
      gameOver=true;
    }
    image(footballimage, x, y, w, h);
    fill(244,0);
    rect(x, y, 30, 30 );
  }
}


