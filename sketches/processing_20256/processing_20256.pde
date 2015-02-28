
void setup() {
  size(600, 600);
  background(139,90,87);
  smooth();
}
 
void draw(){
  if (frameCount % 5 == 0) {
    translate(300, 300);
    if (mousePressed == true) {
    fill(frameCount * 3 % 255, frameCount * 5 % 1,
      frameCount * 7 % 1);
    }else{
        fill(frameCount * 1 % 43, frameCount * 2 % 196,
      frameCount * 4 % 2);
    }
  
      
    rotate(radians(frameCount * 1)  % 360);
     rect(0, 0, 300, 30);
     if(pmouseX<400) {
        stroke(255,3,3);
         }  else{
   stroke(65,183,7);
         }
  }
  
    if (frameCount % 5 == 1) {
    translate(300, 300);
    if (mousePressed == true) {
    fill(frameCount * 3 % 43, frameCount * 5 % 196,
      frameCount * 7 % 2);
    }else{
        fill(frameCount * 1 % 255, frameCount * 2 % 1,
      frameCount * 4 % 1);
    }
  
      
    rotate(radians(frameCount * 3)  % 200);
     rect(200, 200, 300, 60);
     if(pmouseX<400) {
        stroke(255,3,3);
         }  else{
   stroke(65,183,7);
         }
}
}




