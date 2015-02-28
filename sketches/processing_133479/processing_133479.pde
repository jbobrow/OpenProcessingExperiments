
int pen = 1; 
void setup() {
  size(400,400);
  background(200);
}

//float size = 30;

void draw() {
  //noStroke();
  point(mouseX,mouseY);
  line(pmouseX,pmouseY,mouseX,mouseY);
 
  
  float activeX = pmouseX-mouseX;

}

void mouseClicked() {
  //size = size + 10;
  stroke(200);
  pen = pen * -1;
  if(pen == 1)
  {
    stroke(200);
  }
  else if (pen == -1)
  {
    stroke(0);
  }
}

void keyPressed() {
  if (key == '1') {
    strokeWeight(1); 
  }
  else if(key=='2')
  {
    strokeWeight(2);
  }
  else if(key=='3')
  {
    strokeWeight(5);
  }
  else if(key=='4')
  {
    strokeWeight(0);
  }
  
  
  //size = 10;
}




