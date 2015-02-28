
void setup() {
size(400,400);
smooth();


background(255);
noCursor(); 
}

void draw() {
background(255);


if(mousePressed){
fill(0);    
rect(mouseX,mouseY,400,400);
}else{
noFill();
stroke(0);
ellipse(mouseX,mouseY,50,50); }

}

