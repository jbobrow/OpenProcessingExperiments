
 int leaves = 0; 
   int leafMax = 3000;
   
void setup(){
  size(700,700);
  background(#E5B76D);
  frameRate (500);

}
  
void draw (){
  fill(#FF1F26);
  
  if (leaves < leafMax) {
  
    float cx = 230 + random(-500,500);
    float cy = 230 + random(-500,500);
     
    translate(cx,cy);
    rotate(random(PI/4));
    
    drawLeaf();
    leaves++;
  }
  
}
  
  
void drawLeaf(){
  float pointShift = random(-20,20);
  beginShape();
  vertex(10, 30);
  
    bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50);
    bezierVertex(60 + pointShift,55, 30,65, 20,45);
    endShape();
  
}
