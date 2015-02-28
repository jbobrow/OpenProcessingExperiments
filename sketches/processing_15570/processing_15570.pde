

int pos = 20;

void setup() {
  size(400, 400);
  smooth();
  noLoop();
}

void draw() {
  background(220);  
  for( int a = 0; a <width; a += pos){
    for (int b = 0; b <height; b += pos){
      fillRect(a,b);
      println(a + " und " + b);
    }
  }
}

void fillRect(int x, int y){
  pushMatrix();
  translate(x,y);
  for(int i = 0; i < 1; i++){
      int a = (int)random(4);
      fill(0);
      switch(a) {
      case 0: 
        pattern_1();
        break;
      case 1:
        pattern_2();
        break;
      case 2:
        pattern_3();
        break;
      default: 
        pattern_4();
        break;
      }
    }
    popMatrix();
}

void pattern_1(){
  fill(255);
  noStroke();
  rect(0,0,pos,pos);
  
}

void pattern_2(){
  
  fill(255);
  noStroke();
  rect(0,0,pos,pos);
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
  fill(255);
  noStroke();
  rect(0,0,pos,pos);
  for (int i = 1; i < pos; i = i+(int)random(-1,4)) {
      strokeWeight(0.3);
      stroke(0);
      line(i+random(3), 0, i, pos-1);
      line(0, i+random(3), pos-1, i);
      noStroke();
  }
}

void pattern_4(){
  fill(255);
  noStroke();
  rect(0,0,pos,pos);
  stroke(0);
  strokeWeight(0.7);
  for (int i = 1; i < pos; i = i+3) {
    for (int j = 1; j < pos; j = j+3) {
      point(i+random(-0.5,0.5), j+random(-0.5,0.5));
    }
  }
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

