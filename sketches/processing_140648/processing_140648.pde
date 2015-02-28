
/*Felix Anderson
Benjamin Bacon 
Creative Computing*/



float w;
float z;
float pw;
float pz;
float easing = 0.13;
 
void setup() {
  size(600,600);
  background(150);
  smooth(0);
  stroke(255);
}
 
void draw(){
  
 if (mousePressed) {
  float targetX = mouseX;
  w=w+(targetX-w)*easing;
  float targetY = mouseY;
  z=z+(targetY-z)*easing;
  line(w,z,pw,pz);
  strokeWeight(20);
  
  
   if(keyPressed) {
     strokeWeight(40);
  line(w,z,pw,pz);
   }
  
 if (keyPressed == true) {
  
   stroke(0);
   
 }else{
   stroke(255);
 }
 
 if(keyPressed){
  
   stroke(0);
 }
 if (keyPressed) {
    if (key == 'b' || key == 'B') 
    background(150);
 }
 
  pw=w;
  pz=z;

  }
    }





