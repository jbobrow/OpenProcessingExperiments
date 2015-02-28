

int schwachsinn = 1;
//int seed = (int)random(11);
int seed = 9;
float pos = 30;
int farbe = 80;
int sw = 0;
int rectCount = 400;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  pos = 30;
  background(255);
  noStroke();
  randomSeed(seed);
  println(seed);
  random(schwachsinn);
  float x = ((int)random(width/pos)-1)*pos+pos;
  float y = ((int)random(height/pos)-1)*pos+pos;
  translate(x,y);
  for(int i = 0; i < rectCount; i++){
    int b = (int)random(3);
    switch(b) {
    case 0: 
      pos = pos;
      break;
    case 1: 
      pos = pos/1.1;
      break;
    default: 
      pos = pos*1.1;
      break;
    }
    int a = (int)random(4);
    fill(0);
    switch(a) {
    case 0: 
      translate(0,pos);
      pattern_1();
      break;
    case 1:
      translate(pos,0);
      pattern_2();
      break;
    case 2:
      translate(0,-pos);
      pattern_3();
      break;
    default: 
      translate(-pos,0);
      pattern_4();
      break;
    }
    //rotate(0.01);
  }
}

void pattern_1(){
  fill(255);
  noStroke();
  rect(0,0,pos,pos);

}

void pattern_2(){
  stroke(0);
  strokeWeight(0.5);
  for (int i = 0; i < pos; i = i+3) {
    line(0+(int)random(-2,4), i, i+(int)random(-1,4), -i/pos);
  }
  translate(pos,pos);
  scale(-1);
  for (int i = 0; i < pos; i = i+3) {
    line(0, i+(int)random(-1,4), i+(int)random(-1,4), -i/pos);
  }
}

void pattern_3(){
  for (int i = 1; i < pos; i = i+(int)random(-1,4)) {
    strokeWeight(0.3);
    stroke(0);
    line(i+random(3), 0, i, pos-1);
    line(0, i+random(3), pos-1, i);
    noStroke();
  }
}

void pattern_4(){
  stroke(0);
  strokeWeight(0.7);
  for (int i = 1; i < pos; i = i+3) {
    for (int j = 1; j < pos; j = j+3) {
      point(i+random(-0.5,0.5), j+random(-0.5,0.5));
    }
  }
}

void keyPressed() {
  switch(key) {
  case 'n':
    seed++;
    break;
  case 'b':
    seed--;
    break;
  }
}

