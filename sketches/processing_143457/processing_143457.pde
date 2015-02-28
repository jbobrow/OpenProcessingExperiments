
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Mirae
// ID: 201420064



int globalsize = 50;
color bgr = color(0);
 
void setup() {
 size(600,600);
 background(0);
 noLoop();
 smooth();
}

void draw() {
  stroke(0);
  for (int i = 10; i < width; i+=50) {
  for (int j = 10; j < height; j+=50) {
  
    ellipseMode(CENTER);
    noStroke();
    fill(#9ce77f);
    ellipse(i+15,j+15,30,30);
 }  
}

stroke(0);
  for (int i = 10; i < width; i+=50) {
  for (int j = 10; j < height; j+=50) {
   ellipseMode(CENTER);
   noStroke();
    fill(#ffb400);
    ellipse(i+15,j+215,30,30);
  }
  }
 

stroke(0);
  for (int i = 10; i < width; i+=50) {
  for (int j = 10; j < height; j+=50) {
   ellipseMode(CENTER);
   noStroke();
    fill(#0091bb);
    ellipse(i+15,j+415,30,30);
  }
  }
 
stroke(0);
  for (int i = 10; i < width; i+=50) {
  for (int j = 10; j < height; j+=50) {
   ellipseMode(CENTER);
   noStroke();
    fill(#ffffff);
    ellipse(i+15,j+15,10,10);
  }
  }

}

