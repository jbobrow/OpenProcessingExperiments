
void setup() {
  size(400,400);
  background(255,200,0);
}

void draw() {
  
  fill(random(255),random(255),random(255));
  stroke(random(255),random(255),random(255));

  text("Travaille!",random(400),random(400));
  textSize(random(75));


}

void mouseClicked() {

  background(random(255),random(255),random(255));
  
}

                
                
