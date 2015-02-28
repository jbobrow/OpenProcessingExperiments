
void setup(){
  size(400,400);
  background(200);
  smooth();
}

void draw(){
  fill(100);
  rect(0,0,400,400);
  noStroke();
  fill(230,0,230);
  
  for(int i=0; i<1000; i=i+1){

     drawFlower(50,50, 40);
     drawFlower(width-50,50, 40);
     drawFlower(width-50,height-50, 40);
     drawFlower(50,height-50, 40);
     drawFlower(mouseX,mouseY, 40);

     }
   }

  
 









