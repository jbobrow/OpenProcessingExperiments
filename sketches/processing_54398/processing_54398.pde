
float y = 250; //variable y starts at 250
void setup() {
  size(300,300);
  background(220,75,65); //background colour

}

void draw(){
  fill(255-y,20,23+y,30);
 
  rect(mouseY,mouseX,25,25); // direction shape moves , and size
  rect(25,25-y,25,25);
  
   if (y>700){
  y=125.0;

   }
}

void mouseMoved(){
  rect(mouseX,mouseX, 70, 70); //draw rectangle that follows mouse 
  if (mouseY < pmouseY){    //left to right
    fill(#20b2aa);
  }
  
  else if (mouseX > pmouseY) {     //right to left 
    fill(#ff4500); 
  }
  
}

         
                
