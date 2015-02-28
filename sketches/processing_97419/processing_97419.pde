
float logosize;
float logox;
float logoy;

void setup() {
  size(800, 600);
  
  logox = width/2;
  logoy = height/2;
}

void draw(){
  if(logosize > width){
  logosize=1;
  }
  else{
  logosize = logosize +1;
  }
  
  fill(200);
 beginShape(TRIANGLES);
  fill(100);
  vertex(30, 75);
  vertex(40, 20);
  vertex(50, 75);
  
  fill(202);
  vertex(60, 20);
  vertex(mouseX, mouseY);
  vertex(350, 260);
  endShape();
}

void mouseClicked(){
    logox = mouseX;
    logoy = mouseY;
}


