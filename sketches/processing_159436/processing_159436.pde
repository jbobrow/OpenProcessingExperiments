
void setup(){
  size(900,900);
  background(255);
}
  void draw(){
    
    float yea=random(800);
    translate(yea,yea);
    rect(yea,yea,mouseX,mouseY);
   stroke(yea,yea,yea);
   fill(yea/3,yea/3,yea/3);
  }

