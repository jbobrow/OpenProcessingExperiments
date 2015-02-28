
//Math week 3 assignment

PImage b;
float curtainRight;
float curtainRightMotion;
float curtainLeft;
float curtainLeftMotion;
void setup(){
size(700, 600);


smooth();
}
void draw(){
b = loadImage("dinopiano.jpg");
image(b, 50, 100);
fill(49, 25, 2);
rect(0, 0, 50, 700);
rect(650, 0, 50, 700);
fill(0);
rect(0, 0, 700, 100);

if(mouseY < 50){
  fill(255, 255, 150, 25);
  ellipse(325, 375, 350, 300);
}



fill(108, 26, 23);


ellipse(40, mouseY - 600, 120, 1500);
ellipse(635, mouseY - 600, 150, 1500);
ellipse(110, mouseY - 600, 120, 1500);
ellipse(560, mouseY - 600, 120, 1500);
ellipse(185, mouseY - 600, 120, 1500);
ellipse(485, mouseY - 600, 120, 1500);
ellipse(335, mouseY - 600, 120, 1500);
ellipse(260, mouseY - 600, 120, 1500);
ellipse(410, mouseY - 600, 120, 1500);


fill(0);
rect(0, 550, 700, 100);

}

