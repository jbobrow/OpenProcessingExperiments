
float r=0;
float g=150;
float b=255;
void setup() {
       size(600, 600);
       strokeWeight(7);
       background(255);
       
       
     } 
void draw() {
       stroke(r,g,b);
       line(300, 300, mouseX, mouseY);
     
if(mouseX > width/2 & mouseY>height/2) {
r = r + 1;
g=g-1;
b=b+2;
} else {
r = r - 1;
}
if (mouseX<width/2 & mouseY > height/2) {
b = b + 3;
g=g+4;
r=r+3;
} else {
b = b - 2;
}
if (mouseX>width/2) {
g = g - 3;
}else{ 
g = g + 5;
}
r = constrain(r,0,255);
g = constrain(g,0,255);
b = constrain(b,0,255);
//save ("doodle.png");
}

     




