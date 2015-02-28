
color linecolor = #FFFFFF;
int rad = 20;
int mode = 1;

void setup(){
  size(1000,1000);
}

void draw(){
  background(#000000);
  rad = int((mouseX/1000.)*70);
  for(int i=0;i<12;i=i+1){
    horizontalLine(i*100);
  }
  for(int i=0;i<12;i=i+1){
    verticalLine(i*100);
  }
}

void horizontalLine(float yPos){
  for(int i=0;i<12;i=i+1){
    noStroke();
    fill((mouseY/1000.)*255.);
    ellipse(i*100+50,yPos,rad,rad);
  }
  strokeWeight(15);
  stroke(#FFFFFF);
  line(0,yPos,1000,yPos);
}

void verticalLine(float xPos){
  for(int i=0;i<12;i=i+1){
    noStroke();
    fill((mouseY/1000.)*255.);
    ellipse(xPos,i*100+50,rad,rad);
  }
  strokeWeight(15);
  stroke(#FFFFFF);
  line(xPos,0,xPos,1000);
}

void mousePressed(){
  mode=mode+1;
  if(mode>2){
    mode=1;
  } 
}
  


