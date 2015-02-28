
int x=0;
int y=0;
int sw=4;//futosa
color c=0;//iro

void setup() {
  size(600, 600);//zenntainosaizu
  background(255);//haikeisyoku
}

void draw() {
  stroke(c);
  strokeWeight(sw);//sen
  x=mouseX;
  y=mouseY;
  if (mousePressed){//osutokakeru
    line(mouseX, mouseY, pmouseX, pmouseY);
    
  }
  if (keyPressed) {
    if (key=='g') {
      c=color(0, 255, 0);
    }//iro green
    if (key=='c') {
      c=color(8, 234, 252);
    }//iro cyan
    if (key=='p') {
      c=color(255, 0, 239);
    }//iro purple
    if (key=='r') {
      c=color(255, 0, 17);
    }//iro red
    if (key=='y') {
      c=color(254, 255, 0);
    }//iro yellow
    if (key=='o') {
      c=color(255, 128, 0);
    }//iro orange
    if(key=='b'){
      c=color(0);
    }//iro black
    if (key=='1') {
      sw=1;
    }//mozinofutosa 1
    if (key=='2') {
      sw=2;
    }//mozinofutosa 2
    if (key=='3') {
      sw=3;
    }//mozinofutosa 3
    if (key=='4') {
      sw=4;
    }//mozinofutosa 4
    if (key=='5') {
      sw=5;
    }//mozinofutosa 5
    
    if (key=='0') {
      background(255);
    }//zennbukesu
    if (key=='w') {
      c=color(255);
    }//kesigomu
  
  }
}


