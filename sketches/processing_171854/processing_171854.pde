

boolean alive = true;
int lives = 3;

//cars
Muscle_Car[] mustangs = new Muscle_Car[3];
Muscle_Car[] mustangDuo = new Muscle_Car[2]; 
Truck[] fords = new Truck[2];
Truck[] fordsDuo = new Truck[2];
Hatchback[] minicoopers = new Hatchback[4];
Hatchback[] minicooperSolo = new Hatchback[1];
SUV[] rangeRover = new SUV[3];
SUV[] rangeRoverSolo = new SUV[1];
Ferrari[] california = new Ferrari[1];

//logs
Logs1[] logs1 = new Logs1[3];
Logs2[] logs2 = new Logs2[2];
Logs3[] logs3 = new Logs3[4];

//turtles
Turtle[] turtles1 = new Turtle[3];
Turtle[] turtles2 = new Turtle[3];
Turtle[] turtles3 = new Turtle[3];
Turtle[] turtles4 = new Turtle[3];
//DivingTurtle[] divingTurtles2 = new DivingTurtle[3];

//frog
Frog jake;

void setup(){
  size(600,600);
  jake = new Frog(width/2,540);
  float x = 0;
  for(int i = 0; i < mustangs.length; i++){
    mustangs[i] = new Muscle_Car(x,488);
    x+=110;
  }
  for(int i = 0; i < mustangDuo.length; i++){
    mustangDuo[i] = new Muscle_Car(x+80,488);
    x+=110;
  }
  for(int i = 0; i < fords.length; i++){
    fords[i] = new Truck(x,406);
    x -= 130;
  }
  for(int i = 0; i <fordsDuo.length; i++){
    fordsDuo[i] = new Truck(x-120,406);
    x-=130;
  }
  for(int i = 0; i < minicoopers.length; i++){
    minicoopers[i] = new Hatchback(x,368);
    x += 90;
  }
  for(int i = 0; i < minicooperSolo.length; i++){
    minicooperSolo[i] = new Hatchback(x+140,368);
    x += 90;
  }
  for(int i = 0; i < rangeRover.length; i++){
    rangeRover[i] = new SUV(x,446);
    x -= 120;
  }
  for(int i = 0; i < rangeRoverSolo.length; i++){
    rangeRoverSolo[i] = new SUV(x-140,446);
    x -= 120;
  }
  for(int i = 0; i < california.length; i++){
    california[i] = new Ferrari(x,320);
    x += 400;
  }
  for(int i = 0; i < logs2.length; i++){
    logs2[i] = new Logs2(x,208);
    x -= 200;
  }
  for(int i = 0; i < logs1.length; i++){
    logs1[i] = new Logs1(x,168);
    x += 160;
  }
  for(int i = 0; i < logs3.length; i++){
    logs3[i] = new Logs3(x,88);
    x -= 120;
  }
  for(int i = 0; i < turtles1.length; i++){
    turtles1[i] = new Turtle(x,140);
    x += 100;
  }
  for(int i = 0; i < turtles2.length; i++){
    turtles2[i] = new Turtle(x,260);
    x -= 100;
  }
  for(int i = 0; i < turtles3.length; i++){
    turtles3[i] = new Turtle(x+600,140);
    x-=100;
  }
  for(int i = 0; i < turtles4.length; i++){
    turtles4[i] = new Turtle(x+1000,260);
    x-=100;
  }
}

