
int counter;
 
void setup() {
  size(300, 300);
  background(255);
}
void draw(){
for (int y = 10; y<20; y=y+15){
 ellipse(random(300),random(300),20%mouseY,20%mouseX);

  }
  
}

 
