
int x = 10;

void setup (){
size (300,300);
noStroke();
frameRate(15);
}
void draw(){
if (mousePressed == true){
if (mouseX <= 150){
fill(random(255),random(255),random(255),random(255));
x = random(10,100);
ellipse(mouseX,mouseY,x,x);
}
else {
fill(random(255),random(255),random(255),random(255));
x = random(10,100);
rect (mouseX,mouseY,x,x);
}
}
else {
fill (100);
ellipse(width/2, height/2, 200,200);
}

}


