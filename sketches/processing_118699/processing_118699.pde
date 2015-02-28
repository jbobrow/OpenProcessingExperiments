
/* @pjs preload="trailing.jpg"; */
PImage page4;
int scene = 1;

void setup(){
  size(1280,1024);
  
  page4 = loadImage("trailing.jpg");
  image(page4,0,0);
  page5 = loadImage("signatures_break.jpg");
  grow = 0;
  
  smooth();

  noStroke();

  max_distance = dist(0, 0, width, height);
}

void draw(){
  fill(255);
  DragPage();
  Shutdown();
}

void keyPressed() {
   scene++;
   grow=0;
}
 void DragPage(){
   if(scene == 1){
     grow = grow + .2;
  stroke(0);
  beginShape();
  vertex(0+mouseX,0+mouseY);
  vertex(0+mouseX,17+mouseY);
  vertex(1+mouseX,17+mouseY);
  vertex(5+mouseX,14+mouseY);
  vertex(8+mouseX,19+mouseY);
  vertex(9+mouseX,19+mouseY);
  vertex(10+mouseX,18+mouseY);
  vertex(8+mouseX,13+mouseY);
  vertex(12+mouseX,13+mouseY);
  vertex(12+mouseX,12+mouseY);
  endShape();
   noStroke();
  ellipse(random(1280),random(1024), 2+grow,2+grow);
   }
 }
 void Shutdown(){
   if(scene >= 2){
  background(51);
  image(page5,0,0);
  grow = grow + .2;
noStroke();
  for(int i = 0; i <= width; i += 20) {

    for(int j = 0; j <= width; j += 20) {

      float size = dist(mouseX, mouseY, i, j);

      size = size/max_distance * 66;

      ellipse(i, j, size+grow, size+grow);

    }

  }
   }
 }


