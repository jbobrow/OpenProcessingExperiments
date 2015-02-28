
void setup(){
  size(1000,1000);
  background(73);
 }

void draw(){
  fill(random(400),random(500),random(600));
  ellipse(mouseX,mouseY,5+random(100),5+(random(100)));
  ellipse(mouseX+20,mouseY+20,5+random(100),5+(random(100)));
  ellipse(mouseX+40,mouseY+40,5+random(100),5+(random(100)));
  ellipse(mouseX+60,mouseY+60,5+random(100),5+(random(100)));
  ellipse(mouseX+80,mouseY+80,5+random(100),5+(random(100)));
  ellipse(mouseX-20,mouseY+20,5+random(100),5+(random(100)));
  ellipse(mouseX-40,mouseY+40,5+random(100),5+(random(100)));
  ellipse(mouseX-60,mouseY+60,5+random(100),5+(random(100)));
  ellipse(mouseX-80,mouseY+80,5+random(100),5+(random(100)));
 }


void mouseClicked(){
  background(random(300),random(200),random(100));
 }



