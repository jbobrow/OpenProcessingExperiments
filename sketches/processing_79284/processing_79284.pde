
void setup() {
  size(750,400);
  background(100,16,16);

  smooth(5);
}
 
void draw(){
  if (mousePressed) {
   
  for (int i = -3; i< width; i+= 25){
    for(int j = 10; j< height; j+= 25){
       
      fill(random(20,90), 0, random(130,100));
      ellipse(i+3,j+3,125,125);
    }
  } 
  }
}



