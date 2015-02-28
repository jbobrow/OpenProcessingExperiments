
int h=161;
int s=84;
int b=150;
int opacity= 35;
int dia= (0);
float z = 0;
void setup(){
  size(600,600);
  background(0);
  frameRate(15);
}
void draw(){
  noFill();
  colorMode(HSB,161, 84, 150);
  stroke(161, 84, 150);
  //0-50-green, 50-150-purp, 150-200,
  h=random(130, 180);
  s=random(50, 150);
  b=random(50, 150);
  dia=random(10, 210);
  
  
  if (mousePressed){
    z+= 5; 
    fill(h,s,b, opacity);
    ellipse(mouseX,mouseY, dia, dia);
  }
  else{}
}
  void mouseReleased() {
    z= 20;
}

void keyPressed () {
   if (key == 'x' ) { 
   noStroke();
   fill(0, 0, 0, opacity);
   rect(0, 0, 600, 600);
   }
 }
 
/* if(keyPressed && mousePressed) {
    if(key=='c') {
      dia++;
  }
 }

void keyPressed(){
 if(key="c" && mousePressed){
  ellipse(mouseX, mouseY, 200, 200);
 }
}
 
*/

