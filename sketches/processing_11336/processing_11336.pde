
void setup(){
  size(500,500);
  smooth();
  background(0,0,125);
  noLoop();
}

void draw(){
//wave

  fill(0,0,50,50);
  drawNami(0,-10);
  fill(0,0,150);
  drawNami(0,0);
  fill(0,0,50,50);
  drawNami(0,95);
  fill(0,0,175);
  drawNami(0,100);
  fill(0,0,50,50);
  drawNami(0,190);
  fill(0,0,200);
  drawNami(0,200);
  fill(0,0,50,30);
  drawNami(0,290);
  fill(0,0,225);
  drawNami(0,300);
  fill(0,0,50,20);
  drawNami(0,390);
  fill(0,0,255);
  drawNami(0,400);
}


void drawNami(int x,int y){
//wave
    noStroke();
    beginShape();
    curveVertex(-50,y+300);
    curveVertex(-50,y+300);
    curveVertex(0,random(y+20,y+25));
    curveVertex(x+50,random(y+100,y+105));
    curveVertex(x+100,random(y,y+5));
    curveVertex(x+120,random(y-10,y-5));
    curveVertex(x+140,random(y,y+5));
    curveVertex(x+160,random(y-30,y-35));
    curveVertex(x+180,random(y+20,y+25));
    curveVertex(x+190,random(y+10,y+15));
    curveVertex(x+210,random(y+40,y+45));
    curveVertex(x+280,random(y+20,y+25));
    curveVertex(x+400,random(y+100,y+105));
    curveVertex(x+500,random(y+50,y+55));
    curveVertex(x+600,random(y,y+5));
    curveVertex(x+700,y+300);
    curveVertex(x+700,y+300);
    endShape();
  

  

  
//radio_wave
  noFill();
  strokeWeight(5);
  stroke(255);
  beginShape();
  vertex(0,400);
  vertex(300,400);
  vertex(320,420);
  vertex(340,380);
  vertex(350,400);
  vertex(370,300);
  vertex(390,420);
  vertex(400,400);
  vertex(410,410);
  vertex(430,400);
  vertex(500,400);
  endShape();

}

