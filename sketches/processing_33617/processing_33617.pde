
float ellx = 100;
float elly = 350;

void setup(){
  
  size(400,700);
  background(255);
}

void draw(){
 
 background(255);
 rect(mouseX,mouseY,20,20);
 
 ellipse(ellx,elly,50,50);
 elly = elly + (mouseY - elly)/25.0;
 ellx = ellx + (mouseX - ellx)/25.0;
 
}