void draw(){
  drawFroggerBackground();
  if(lives == 0){
      alive = false;
    }
    if(lives == 1){
      noStroke();
      fill(0,255,0);
      ellipse(100,580,20,20);
    }
    if(lives == 2){
      noStroke();
      fill(0,255,0);
      ellipse(100,580,20,20);
      ellipse(150,580,20,20);
    }
    if(lives == 3){
      noStroke();
      fill(0,255,0);
      ellipse(100,580,20,20);
      ellipse(150,580,20,20);
      ellipse(200,580,20,20);
    }
    if(jake.y < 280 && jake.y > 80){
    alive = false;
  }
    for(int i = 0; i < logs2.length; i++){
    logs2[i].move();
    logs2[i].display();
    if(logs2[i].didHitFrog(jake.x,jake.y)){
      jake.x += logs2[i].speed;
      jake.y = logs2[i].y+13;
      alive = true;
      break;
      }
    }
    
    for(int i = 0; i < logs1.length; i++){
      logs1[i].move();
      logs1[i].display();
      if(logs1[i].didHitFrog(jake.x,jake.y)){
        jake.x -= logs1[i].speed;
        jake.y = logs1[i].y+13;
        alive = true;
        break;
      }
}
      for(int i = 0; i < logs3.length; i++){
        logs3[i].move();
        logs3[i].display();
        if(logs3[i].didHitFrog(jake.x,jake.y)){
          jake.x += logs3[i].speed;
          jake.y = logs3[i].y+13;
          alive = true;
          break;
        }
      }
      for(int i = 0; i < turtles1.length; i++){
        turtles1[i].move();
        turtles1[i].display();
        if(turtles1[i].didHitFrog(jake.x,jake.y)){
          jake.x += turtles1[i].speed;
          jake.y = turtles1[i].y;
          alive = true;
          break;
        }
      }
      for(int i = 0; i < turtles3.length; i++){
        turtles3[i].move();
        turtles3[i].display();
        if(turtles3[i].didHitFrog(jake.x,jake.y)){
          jake.x += turtles3[i].speed;
          jake.y = turtles3[i].y;
          alive = true;
          break;
        }
      }
      for(int i = 0; i < turtles2.length; i++){
        turtles2[i].move();
        turtles2[i].display();
        if(turtles2[i].didHitFrog(jake.x,jake.y)){
          jake.x += turtles2[i].speed;
          jake.y = turtles2[i].y;
          alive = true;
          break;
        }
      }
      for(int i = 0; i < turtles4.length; i++){
        turtles4[i].move();
        turtles4[i].display();
        if(turtles4[i].didHitFrog(jake.x,jake.y)){
          jake.x += turtles2[i].speed;
          jake.y = turtles2[i].y;
          alive = true;
          break;
        }
      }
  jake.display();
    if (key == 'g') {
      drawGridlines();
    }
  for(int i = 0; i < mustangs.length; i++){
    mustangs[i].move();
    mustangs[i].display();
    if(mustangs[i].didHitFrog(mustangs[i].x,mustangs[i].y,jake.x,jake.y)){
      print("Squish");
      alive = false;
    }
  }
  for(int i = 0; i < mustangDuo.length; i++){
    mustangDuo[i].move();
    mustangDuo[i].display();
    if(mustangDuo[i].didHitFrog(mustangDuo[i].x,mustangDuo[i].y,jake.x,jake.y)){
      print("Squish");
      alive = false;
    }
  }
  for(int i = 0; i < fords.length; i++){
    fords[i].move();
    fords[i].display();
    if(fords[i].didHitFrog(fords[i].x,fords[i].y,jake.x,jake.y)){
      print("Squish");
      alive = false;
  }
  }
  for(int i = 0; i < fordsDuo.length; i++){
    fordsDuo[i].move();
    fordsDuo[i].display();
    if(fordsDuo[i].didHitFrog(fordsDuo[i].x,fordsDuo[i].y,jake.x,jake.y)){
      print("Squish");
      alive = false;
    }
  }
  for(int i = 0; i < minicoopers.length; i++){
    minicoopers[i].move();
    minicoopers[i].display();
    if(minicoopers[i].didHitFrog(minicoopers[i].x,minicoopers[i].y,jake.x,jake.y)){
      print("Squish");
      alive = false;
  }
  }
  for(int i = 0; i < rangeRover.length; i++){
    rangeRover[i].move();
    rangeRover[i].display();
    if(rangeRover[i].didHitFrog(rangeRover[i].x,rangeRover[i].y,jake.x,jake.y)){
      print("Squish");
      alive = false;
  }
  }
  for(int i = 0; i < rangeRoverSolo.length; i++){
    rangeRoverSolo[i].move();
    rangeRoverSolo[i].display();
    if(rangeRoverSolo[i].didHitFrog(rangeRoverSolo[i].x,rangeRoverSolo[i].y,jake.x,jake.y)){
      print("Squish");
      alive = false;
  }
  }
  for(int i = 0; i < minicooperSolo.length; i++){
    minicooperSolo[i].move();
    minicooperSolo[i].display();
    if(minicooperSolo[i].didHitFrog(minicooperSolo[i].x,minicoopers[i].y,jake.x,jake.y)){
      print("Squish");
      alive = false;
    }
  }
  for( int i = 0; i < california.length; i++){
    california[i].move();
    california[i].display();
    if(california[i].didHitFrog(california[i].x,california[i].y,jake.x,jake.y)){
      print("Squish");
      alive = false;
    }
  }
  if (alive == false && lives > 0) {
    jake.y = 540;
    lives -= 1;
    alive = true;
  }
  if(alive == false && lives <= 0){
    textSize(80);
    fill(255,0,0);
    text("You Lose", 140, height/2);
    noLoop();
  }
}
void keyPressed(){
  if(key == 'w'){
    jake.y -= 40;
  }
  if(key == 's'){
    jake.y += 40;
  }
  if(key == 'a'){
    jake.x -= 40;
  }
  if(key == 'd'){
    jake.x +=40;
  }
}

