
void setup() {
  size(1000,600);
  background(235);
  smooth();
  noLoop(); 
}
 
void draw(){
  float randVal = random(80,120);
  background(235);
  translate(width/2,height+190);
  for(int i =0;i<randVal;i++){
  rotate(random(-PI/4));
  segment(100, 10);
  rotate(random(PI/3));
  segment(100, 10);
  }
}
 
void segment(float h, int level){
  float c = random(90);
  stroke(c,c/2,0);
  strokeWeight(3*float(level)*.2);
  line(0,0,0,-h);
  if(level>0){
    level--;
   for(int t = 0; t<round(2); t++){
    pushMatrix();
      translate(0,-h);
      rotate(random(-PI/8,PI/8));
      segment(h*random(.5,1), level);
    popMatrix();
   }
   
  }else{
    if(random(1)>.8){
    pushMatrix();
    translate(0,-h);
    rotate(random(-PI/8,PI/8));
    drawLeaf(0,0);
    popMatrix();
    }
  }  
}

void drawLeaf(float x, float y){
    fill(random(90,112),random(120,162),random(10,70));
    scale(random(0.07,0.28));
    beginShape();
    vertex(20, random(30,45)); 
    bezierVertex(random(30),random(30), 60 ,40 /2, 70 ,50); 
    bezierVertex(60,55, 30,65, 20,45);
    endShape(); 
}

void mousePressed(){
  redraw();
}



