
float d = 0;
float c = 0;
int lastX = 200;
int lastY = 200;

void setup() {
 size(400,400);
 smooth();
background(255); 
}

void draw() {
 d = dist(width/2,height/2,mouseX,mouseY);
 c = map(d,0,width/2,0,255); 
 stroke(c);
 fill(c,128);
 //line(width/2,height/2,mouseX,mouseY);
 triangle(width/2,height/2,mouseX,mouseY,lastX,lastY);
 lastX = mouseX;
 lastY = mouseY;
}

void mouseClicked() {
 setup(); 
}