void drawFroggerBackground(){
  rectMode(CORNER);
  noStroke();
  //safe zone
  fill(35,240,90);
  rect(0,0,width,80);
  //safe zone sqaures
  fill(66,139,247);
  rect(30,20,60,60);
  rect(150,20,60,60);
  rect(270,20,60,60);
  rect(390,20,60,60);
  rect(510,20,60,60);
  rect(630,20,60,60);
  //water
  fill(66,139,247);
  rect(0,80,width,200);
  //lilypads
fill(35,240,90);         
noStroke();
ellipse(60,50,40,45);
ellipse(180,50,40,45);
ellipse(300,50,40,45);
ellipse(420,50,40,45);
ellipse(540,50,40,45);

fill(66,139,247);
triangle(60,50,57,80,63,80);
triangle(180,50,150,25,150,31);
triangle(300,50,290,20,305,20);
triangle(420,50,440,30,445,40);
triangle(540,50,525,100,555,100);
  
  rect(640,30,40,40);
  //middle safe zone
  fill(0);
  rect(0,280,width,40);
  //street
  fill(128,128,128);
  rect(0,320,width,200);
  //starting level
  fill(0);
  rect(0,520,width,40);
  //lives box
  fill(255);
  rect(0,560,width,40);
  for(int x = 10; x < width; x += 60){
    for(int y = 360; y < 520; y += 40){
       stroke(255,255,0);
       strokeWeight(2);
       line(x,y,x+20,y);
    }
  }
  //score
  fill(0);
  text("Lives: ", 50,580);
}

void drawGridlines(){
  for(int x = 0; x <= width; x += 40){
    for(int y = 0; y <= height; y += 40){
    rectMode(CORNER);
    noFill();
    stroke(255);
    rect(x,y,40,40);
    }
  }
}



class Car{
 
  float x,y;
  float speed;
  
  Car (float nx, float ny){
    x = nx;
    y = ny;
    speed = 2;
  }
  
  void move(){
    x += speed;
    if (x > width) x = -100;
    else if (x < -100) x = width;
  }
  
  boolean didHitFrog(float cx, float cy, float fx, float fy){
    float distX = cx+25-fx;
    float distY = cy+12-fy;
    if(abs(distX) < 35 && abs (distY) < 30){
      return true;
    }
    else return false;
  }
  
  void display(){
    rect(x,y,10,10);
  }
  
}


class Ferrari extends Car{
  
  Ferrari(float nx, float ny){
    super(nx,ny);
    speed = 10;
  }
  
  void move(){
    x -= speed;
    if (x < -100) x = 700;
    else if (x > 700) x = 700;
  }
  
    boolean didHitFrog(float cx, float cy, float fx, float fy){
    float distX = cx+25-fx;
    float distY = cy+12-fy;
    if(abs(distX) < 35 && abs (distY) < 30){
      return true;
    }
    else return false;
  }
  
  void display(){
    //boundary
    fill(255);
    rect(x,y,60,30);
  }
}

class Frog{
  
  float x,y;
  
  color c;
  
  Frog(float nx, float ny){
    x = nx;
    y = ny;
    c = color (135,255,65);
  }
  
  void display(){
   //body
    ellipseMode(CENTER);
    strokeWeight(15);
    stroke(c);
    line(x,y+3,x,y-6);
   //front right arm
   stroke(c);
   strokeWeight(3);
    line(x+7.5,y-3.75,x+12,y-3.75);
    line(x+12,y-3.75,x+12,y-12);
    line(x+12,y-9.75,x+15,y-9.75);
   //left front arm
    line(x-7.5,y-3.75,x-12,y-3.75);
    line(x-12,y-3.75,x-12,y-12);
    line(x-12,y-9.75,x-15,y-9.75);
   //left bottom leg
    line(x-7.5,y+3.75,x-12,y+3.75);
    line(x-12,y+3.75,x-12,y+12.75);
    line(x-12,y+9.75,x-15,y+9.75);
   //right bottom leg
    line(x+7.5,y+3.75,x+12,y+3.75);
    line(x+12,y+3.75,x+12,y+12.75);
    line(x+12,y+9.75,x+15,y+9.75);
   //eyes
    noStroke();
    fill(255,0,0);
    ellipse(x+5.25,y-7.5,6,6);
    ellipse(x-5.25,y-7.5,6,6);
  }
  
}


