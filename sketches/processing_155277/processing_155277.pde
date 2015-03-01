
float theta = 0.1;


void setup(){
  size(500, 1000);
  smooth();
  background(0);
}

void draw(){
  background(0);
 
  for(int x = 0; x <= width; x+=1){
    fill(255);
    stroke(255);
    strokeWeight(3);
    point(mouseX+x, mouseY+100*sin(theta));
    theta += 0.1;
  }
  
}


