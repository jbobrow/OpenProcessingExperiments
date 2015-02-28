
void setup(){
 size(300,300);
}

void draw(){
 background(255);
 
 
 
 for(float y=0; y<1800; y=y+400){
  for(float x=0; x<1800; x=x+400){
  pushMatrix();
  scale(0.2);
  translate(x*0.8,y*0.8);
  rotate(sin(frameCount)/4+50);
  
   
   myDraw();
   popMatrix();
  }
 }

 
}

void myDraw() {
//전
stroke(0);
fill(255,255,0);
rect(0,0,200,200);
  
  //눈
  strokeWeight(1);
  stroke(0);
  fill(255);
  ellipse(40,60,30,30);
  ellipse(160,60,30,30);

  fill(0);
  ellipse(40,60,10,10);
  ellipse(160,60,10,10);


  //입

  fill(250,0,0);
  stroke(250,0,0);
  line(40,150,160,150);
  rect(40,150,120,10);


  //코
  /*
stroke(0,250,0);
   line(100,100,90,120);
   line(100,100,110,120);
   line(90,120,110,120);
   */
  fill(20,250,60);
  stroke(50,200,80);
  beginShape();
  vertex(100,90);
  vertex(90,110);
  vertex(110,110);
  endShape(CLOSE);


  //머리

  fill(0);
  stroke(0);
  beginShape();
  vertex(0,0);
  vertex(50,0);
  vertex(0,25);
  endShape(CLOSE);

  beginShape();
  vertex(200,0);
  vertex(150,0);
  vertex(200,25);
  endShape(CLOSE);


  //왼볼

  fill(255,255,0);
  stroke(255,0,0);
  strokeWeight(1);
  ellipse(30,110,30,30);
  ellipse(30,110,20,20);
  ellipse(30,110,10,10);
  ellipse(30,110,5,5);

  //오볼

  fill(255,255,0);
  stroke(255,0,0);
  ellipse(170,110,30,30);
  ellipse(170,110,20,20);
  ellipse(170,110,10,10);
  ellipse(170,110,5,5);
}
