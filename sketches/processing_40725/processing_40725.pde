
void setup(){
size(200, 200);
background(0);
smooth();
}
void draw(){
 noStroke();
 

if(mousePressed){
  fill (0);
  triangle(100, 100, 50, 50, mouseX, mouseY);
}else{
  fill(255);
 ellipse(100, 100, mouseX, mouseY);
}
}

                
                
