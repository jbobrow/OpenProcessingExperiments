
float px[] = new float[300];
 float py[] = new float[300];
float pr[] = new float[360];
void setup(){
size(300,300);
 }
void draw(){
  }
 void mousePressed(){
 for(int i=0; i<mouseY; i++){
 px[i] = random(width);
 py[i] = random(height);
 pr[i] = random(360);
 }
 }
 void mouseDragged(){
 background(255);
 for(int i=0; i<mouseY; i++){
 pushMatrix();
rectMode(CENTER);
 translate(px[i],py[i]);
 rotate(radians(pr[i] + mouseX));
 rect(0,0,5,500);
 popMatrix();
 }
 }
