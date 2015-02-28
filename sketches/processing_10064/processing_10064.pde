
void setup(){
  size(600,600);
  colorMode(HSB, 100);
    smooth();
     background (50);
}

float mainx,mainy;
float cx1,cy1,cx2,cy2;
int x2,y2;
int col = 100;
int wght = 1;

void draw() {
 stroke(col);
 
 wght +=int(random(-2,2));
 wght = abs(wght);
 strokeWeight(wght);
 

   if (mousePressed) {
   line(pmouseX, pmouseY, mouseX, mouseY);
   if (col>0) {
     col=0;}
     else {
       col=100;}
   }
   if (wght>16) {wght-=2;}
if (keyPressed == true) {
background(50);
}

} 

