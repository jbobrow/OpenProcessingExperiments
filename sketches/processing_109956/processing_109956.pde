
float xPos = 0;
float yPos;

void setup(){
size(400,400);
smooth();
yPos = height/2;
}

void draw(){
background(200);
fill(0,20,220);
ellipse(xPos, yPos, 50, 50);
// The below line says that the value of xPosition will grow by 2 every frame
xPos += 2; 
line(xPos, yPos, 200, 300);
line(200, 300, 100, 400);
line(200, 300, 300, 400);
line(mouseX, mouseY, xPos, yPos);
line(xPos, yPos, 300, 250);
}