class Hatchback extends Car{
  
  Hatchback(float nx, float ny){
    super(nx,ny);
  }
  
  void move(){
    x -= speed;
    if (x < -100) x = 700;
    else if (x > 700) x = 700;
  }
  
    boolean didHitFrog(float cx, float cy, float fx, float fy){
    float distX = cx+16-fx;
    float distY = cy+12-fy;
    if(abs(distX) < 35 && abs (distY) < 30){
      return true;
    }
    else return false;
  }
  
  void display(){
   //wheels
    fill(153,0,0);
    rect(x+6,y-1,5,28);
    rect(x+26,y-1,5,28);
   //body
    fill(185,32,32);
    rect(x,y,35,25);
   //hood stripes
    fill(255,253,208);
    rect(x+11,y+6,-11,3);
    rect(x+11,y+15,-11,3);
   //interior
    fill(255,218,185);
    rect(x+33,y+2,-21,21);
   //top
    fill(255,253,208);
    rect(x+33,y+2,-16,21);
   //windshield
    fill(0,0,255,30);
    rect(x+17,y+2,-5,21);
   //headlights
    fill(255,255,0);
    ellipse(x,y+3,3,6);
    ellipse(x,y+22,3,6);
  }
}

class Log{
  
  float x,y;
  float speed;
  
  Log(float nx, float ny){
    x = nx;
    y = ny;
    speed = 1;
  }
  
  void move(){
    x += speed;
    if (x > width) x = -130;
    else if (x < -130) x = -130;
  }
  
    boolean didHitFrog(float fx, float fy) {
      float distX = x+50 - fx;
      float distY = y - fy;
      if(abs(distX) < 60 && abs (distY) < 26){
        return true;
      }
      else return false;
    }
  
  void display(){
    fill(102,51,0);
    stroke(0);
    strokeWeight(1);
    ellipse(x,y+13,10,25);
    noStroke();
    rect(x,y,120,26);
    stroke(0);
    strokeWeight(1);
    ellipse(x+120,y+13,10,25);
  }
  
}

class Logs1 extends Log{
  
  Logs1(float nx, float ny){
    super(nx,ny);
  }
  
  void move(){
    x -= speed;
    if (x < -100) x = 700;
    else if (x > 700) x = 700;
  }
  
      boolean didHitFrog(float fx, float fy) {
      float distX = (x+60) - fx;
      float distY = y - fy;
      if(abs(distX) < 40 && abs (distY) < 26){
        return true;
      }
      else return false;
    }
  
  void display(){
    fill(102,51,0);
    stroke(0);
    strokeWeight(1);
    ellipse(x+80,y+13,10,25);
    noStroke();
    rect(x,y,80,26);
    stroke(0);
    strokeWeight(1);
    ellipse(x,y+13,10,25);
  }
  
}

class Logs2 extends Log{
  
  Logs2(float nx, float ny){
    super(nx,ny);
    speed = 1;
  }
  
  void move(){
    super.move();
  }
  
  void display(){
    super.display();
  }
  
}

class Logs3 extends Log{
  
  Logs3(float nx, float ny){
    super(nx,ny);
    speed = 3;
  }
  
  void move(){
    super.move();
  }
  
      boolean didHitFrog(float fx, float fy) {
      float distX = x - fx;
      float distY = y -fy;
      if(abs(distX) < 20 && abs (distY) < 26){
        return true;
      }
      else return false;
    }
  
  void display(){
    fill(102,51,0);
    stroke(0);
    strokeWeight(1);
    ellipse(x,y+13,10,25);
    noStroke();
    rect(x,y,40,26);
    stroke(0);
    strokeWeight(1);
    ellipse(x+40,y+13,10,25);
  }
  
}

class Muscle_Car extends Car{
  
  Muscle_Car(float nx, float ny){
    super( nx,  ny);
    speed = 3;
  }
  
  void move(){
    super.move();
  }
  void display(){
    if(x > width) x = -50;
   //interior
    fill(225,228,196);
    rect(x+5,y,40,25);
   //top
    fill(255,0,0);
    rect(x+10,y+2,20,21);
   //left fin
    fill(230,0,0);
    rect(x-5,y,55,2);
   //right fin
    rect(x-5,y+23,55,2);
   //rear windshield
    fill(205,201,201,50);
    rect(x+10,y+2,-5,21);
   //trunk
    fill(204,0,0);
    rect(x+5,y+2,-5,21);
   //front windshield
    fill(205,201,201,50);
    rect(x+30,y+2,5,21);
   //hood
    fill(230,0,0);
    rect(x+35,y+2,13,21);
   //stripes
    fill(0);
    rect(x+37,y+9,11,3);
    rect(x+37,y+13,11,3);
    rect(x+11,y+9,19,3);
    rect(x+11,y+13,19,3);
    rect(x+5,y+9,-5,3);
    rect(x+5,y+13,-5,3);
   //headlights
    noStroke();
    fill(255,255,0);
    ellipse(x+50,y+6,2,8);
    ellipse(x+50,y+19,2,8);
  }
}

