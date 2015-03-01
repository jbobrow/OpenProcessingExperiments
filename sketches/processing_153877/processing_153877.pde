
void setup (){
  size(500,500,P3D);
  background(255);
  stroke(0);
  smooth();
}

void draw(){
  background(255);
translate(-100,-100,0);
  rotate(radians(-mouseY),radians(mouseX),radians(mouseX),radians(mouseY));
  int rad = 40;
  translate(0,-100,50);
    for (int i = 0; i < 800; i+=rad*2){
        for (int j = 0; j < 800; j+=rad*2){
         fill(255);
         stroke(0,100);
         strokeWeight(1);
          pushMatrix();
            for (int k = 0; k <30; k++){
               ellipse(i,j,k*2,k*2);
               translate(0,0,k/3);
             }
             for (int k = 30; k >0; k--){
               ellipse(i,j,k*2,k*2);
               translate(0,0,k/3);
             }
          popMatrix();
          
         
          }
          
          
      }
}
