

void setup() {
  size(600, 280);
  if(mousePressed==true){
  
   background(120,100,150,100);}
  else{
    background(255);}
 
  drawCircle(width/2, height/2, width/2);
}

void drawCircle( float x, float y, float diam) {

  //noFill();
  //fill(100,100,100,100);
  stroke(100,100);
  ellipse(x, y, diam, diam);

  if (diam>2) {
stroke(255);
fill(255,200,180,100);
    drawCircle(x+diam/2, y, diam/2);
    fill(255,230,180,100);
    drawCircle(x-diam/2, y, diam/2);
    fill(255,100,180,100);
    drawCircle(x, y-diam, diam/2);
  }

}



