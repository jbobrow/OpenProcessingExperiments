
int perro=0;
void setup(){
size(600,600);
background(random(25),random(25),random(25));
}
void draw() {
background(214,10,111);
stroke(random(25),random(25),random(25));
noStroke();
ellipse(mouseY,mouseX,80,80);
ellipse(mouseX,mouseY,80,100);
ellipse(width-mouseX,mouseY,200,200);
println(mouseX);
ellipse(width-mouseX,mouseY,100,100);
ellipse(mouseY,mouseX,80,80);
println(mouseX);
}

