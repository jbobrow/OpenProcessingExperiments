


float px=0;
void setup() {
   size (500,500);
 }

 void draw() {
   background(10);
     for (int i = 1; i<700; i=i+50) {
    for(int u=2;u<600; u=u+50){
      fill(i*0.5,u*0.5,mouseX/1,mouseY/1);
      rect(i,u,10,10);
    }
  }


 if(mouseX>306,mouseY<306) {
   px++;
   
   stroke(150);
  
   fill(110,174,106);
  ellipse(mouseX,mouseY,px,px);
 }
 }
 
