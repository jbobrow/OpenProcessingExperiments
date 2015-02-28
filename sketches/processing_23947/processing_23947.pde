
boolean button = false;
int x = 50;
int y = 50;
int w = 100;
int h = 75;
void setup() {
size(200,200);
}
void draw() {
if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && mousePressed) {
button = true;
} else {
button = false;
}
if (button) {
background(250);
stroke(0);
} else {
background(0);
stroke(250);
ellipse(x+30,y+30,50,40); //head 
ellipse(x+10,y-10,10,10); //left eye
ellipse(x-10,y-10,10,10); //right eye
point(x,y); //nose

}
ellipse(x+30,y+30,50,40); //head 
ellipse(x,y,90,90); //head 

ellipse(x+10,y-10,10,10); //left eye
ellipse(x-10,y-10,10,10); //right eye
point(x,y); //nose
fill(100);
rectMode(CENTER);
rect(x,y+10,20,10); //mouth

fill(mouseX,0,mouseY);
ellipse(mouseX,mouseY-5,50,40); //body

ellipse(x+10,y-10,10,10); //left eye
ellipse(x-10,y-10,10,10); //right eye
point(x,y); //nose
fill(100);
rectMode(CENTER);
rect(x,y+10,20,10); //mouth
}

