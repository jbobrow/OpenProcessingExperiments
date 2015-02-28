
void setup() {
  size(1240,877);
 //colorMode(HSB);
  background(255,255,50);
  smooth();
}

void draw() {
  /*
  stroke(230,70,0);
  strokeWeight(3);
  
  for (int a=10; a<3600; a=a+5) {
    float x=800+sin(radians(a))*60;
    float y=300+cos(radians(a))*60;
    pushMatrix();
    line(840,350,x,y);
    popMatrix();
    gomdraw1();
}
*/
 float a=0;
  noStroke();
  //fill(255,140,30);

  for(int b=0; b<360*15; b=b+5) {
    point(920,300);
    fill(255,140,30);
    pushMatrix();
    ellipse(1000+a*sin(radians(b)),400+a*cos(radians(b)),30,30);
    a=a+0.7;
    popMatrix();
    gomdraw1();
  }
  for(float y=0; y<6000; y=y+400){
  for(float x=0; x<3800; x=x+400){
  pushMatrix();
  scale(0.2);
  translate(x*0.8,y*0.8);
  
    
   gomdraw2();
   popMatrix();

}
  }
}
  void gomdraw1() {
    noStroke();
  fill(255);
  //face
  ellipse(1040,450,860,820);
  //ears
  ellipse(720,160,80,70);
   fill(0);
   //eyes
 ellipse(740,230,20,20);
 ellipse(1200,230,20,20);
  //nose 
   ellipse(877,240,40,25);
 }
  
  void gomdraw2(){
    //face
   fill(255);
    ellipse(0,0,200,200);
    //nose
    fill(0);
    ellipse(5,5,50,20);
    noFill();
    strokeWeight(2);
    stroke(0);
    beginShape();
    vertex(2,8);
    bezierVertex(2,8,3,10,5,8);
    bezierVertex(5,8,8,10,9,8);
    endShape(CLOSE);
    //eyes
    noStroke();
    fill(0);
    ellipse(-60,-30,20,20);
    ellipse(60,-30,20,20);
    //ears
    fill(255);
   ellipse(-60,-80,40,40);
   ellipse(60,-80,40,40);
   
  
  
  saveFrame("parkgom2.png");

  }   
