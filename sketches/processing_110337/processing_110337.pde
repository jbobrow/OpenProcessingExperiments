
int[] colorOptions = {30,100,200,230};
void setup(){
size(500,500);
background (255,255,255,100);
strokeWeight(3);
noCursor();
}

void draw(){
float g = random (255);
stroke(g,g,g,25);
line(mouseX,0,mouseX,height);
strokeWeight (random (10));
stroke (0,random(255),0,20);
line(0,mouseY,width,mouseY);
}
