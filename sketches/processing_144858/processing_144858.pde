
void setup(){
size (500,500);

rectMode(CENTER);
}
void draw(){
background (167,49,49);
fill(43,162,141,200);
stroke(106,234,21);
rect (100,100,150,150);
fill(203,45,183,100);
stroke(106,234,21);

if (mousePressed){
rect (mouseX,mouseY,150,150);
}
else {
fill(203,45,183,100);
stroke(106,234,21);  
rect (200,200,150,150);
}
}





