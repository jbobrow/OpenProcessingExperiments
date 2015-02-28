
void setup(){
  size(600,600);
  background(255);  
  smooth();
 
}

void draw(){
  for(int i = 8; i <= 300; i += 100) {
  for(int j = 12; j <= 300; j += 5) {
    fill(0);    
    line(j,i, j+30,200); 
  float r =random(100,300);
  float g =random(150,250);
  float b =random(200,350);
  fill(r,g,b,250);
  stroke(mouseY,mouseX,mouseY,100);

    translate(50,200);
    rotate(PI/6);
    ellipse(mouseX,mouseY+100,50,100);
   }
}
}
