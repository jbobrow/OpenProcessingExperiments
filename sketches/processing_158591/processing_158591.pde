
void setup(){
size(700,600);
background(10,200,200);
}
void draw() {
stroke(random(255), random(255), random(255));
float r=random(120);
line(300+(r*50),500+(r*5),r,r-50);
fill(random(100),random(255),random(255));
if (mousePressed){
rect(mouseX,mouseY,r+40,50);
} else{
ellipse(300+(r*3),300+(r*2),r+20,r+20);
}
}
