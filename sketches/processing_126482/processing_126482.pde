
float n = 0;

void setup(){
size(400,400);
background(0,0,0);
rectMode(CENTER); //this mode changes the rect coordinate system
}

void draw (){
fill(0,0,0,60); // the fourth value is for transparency
rect(0,0,width + 400,height+400); // mimetised screen

fill(255); //setting color for the square
noStroke();
translate(mouseX,mouseY); //this moves the axis center to the mouse
rotate(n);
rect(0,0,50,50); //creates square in center
n = n + 0.09;    //adds constant rotation
}
