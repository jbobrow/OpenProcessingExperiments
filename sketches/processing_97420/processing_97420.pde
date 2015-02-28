
void setup(){
  size(500,500);
  background(0);
}


void A(){ 
  fill(255);
  noStroke();
  triangle(30, 75, 58, 20, 86, 75);
  strokeWeight(5);
  stroke(255,0,155,200);
  line(58,20,30,75);
  line(58,20,86,75);
  
}
  void plus(){
  noStroke();
  rectMode(CENTER);
  rect(30,30,25,10);
  rect(30,30,10,25);

  }
  
  void T(){
 noStroke();
 triangle(30, 20, 58, 75, 86, 20);
 strokeWeight(5);
  stroke(255,0,155,200);
 line(30,20,86,20);
 line(58,20,58,75);
  }
  
void draw(){
  pushMatrix();
  translate(random(-3,3),random(-3,3));

  pushMatrix();
  noFill();
  translate(width/2-60,height/2);
  A();
  popMatrix();
 
   
   pushMatrix();
   fill(255);
    translate(width/2,height/2);
  T();
   popMatrix();
   
    pushMatrix();
   translate(width/2-15,height/2-10);
   scale(1.5);
   fill(random(255),random(255),random(255),150);
  plus();
   popMatrix();
   
   popMatrix();
}
