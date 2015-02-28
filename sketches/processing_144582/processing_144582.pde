
void setup(){
  size(800,800);
  background(25,14,59);
}
     
   
void draw(){

   if (keyPressed && (key == CODED)) {
    if (keyCode == UP){
    pushMatrix();
    translate(random(0, width), random(0, height));
    stroke(255);
    line(0,0,5,0);
    line(0,0,0,5);
    line(0,0,5,5);
    line(0,0,-5,5);
    line(0,0,-5,-5);
    line(0,0,5,-5);
    line(0,0,0,-5);
    line(0,0,-5,0);
    popMatrix();
    }
   }
if (keyPressed && (key == CODED)) {
    if (keyCode == DOWN){
      stroke(255);
      fill(255);
      ellipse(width*.75,height*.25,150,150);
      //stroke(227,225,232);
      //fill(227,225,232);
      //ellipse(width*.75+8,height*.25+30,10,10);
     //stroke(227,225,242);
      //fill(227,225,232);
      //ellipse(width*.75+15,height*.25+6,30,30);
      //stroke(229,224,232);
      //fill(227,225,232);
      //ellipse(width*.75-10,height*.25-18,60,60);
    }
}
if (keyPressed && (key == CODED)) {
    if (keyCode == LEFT){
      stroke(25,14,59);
      fill(25,14,59);
      ellipse(width*.75-15,height*.25,150,150);
}
    }
}




