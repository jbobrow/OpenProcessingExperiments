
//Rose Vastola
float theta = 0.0;// this control the action of the larger heart
void setup(){
  size(500,500);
  background(255); 
  smooth();
  fill(220,180,180);
  strokeWeight(2);
  stroke(255); 
  
}



void draw(){
    drawHearts(0, 0, 10);
   if(theta <= TWO_PI){
    theta += 0.01;
 }else{
 background(255);  
 textAlign( CENTER );
 textSize(24);
 text("Happy Valentine's Day! <3 RV", width/2, height-80);
 
 }
  if (keyPressed == true) {
   background(255);  
 textAlign( CENTER );
 textSize(24);
 text("Happy Valentine's Day! <3 RV", width/2, height-80);
  } else {
    fill(255);
  }
  

  // Little hearts
  
  if (mousePressed == true){
  
smooth();
noStroke();
fill(255,50,0);
translate(mouseX,mouseY);
pushMatrix();
beginShape();
vertex(50, 15); 
bezierVertex(50, -5, 90, 5, 50, 40); 
vertex( 50, 15); 
bezierVertex(50, -5, 10, 5, 50, 40); 
endShape();
popMatrix();
  } else{
    fill(255);
  }
      
  
}
 
  
// this activates the animation of the dtan function 

void drawHearts(float x, float y, float r){
  pushMatrix();
  translate(width/2,width/2);
  beginShape();
  for( float t = 0.0; t < theta; t+=0.01){
   x = 16*pow(sin(t),3); 
  y = 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);
  x = x*r;
  y = y*-r;
  vertex(x,y);
 }
 endShape(); 
 popMatrix();
  
  if(r > 2){
    drawHearts(x, y+r, r/2);
    drawHearts(x-r, y, r/2);
    drawHearts(x-r, y, r/2);
    drawHearts(x, y-r, r/2);
  }
}





