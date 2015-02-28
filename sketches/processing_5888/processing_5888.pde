
float R;

void setup(){
size(400,400);
background(255,50,200);

}

void draw() {
background(200,50,50);

R=random(255);
fill(200,200,R);

ellipse(mouseY,mouseX,40,40);
fill(200,R,200);
rect(mouseY,mouseX,40,50);
ellipse(mouseX,mouseY,40,40);
fill(R,200,250);
rect(mouseX,mouseY,40,50);

}


