
float objectSize = 10;
int heightCount = 80;
int widthCount = 80;
 
void setup() {
  size(640, 480);
  ellipseMode(CENTER);
  smooth();
  colorMode(RGB, 360, 255, 255);
   
  drawGrid();
}
 
void draw() {

}
 
void drawGrid() {

  fill(267);

 
  for (int j = 1; j < heightCount; j = j + 1) {
    for (int i = 1; i < widthCount; i = i + 1) {
       
      if((widthCount *2) == 0) {
        noStroke();
        fill(random(130, 260), random(50, 100), random(75, 200));
        rect(map(i, 0, widthCount, 75, width-75),
        map(j, 0, heightCount, 20, height-20),
        width / 20, height / 20);
         
      } else {
         
      noFill();
      stroke(map(i + j, 1, widthCount, 50, 0), 100, 0);

     fill(random(345, 320), random(100, 255), random(75, 200));
     rect(random(0, 640), random(0, 480), 
      width / widthCount, height / heightCount);
     }
  }
}
}
 
void mouseMoved() {
 fill(random(300, 345), 100, 100);
  background(0, 0, 100);
  widthCount = floor(map( mouseX, 3, width, 3, 40));
  heightCount = floor(map( mouseY, 3, height, 3, 40));
  fill(random(100, 255), random(200, 255), random(130, 255));
  drawGrid();
}


