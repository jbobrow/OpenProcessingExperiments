
void setup () {
size (300, 300);
}

int x=0;
int y=0;

void draw() {

if (mouseX <= width/20) {//controls speed of transformations ...must be waived left to right one time for full transformation


quad(30, 50, 260, 50, 260, 250, 30, 250);//bowes and rectangles
fill(255,150,30,mouseX/2);
quad(50, 70, 240, 70, 240, 230, 50, 230);//outer ring

quad(70, 90, 220, 90, 220, 210, 70, 210);
quad(80, 100, 210, 100, 210, height*2/3, 80, height*2/3);//inner ring

ellipse(width/2, height/2, width/3, height/3);
fill(255,150,30,mouseX/4);
ellipse(width/2, height/2, width/4, height/4);

}else {
background (255/y, mouseX, 30, x/8);//switches the mode in between figures--fourth figure controlls speed of color change


}

fill(0, mouseX, 0);// mouseX allows for the colors to vary per movement of mouse

quad(30, 50, 70, 50, 70, 90, 30, 90);
quad(220, 50, 260, 50, 260, 90, 220, 90);
quad(30, 210, 70, 210, 70, 250, 30, 250);
quad(220, 210, 260, 210, 260, 250, 220, 250);

fill(1);
ellipse(width/2, height/2, width/3, height/3);
fill(255, 150, 30);
ellipse(width/2, height/2, width/4, height/4);

if (y>width) {
fill(255, 150, 30, mouseX);
}else{ // double brackets to start and stop porcesses are needed!
noFill();
}

noStroke();

quad (height/2, width/2, width/2, 0, 0, height/2, width/2, 150);  //upper triangle-final transformation

triangle(height/2, width/2, width, height/2, width/2,height);//lower triangle-final transformation

if (x<width){
y++;
}
}


