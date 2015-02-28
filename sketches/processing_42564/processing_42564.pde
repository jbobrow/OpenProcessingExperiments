
void setup(){
 size(500,500);
 background(0);
 smooth();
}
 
void draw(){
 fill(0,30);
 noStroke();
 rect(0,0,width,height);
 
 frameRate(8);
  
  noFill();
  for(int i=0; i<height; i++){
 
 noFill();
 
 // bezier(random(width),random(height),random(width),random(height),random(width),random(height),random(width),random(height));
  beginShape();
  vertex(mouseX,mouseY); // first point
  bezierVertex(random(width-20),random(height-20),random(width-20),random(height-20),random(width-20),random(height-20));
  bezierVertex(random(width-20),random(height-20),random(width-20),random(height-20),random(width-20),random(height-20));
  endShape();

   stroke(mouseY-200,mouseX-200,random(255),random(50,mouseX-200));
 
 }
} 
             
                
