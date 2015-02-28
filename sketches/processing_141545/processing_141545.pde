
void setup(){
  size (500,500);
  background(255);
  noFill();
}

void draw(){

   background (255);
   float rot_sec = map (second(),0,59,0,360);
   float rot_mouse = map(mouseX,0,width,0,360);
   pushMatrix();
   translate(width/2, height/2);
   rotate(radians(rot_sec));
   line (0,0,50,0);
   popMatrix();
   for (int j=10; j<500; j=j+55){
     //rotate(radians(rot_mouse));
         for (int i =10; i< 500; i=i+5){
         line(j,i,j+50+mouseX,i+mouseY);
         }
   }
}


