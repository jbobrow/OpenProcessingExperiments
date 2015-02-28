
void setup (){
size (400, 400);
background (200);
smooth ();
}

void draw (){

stroke(0);

if (mousePressed){
  fill (10, 0);
rect(0, 0, width, height);
stroke (255, 255, 255);
line (200, 200, mouseX,mouseY);
}

if (mousePressed){
stroke (0);
fill (0);
smooth ();
ellipse (380, 380, 10,10);
}}




