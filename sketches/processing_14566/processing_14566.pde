
void setup(){
  size(500,500);
}
void draw(){
  background(245,200,17);
  for ( float b=0; b<=500; b=b+200) {
  for ( float a=0; a<=500; a=a+200) {
  pushMatrix();
  translate(a,b);
  rotate(radians(frameCount));
  an_Draw(); 
  popMatrix();
   }  
  }
}



void an_Draw(){

//얼굴
  fill(#FFFFFF);
  stroke(0);
  strokeWeight(8);
  ellipse(100,110,150,135);

//코
  fill(0);
  ellipse(100,130,10,10);

//눈
  ellipse(50,110,50,50);
  fill(#FFFFFF);
  ellipse(50,110,20,20);
  ellipse(140,110,20,20);
  fill(#FFFFFF);
  ellipse(50,110,20,20);

//입
  stroke(0);
  strokeWeight(5);
  line(80,160,100,170);
  line(100,170,120,160);


  fill(#FFFFFF);
  stroke(0);
  strokeWeight(5);
  beginShape();
  vertex(140,50);
  vertex(170,20);
  vertex(170,50);
  endShape(CLOSE);

  fill(#FFFFFF);
  stroke(0);
  strokeWeight(5);
  beginShape();
  vertex(60,50);
  vertex(40,20);
  vertex(40,50);
  endShape(CLOSE);

}

