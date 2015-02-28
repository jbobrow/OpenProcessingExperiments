


void setup(){
  size(250,250);
  background(0);
  frameRate(20);
}
void draw(){
  smooth();
  noFill();
  strokeWeight(0.4);
  stroke(#0463D3 );
  ellipse(random(250),random(250),20,20);
   
    strokeWeight(0.6);
    ellipse(random(250),random(250),10,10);
    ellipse(random(250),random(250),5,5);
    
if (mousePressed){
  background(0);
}
}



