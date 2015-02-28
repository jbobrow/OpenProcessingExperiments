
int num = 80;
int sw = 3;
float[] offSet = new float[num];
float offSetY = -50;
color bg = 20;
color s = #ffffff;
float theta, th;
color[] palette = {#ECD078, #D95B43, #C02942, #542437, #53777A};
// color[] palette = {#CFF09E, #A8DBA8, #A8DBA8, #3B8686, #0B486B};
 
void setup() {
  size(400, 400);
  background(bg);
  noFill();
  strokeWeight(sw);
  
  for (int i=0; i<num; i++) {
    offSet[i]=th;
    th += (TWO_PI/num);
  }
}
  
void draw() {
  translate(0, offSetY);
  background(bg);
  stroke(s, 150);
  
  for (int i=0; i<num; i++) {
    float y = ((height-offSetY)/(num-(num/9)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]*2), -1, 1, -120, 120);
    stroke(palette[(int)i%5]);
    bezier(-sw, y, 0, y+vari, width, y-vari, width+sw, y);
  }
  theta += 0.0523;
   
   
}

