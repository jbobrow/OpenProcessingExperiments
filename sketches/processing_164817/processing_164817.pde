

void setup(){
background(0, 0, 0);
size(400, 400);
}

void draw(){ 
if(mousePressed){
noStroke();
fill(map(mouseX, 0, 400, 0, 255), 31, 156, 200);
ellipse(mouseX+random(-25, 25), mouseY+random(-25, 25), random(5, 10), random(5, 10));
triangle(mouseX+random(-25, 25), mouseY+random(-25, 25), random(5, 10), random(5, 10), random(6, 8), random(9, 7));
quad(38, 31, 86, 20, 69, 63, 30, 76);
quad(200, 200, 100, 40, 90, 85, 40, 85);
}
}

