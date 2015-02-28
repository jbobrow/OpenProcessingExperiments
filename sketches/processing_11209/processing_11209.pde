
void setup(){
size(500, 500);
colorMode(RGB, 255);
background(250, 50, 80);
smooth();
noLoop();
}

void draw(){
//背景
  for(int i = 0 ; i < 1000 ; i++){
  drawback(random(width), random(height), random(40, 60));
  }

//皮
  drawkawa(0, 500);

//皮２
  drawkawa2(0, 500);

//種
  for(int i = 0 ; i < 20 ; i++){
  drawtane(140, random(7, 12));
}

//種２
  translate(690, 60);
  for(int i = 0 ; i < 20 ; i++){
  drawtane2(130, random(7, 12));
}

//種３
  translate(-460, -90);
  for(int i = 0 ; i < 20 ; i++){
  drawtane3(130, random(7, 12));
}

//種４
  translate(650, 200);
  for(int i = 0 ; i < 20 ; i++){
  drawtane4(130, random(7, 12));
}
}  








void drawback(float a, float b, float c){
  noStroke();
  fill(255, 255, 255, 5);
  ellipse(a, b, c, c); 
}

void drawkawa(float a, float b){
  strokeWeight(50);
  stroke(0, 255, 0);
  ellipse(a, a, b, b);
  ellipse(a, b, b, b);
  ellipse(b, b, b, b);
  ellipse(b, a, b, b);
}

  void drawkawa2(float a, float b){
  strokeWeight(40);
  stroke(50, 150, 70);
  ellipse(a, a, b, b);
  ellipse(a, b, b, b);
  ellipse(b, b, b, b);
  ellipse(b, a, b, b);
}

void drawtane(float a, float b){
  noStroke();
  fill(0, 0, 0);
  ellipse(a, a, b, b);
  ellipse(50-a, 50-a, b, b);
  ellipse(90-a, 90-a, b, b);
  rotate(PI/9);
}

void drawtane2(float a, float b){
  noStroke();
  fill(0, 0, 0);
  ellipse(a, a, b, b);
  ellipse(50-a, 50-a, b, b);
  ellipse(90-a, 90-a, b, b);
  rotate(PI/9);
}

void drawtane3(float a, float b){
  noStroke();
  fill(0, 0, 0);
  ellipse(a, a, b, b);
  ellipse(50-a, 50-a, b, b);
  ellipse(90-a, 90-a, b, b);
  rotate(PI/9);
}

void drawtane4(float a, float b){
  noStroke();
  fill(0, 0, 0);
  ellipse(a, a, b, b);
  ellipse(50-a, 50-a, b, b);
  ellipse(90-a, 90-a, b, b);
  rotate(PI/9);
}

