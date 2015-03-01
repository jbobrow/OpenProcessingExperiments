
void setup() {

 size(500, 400);

 background(10, 80, 100);

}

void draw() {

 stroke(255, 255, 255);

 fill(255,255,255);

 ellipse(mouseX, 200, 300, 300);

 

 stroke(255, 255, 255);

 fill(0,0,0);

 ellipse(mouseX, 150, 100, 100);

 fill(0,1,2);

 rect(245, mouseY, 10, 240);

 

 fill(0,1,2);

 rect(350, mouseY, 10, 240);

 

 fill(0,1,2);

 rect(50, mouseY, 10, 240);

 fill(255, 255, 255);

 ellipse(mouseX, mouseY, 70, 70);

}


