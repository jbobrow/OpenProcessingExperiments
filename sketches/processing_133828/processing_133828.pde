
void setup() {
  
size(400, 400);
background(0);

} 

void draw() {
  
  fill(0);
  rect(0,0,width,height);
 int d = mouseY*2 - mouseX/2;
  for (int x = 0; x<=width; x+=20){
    for(int y = 0; y<= height; y+=20){ 
    noFill();
    stroke(255,40);
    ellipse(x, y, d, d);
    }  
  }

}


