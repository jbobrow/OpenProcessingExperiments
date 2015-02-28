
void setup() {
  size(800,600);
  background(255);
  smooth();
  
  noLoop();  
}

void draw(){
  background(255);
  translate(width/2,height);
  rotate(random(-PI/8));
  segment(100, 10);
  rotate(random(PI/4));
  segment(100, 10);
}

void mousePressed(){
  
  redraw();
}

/*int img = 10;
void keyPressed(){
  
  saveFrame("tree-00" + img + ".png");
  img++;
}*/

void segment(float h, int level){
  float c = random(100);
  stroke(c,c/2,0);
  strokeWeight(float(level)*.5);
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
      float r = random(3,10);
      fill(random(255),random(255),random(255),random(100,255));
      ellipse(0,0,r,r);
    popMatrix();
    }
  }   
}



