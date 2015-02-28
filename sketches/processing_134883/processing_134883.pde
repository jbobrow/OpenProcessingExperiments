
void setup(){
 size(400,400);
 colorMode(HSB,500);
}



void draw(){
  background(100);
  for(int i =0;i<500;i++){
    stroke(i,500,500);
    strokeWeight(5);
    float x=(width/2) + (sin((TWO_PI/500)*i)*mouseX);
    float y=(height/2) + (cos((TWO_PI/500)*i)*mouseY);
    line(mouseX,mouseY,x,y);
  }
    
}




