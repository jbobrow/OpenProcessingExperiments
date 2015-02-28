
void setup(){
size(500,500);
smooth();
frameRate(30);
}

void draw(){ 
  float cs=1+mouseX;
  float cy=1+mouseY;
  background(255);
  noStroke();

 for (int j=0;j<height/cs+1;j++){
    for (int i=0; i<width/cs+1;i++){
       fill(255,255,255,20); 
       rect(cs,cy,cs+sin(cs),sin(cy)+cy,10);
       fill(random(255));
       ellipse(i*cs,j*cs,cs,cs);
       fill(0);      
    }
  }
}


