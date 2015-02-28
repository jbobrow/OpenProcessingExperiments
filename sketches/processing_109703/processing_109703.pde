
void setup() {
size(400, 400);
noStroke();
smooth();
}

void draw() {
float x = mouseX;
float y = mouseY;
float ax = width-mouseX; 
float ay = mouseY-height;
float bx = height-mouseX;
float by = mouseY-width;

background(235, 235, 230);
fill(146, 213, 215);
ellipse(x, height/2, y, y);
fill(225,200,196);

textSize(25);
text("COME AND GONE",100, 200); 

ellipse(x, height/2, by, by);
fill(200,200,196);

translate(width/2, height/2);
rotate(PI/8);
rect(ax, height/2, ay, ay);

}



