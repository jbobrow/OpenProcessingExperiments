
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: PARK HYEBIN
 // ID: 201420081
 int i, j;
 float C;

void setup(){
size (1024, 600);
colorMode(RGB);
background(1);
smooth();
noLoop();
 }

void draw(){
  noStroke();
  smooth();
  for(i=0; i<=width/4; i ++){
    for(j=0; j<=height/4; j++){
      C=random(107, 545);
      fill(C, 80, 97);
      rect(i*20,j*100,30,50, 100,50,100,50);     
    }
  }

for (int i = 20; i < height; i += 30) {
    fill(#61DBF0);
    rect(0, i*2, width, 13);
    fill(255);
    rect(i*2, 0, 13, height);    
  }


int gridSize = 45;

for (int x = gridSize; x <= width - gridSize; x += gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      fill(255);
    ellipse(x, y-0.2, 15, 15);
    stroke(255, 50);
    strokeWeight(3);
    line(x, y, width/2, height/2);
      
  }
}



}



 


void keyPressed(){
background(254);
redraw();

}
