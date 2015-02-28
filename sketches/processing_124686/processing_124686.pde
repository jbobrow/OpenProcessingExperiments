
 float ang = 30;
  float x = 0;
  float y = 0;
  float deg = 0;
  float degacc = 0;
  float acc = 0;
  float speedX = 2;
  float speedY = 2;
  float colBase = 0;
 
  int[] angs = {15, 18, 20, 24, 30, 36, 40, 45, 60, 72, 90, 120};
 
void setup(){
  init2();
  size(400, 400);
  noStroke();
  colorMode(HSB, 360);
}
 
   
void init1(){
  deg = random(360);
  degacc = random(2) - 1;
  acc = random(2) - 1;
  speedX = random(4) + 2;
  speedY = random(4) + 2;
  colBase = random(360);
}
 
void init2(){
  init1();
  x = 0;
  y = 0;
  background(0, 0, 0);
}
 
 
int count = 0;
int count2 =0 ;
 
void draw(){
   
  translate(width /2, height / 2);
  colBase += 10;
  if(colBase >= 360){
    colBase -= 360;
  }
  
  fill(colBase, 360, 360);
  
  for(int i = 0; i < 360; i += ang){
    subdraw();
    rotate(radians(ang));
    scale(1, -1);
    subdraw();
    scale(1, -1);
  }
   
  x += cos(radians(deg)) * speedX;
  y += sin(radians(deg)) * speedY;
  deg += degacc;
  degacc -= acc;
  acc += 0.0001;
   
  count++;
  if(count >= 30){
    count = 0;
    init1();
    count2++;
  } 
}
 
void mousePressed(){
  init2();
  ang = angs[(int)random(angs.length - 1)];
  println(ang);
}
 
void subdraw(){
  ellipse(x, y, 3, 3);
}