class SUV extends Car{
  
  SUV(float nx, float ny){
    super(nx,ny);
    speed = 3;
  }
  
  void move(){
    x -= speed;
    if (x < -100) x = 700;
    else if (x > 700) x = 700;
  }
  
  boolean didHitFrog(float cx, float cy, float fx, float fy){
    float distX = cx+16-fx;
    float distY = cy+12-fy;
    if(abs(distX) < 35 && abs (distY) < 30){
      return true;
    }
    else return false;
  }
  
  void display(){
    //boundary
    fill(255);
    rect(x,y,60,30);
    //top
    fill(30,30,130);
    rect(x+30,y+2,30,26);
    //front windshield
    fill(0,0,255,50);
    triangle(x+30,y+2,x+21,y,x+21,y+2);
    triangle(x+30,y+28,x+21,y+30,x+21,y+28);
    rect(x+21,y+2,9,26);
    //hood
    fill(25,25,90);
    rect(x,y+2,22,26);
    triangle(x+22,y+2,x+22,y,x,y+2);
    triangle(x+22,y+28,x+22,y+30,x,y+28);
  }
  
}

class Truck extends Car{
  
  Truck(float nx, float ny){
    super(nx ,ny);
  }
  
  void move(){
    super.move();
  }
  
  boolean didHitFrog(float cx, float cy, float fx, float fy){
    float distX = cx+30-fx;
    float distY = cy+13-fy;
    if(abs(distX) < 50 && abs (distY) < 13){
      return true;
    }
    else return false;
  }
  
  void display(){
   //back wheels
    fill(0,100,0);
    rect(x+10,y-2,10,32);
   //front wheels
    rect(x+40,y-2,10,32);
   //hood
    fill(30,120,60);
    rect(x+46,y+4,15,20);
    triangle(x+46,y+4,x+46,y+1,x+61,y+4);
    triangle(x+46,y+27,x+46,y+24,x+61,y+24);
   //back
    noStroke();
    fill(30,120,60);
    rect(x,y+2,30,24);
   //bed
    fill(192);
    rect(x+2,y+4,25,20);
   //top
    fill(30,120,60);
    rect(x+32,y+1,14,26);
   //clasp
    fill(80);
    rect(x+29,y+8,2,12);
   //front windshield
    fill(255,228,185);
    rect(x+46,y+2,5,24);
    fill(0,0,255,30);
    rect(x+46,y,5,28);
  }
}

class Turtle{
  
  float x,y;
  float speed;
  
  Turtle(float nx, float ny){
    x = nx;
    y = ny;
    speed = -2;
  }
  
  void move(){
    x += speed;
    if (x < -100) x = 700;
    else if (x > 700) x = 700;
  }
  
  boolean didHitFrog(float fx, float fy) {
      float distX = (x) - fx;
      float distY = y - fy;
      if(abs(distX) < 16 && abs (distY) < 13){
        return true;
      }
      else return false;
    }
  
  void display(){
    noStroke();
    //head
    fill(34,139,34);
    ellipse(x-21,y,13,13);
    //tail
    triangle(x+15,y+3,x+15,y-3,x+23,y);
    //front right fin
    beginShape();
    vertex(x-13,y-5);
    vertex(x-8,y-14);
    vertex(x+7,y-16);
    vertex(x,y);
    endShape();
    //front left fin
    beginShape();
    vertex(x-13,y+5);
    vertex(x-8,y+14);
    vertex(x+7,y+16);
    vertex(x,y);
    endShape();
    //rear right fin
    beginShape();
    vertex(x+4,y-5);
    vertex(x+13,y-12);
    vertex(x+30,y-6);
    vertex(x+16,y-8);
    vertex(x+5,y);
    endShape();
    //rear left fin
    beginShape();
    vertex(x+4,y+5);
    vertex(x+13,y+12);
    vertex(x+30,y+6);
    vertex(x+16,y+8);
    vertex(x+5,y);
    endShape();
    //shell
    noStroke();
    fill(139,69,19);
    ellipse(x,y,30,24);
  }
}


