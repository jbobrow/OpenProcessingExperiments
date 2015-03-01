
float[] circle_x;
float[] circle_y;
float[] circle_s;
color[] circle_c;
float[] move_x;
float[] move_y;

float csize;
int score;
int totscore;
PImage poes1;
PImage poes2;
String scoreText;
PImage poes;


void setup() {
  size(600, 600);
  noStroke();
  colorMode(HSB, 100);
  imageMode(CENTER);
  poes1 = loadImage("Poes1.png");
  poes2 = loadImage("Poes2.png");
  
  poes = poes1;
  reset();
  textSize(24);
  text("Click on the screen to start",200,200);
  
}

void draw() {
  
  fill(0, 10);
  rect(0, 0, width, height);
 
    int i = 0;
    while (i < circle_x.length) {
      if(circle_x[i] == 0 && circle_y[i] == 0){
      }
      else{
      
      
      if(i % 2 == 0){
        poes = poes2;
      }
      else{
        poes = poes1;
      }
      pushMatrix();
      translate(circle_x[i]+random(-3, 3), circle_y[i]+random(-3, 3));
      rotate(i);
      image(poes, 0,0, circle_s[i], circle_s[i]);
      circle_x[i] = circle_x[i] - move_x[i];
      circle_y[i] = circle_y[i] - move_y[i];
  
      if (circle_x[i] > width) {
        circle_x[i] = width;
        move_x[i] = -move_x[i];
      }
      if (circle_y[i] > height) {
        //circle_y[i] = 0;
        move_y[i] = -move_y[i];
      }
      if (circle_x[i] < 0) {
        circle_x[i] = 0;
        move_x[i] = -move_x[i];
      }
      if (circle_y[i] < 0) {
        circle_y[i] = 0;
        move_y[i] = -move_y[i];
      }    
      popMatrix();
      }
     i = i + 1;
  }
   if (csize < 100) {
      csize = csize + 0.5;
    }
  showScore(20);
  
}

void mousePressed() {
  
  if(mouseButton == LEFT){
   
    if (csize > 10 && csize <= 100) {
      boolean ok = checkFreeSpace(mouseX,mouseY);
      if(ok){
        println(mouseX + " " + mouseY);
        circle_x = append(circle_x, mouseX);
        circle_y = append(circle_y, mouseY);
        circle_s = append(circle_s, csize);
        circle_c = append(circle_c, color(floor(map(mouseY, 0, height, 0, 100)), 50, 100));
        move_x = append(move_x, random(-1, 1));
        move_y = append(move_y, random(1, 3));
        totscore += floor(csize);
        csize = 0;
        
      }
      else
      {
        noLoop();
        showScore(100);
      }
    }
  }
  else{
    reset();
    loop();
  }
}
boolean checkFreeSpace(float x,float y){
  boolean ok = true;
  int i = 0;
  while (i < circle_x.length){
    if(dist(x,y,circle_x[i], circle_y[i]) < (csize/2) + (circle_s[i]/2)){
      ok = false;
      break;
    }
    
    i = i + 1;
  }
  return ok;
}
void showScore(int tsize) {
  
  fill(0, 0, 100);
  textSize(tsize);
  if(tsize >20){
    text(totscore, width / 3, height / 2);
  }
  else{
    
    String scoreText = totscore + " + " + floor(csize);
    text(scoreText, tsize, tsize + 10);
    
  }
}
void reset(){
  
  circle_x = new float[1000];
  circle_y = new float[1000];
  circle_s = new float[1000];
  circle_c = new color[1000];
   move_x = new float[1000];
   move_y = new float[1000];
  
  csize = 0.0;
  
  score = 0;
  totscore = 0;
  scoreText = "";

  
}



