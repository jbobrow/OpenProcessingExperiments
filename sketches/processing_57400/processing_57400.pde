
  class robot{
  
  float x;
  float y;
  float w;
  float h;
  
  
robot (float px, float py, float pw, float ph){
  x = px;
  y= py;
  w= pw;
  h= ph;
  println("new robot made");
}
void display() {
  fill(255);
    pushMatrix();
    translate(x, y);
    
  //legR
  line(x, y, x+60, y+60);
 //legL
  line(x, y, x-60, y+60);
 //footR
 fill(161, 86, 237); 
 ellipse(x+60, y+60, w/5, h/5);
 //footL
 ellipse(x-60, y+60, w/5, h/5);

noStroke();
//body
fill(161, 86, 237);
  ellipse(x, y, w, h);
//head
fill(6, 196, 137);
  ellipse(x, y-50, w-40, h-40);
//eyeL
fill(31, 83, 222);
  ellipse(x-40, y-40, w-60, h-60);
 fill(0);
  ellipse(x-40, y-40, w/5, h/5);
//eyeR
fill(31, 83, 222);
  ellipse(x+40, y-40, w-60, h-60);
fill(0);
  ellipse(x+40, y-40, w/5, h/5);



 //eyebrowL
 noFill();
 stroke(0);
 strokeWeight(4);
  arc(x-40, y-40, w-40, h-40, PI, PI+HALF_PI);
  
  //eyebrowR
    arc(x+40, y-40, w-40, h-40, PI+HALF_PI, TWO_PI);
    popMatrix();
}
  }


