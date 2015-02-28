
float a, incA;
float cx, cy;
//float x, y;

void setup() {
size(600, 600);
background(92, 126, 122);

a = 0;
incA = radians(1); 
cx = width/2;
cy = height/2;
}

void draw () {
  noStroke();
  fill(92, 126, 122, 50);
  rect(0,0, width, height);
  
  /*float x = cx + 100*cos(a);
  float y = cy + 100*sin(a);
  
  stroke(204, 232, 228);
  strokeWeight(2.5);
  fill(254, 0, 255);
  ellipse(x, y, 35, 35);
  
  circular(cx+10, cy+10, a/2, 50);
  fill(255, 196, 0, 60);
  circular(100, 50, a/3, 100);
  fill(255, 0, 0, 80);
  circular(200, 20, a/4, 10);
  fill(95, 62, 9, 10); 
  circular(cx, cy, a, 200);*/
  
  float phase = 0;
  
 
 for(int i = 25; i < width; i += 50) {
  for(int j = 25; j < height; j += 50) {

    fill(125, i/2, 100, 25);
    circular(i, j, a+phase, 25); 
    phase += radians(5);
   }
 }
 text("phase =" + phase, 100, 100);
    a += incA;
}
  



//-----------------------------
void circular(float centroX, float centroY, float angulo, float radio) {
  float x = centroX + radio*cos(angulo);
  float y = centroY + radio*sin(angulo);
  
  noStroke();
  //strokeWeight(2.5);
  //fill(254, 0, 255);
  ellipse(x, y, 20, 20);
  stroke(204, 232, 228);
  strokeWeight(random(.5, 2.5));
  line(centroX, centroY, mouseX, mouseY);

}


