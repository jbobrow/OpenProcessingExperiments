
void setup(){
  size(1000,600);
  background(255);
frameRate(100);  }
  
void draw(){
  
  int a;
  int centX = width/2;
  int centY = height/2;
  
  float endX = centX + (millis()/1000)*sin(millis());
  float endY = centY + (millis()/1000)*cos(millis()); 
  line(centX, centY, endX, endY);
  int col = millis()/100;
  if(col > 0 && col < 256) {
    stroke(col, 0, 0);}
  if(col > 255 && col < 511) {
    stroke(255, col - 255, 0);}
  if(col > 510 && col < 766){
    stroke(765 - col, 255, 0);}
  if(col > 765 && col < 1021){
    stroke(0, 255, col - 765);}
  if(col > 1020 && col < 1246){
    stroke(0, 1245 - col, 255);}
  if(col > 1245 && col < 1500){
    stroke(col - 1245, 0, 255);}
  if(col > 1500 && col < 1756){
    stroke(255, 0, 1755 - col);}
strokeWeight(1);
if(col > 1755){
  stop();}
}
