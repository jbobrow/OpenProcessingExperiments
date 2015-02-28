
int x;
int y;
void setup() {
  size(600,600);
  background(0,156,255);
  smooth();
  x=100;
  y=100;
}

void draw() {
  stroke(0);
  strokeWeight(10);
  strokeJoin(ROUND);
  x=mouseX;
  y=mouseY;

  if (mousePressed == true) {
    if(mouseButton == LEFT) {
      line(x+43,y+40,x+43,y+76);
      line(x+27,y+36,x+27,y+72);
      //body
      fill(255);
      stroke(255);
      strokeWeight(10);
      strokeJoin(ROUND);
      beginShape();
      vertex(x+25,y+20);
      vertex(x+45,y+30);
      vertex(x+45,y+70);
      vertex(+x+25,y+65);
      endShape(CLOSE);
      //balck part
      fill(0);
      strokeWeight(0);
      beginShape();
      vertex(x+20,y+20);
      vertex(x+50,y+30);
      vertex(x+50,y+60);
      vertex(x+20,y+55);
      endShape(CLOSE);
      //arms
      stroke(0);
      strokeWeight(10);
      strokeJoin(ROUND);
      line(x+50,y+50,x+57,y+62);
      line(x+25,y+40,x+15,y+57);
      //papper box head
      float mx=map(mouseX, 0, width, 0, 255);
      float my=map(mouseY,0,height,0,255);
      fill(255,my,mx);
      strokeWeight(1);
      stroke(0);
      beginShape();
      vertex(x-7,y+40);
      vertex(x-7,y-50);
      vertex(x+30,y-60);
      vertex(x+95,y-50);
      vertex(x+95,y+40);
      vertex(x+58,y+50);
      endShape(CLOSE);
      line(x-7,y-50,x+58,y-40);
      line(x+58,y-40,x+95,y-50);
      line(x+58,y-40,x+58,y+50);
      //black eyes
      fill(0);
      stroke(0);
      ellipse(x+7,y+1,22,22);//left eye
      ellipse(x+42,y+5,22,22);//right eye
      //eye line
      stroke(255);
      strokeWeight(2);
      line(x,y,x+15,y+2);
      line(x+35,y+4,x+50,y+6);
    }
    else if(mouseButton == RIGHT) {
      line(x+43,y+40,x+43,y+76);
      line(x+27,y+36,x+27,y+72);
      //body
      fill(255);
      stroke(255);
      strokeWeight(10);
      strokeJoin(ROUND);
      beginShape();
      vertex(x+25,y+20);
      vertex(x+45,y+30);
      vertex(x+45,y+70);
      vertex(+x+25,y+65);
      endShape(CLOSE);
      //balck part
      fill(0);
      strokeWeight(0);
      beginShape();
      vertex(x+20,y+20);
      vertex(x+50,y+30);
      vertex(x+50,y+60);
      vertex(x+20,y+55);
      endShape(CLOSE);
      //arms
      stroke(0);
      strokeWeight(10);
      strokeJoin(ROUND);
      line(x+50,y+50,x+57,y+47);
      line(x+25,y+50,x+15,y+40);
      //papper box head
      float mx=map(mouseX, 0, width, 0, 255);
      float my=map(mouseX,mouseY,height,0,255);
      fill(my,200,mx);
      strokeWeight(1);
      stroke(0);
      beginShape();
      vertex(x-7,y+40);
      vertex(x-7,y-50);
      vertex(x+30,y-60);
      vertex(x+95,y-50);
      vertex(x+95,y+40);
      vertex(x+58,y+50);
      endShape(CLOSE);
      line(x-7,y-50,x+58,y-40);
      line(x+58,y-40,x+95,y-50);
      line(x+58,y-40,x+58,y+50);
      //black eyes
      fill(0);
      stroke(0);
      ellipse(x+7,y+1,22,22);//left eye
      ellipse(x+42,y+5,22,22);//right eye
      //eye line
      stroke(255);
      fill(255);
      strokeWeight(2);
      ellipse(x+7,y+1,16,16);
      ellipse(x+42,y+5,10,10);
      fill(0);
      stroke(0);
      ellipse(x+8,y+3,2,2);
      ellipse(x+40,y+6,2,2);
      //drop line
      stroke(0,156,255);
      strokeWeight(1);
      line(x+90,y-45,x+90,y+10);
      line(x+85,y-40,x+85,y+3);
      line(x+80,y-40,x+80,y-15);
      line(x+75,y-39,x+75,y-5);
      line(x+70,y-30,x+70,y-20);
    }
  }    
  else if(keyPressed) {
    stroke(0,156,255);  
    strokeWeight(0);
    fill(0,156,255);
    ellipse(x,y,50,50);
    //key pressed
  }
  else {
    for(int e=0; e<width; e+=20) {
      strokeWeight(0);
      fill(map(mouseX,50,width,0,255),map(mouseY,height,0,255,0),map(mouseX,mouseY,width,0,255));
      ellipse(e+10,590,10,10);
      ellipse(590,e+10,10,10);
      ellipse(e+10,10,10,10);
      ellipse(10,e+10,10,10);
    }
    //
    stroke(0);
    strokeWeight(10);
    strokeJoin(ROUND);
  }
}


