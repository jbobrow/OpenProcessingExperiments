
int i=0;
float pos[][]= new float[5][2];
void setup(){
  size(600,600);
  smooth();
  strokeWeight(3);
  stroke(255);
  
  background(0);
}

boolean flag = false;

void draw(){
 if(mousePressed && !flag) {
   if (i < 4) {
     pos[i][0]=mouseX;
     pos[i][1]=mouseY;
   }
   i++;
   flag = true;
 }
 if(i == 4) {
   fill(random(255),random(255),random(255),128);
   quad(pos[0][0],pos[0][1],pos[1][0],pos[1][1],pos[2][0],pos[2][1],pos[3][0],pos[3][1]);
 }
 if(i == 5) {
   background(0);
   i = 0;
 }
}

void mouseReleased() {
 flag = false;
}

