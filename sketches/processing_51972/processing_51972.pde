



void setup(){
  size(800,600);
  noFill();
  strokeWeight(.1);
  

}


void draw(){
  background(255);
  translate(width/2,height/2);  
  for(int i = 0; i < mouseX; i++){
   rotate(radians(1));
   line(0,mouseY+13,200,200);
  }
}

