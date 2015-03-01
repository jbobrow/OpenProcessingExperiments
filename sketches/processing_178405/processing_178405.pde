
//For this project I wanted to highlight the ever changing world of art. Fron gilded frames to graphic design, our way of creating art continues to change. 

//Global Variables
PImage frame; 
color[] palette =
{#6F3E7F, #F1C8FF, #06CED3, #79647F, #B163CC, #80D306};
int circleSize = 150;
Boolean picture = false; 

//setup()
void setup() {
size(800, 600);
frame = loadImage("Frame.png");
}

//draw()
void draw(){
    if (mousePressed){ 
    float r =random (1,6);
    noFill();
    strokeWeight(random(15));
    stroke(palette [int(r)]);
    ellipse(mouseX, mouseY, circleSize, circleSize);

}
image(frame, 0, 0);
}
//keyPressed()
void keyReleased(){
if (key==DELETE || key == BACKSPACE) background(#FFFFFF);
if (key== 's' || key =='S') saveFrame("screenshot.png");
switch(key){
 case '1':
circleSize = 75;
break; 
 case '2':
circleSize = 150;
break; 
 case '3':
circleSize = 275;
break; 
case'4':
circleSize=350;
}
}


