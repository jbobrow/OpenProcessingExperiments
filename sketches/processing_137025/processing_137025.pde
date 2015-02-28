
float x=mouseX;
float y=mouseY;
int i,n;

void setup(){
  size(480,320);
  background(255);
}

void draw(){
 
  background(255);
  for (i=0; i<11; i++){
    x=mouseX;
    y=mouseY;
     noFill();
     stroke(20,40,150,80);
     strokeWeight(8);
  beginShape();
  vertex(240,160);
  bezierVertex(40*i,160, 40*i-x, 40*i+y,30*i+x,30*i-y);
  //bezierVertex( 480-40*i, 360-40*i, 480-40*i, 360-40*i, 40,360);
  endShape();
   beginShape();
  vertex(240,160);
  bezierVertex(480-40*i,160, 480-40*i+x, 320-40*i-y,480-30*i-x,320-30*i+y);
  //bezierVertex( 480-40*i, 360-40*i, 480-40*i, 360-40*i, 40,360);
  endShape();
  noStroke();
  ellipseMode(CENTER);
  fill(25,50,168,122);
  ellipse(30*i+x,30*i-y,30,30);
  ellipse(480-30*i-x,320-30*i+y,30,30);
  
  }
}
  
  



