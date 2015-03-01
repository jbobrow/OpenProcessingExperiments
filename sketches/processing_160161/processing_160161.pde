
//week 2 assignment 5b

//change the following values to change screen size:
int sizeX = 450; //width of the screen
int sizeY = 210; //height of the screen

int centerX = sizeX/2; //half of screen width
int centerY = sizeY/2; //half of screen height

int color; //declares the variable "color" as an integer, because color variables cannot have decimals.

void setup() { 
size(sizeX,sizeY); 
}

void draw() { 

if (mousePressed) {    //determines color of box (black/grey)
    color = 150
} else {
    color = 0
}

background(255); 
stroke(0); 
line(centerX,0,centerX,sizeY); 
line(0,centerY,sizeX,centerY);

noStroke();
fill(color);

if (mouseX < centerX && mouseY < centerY) { 
    rect(0,0,centerX,centerY); 
} else if (mouseX > centerX && mouseY < centerY) { 
    rect(centerX,0,centerX,centerY); 
} else if (mouseX < centerX && mouseY > centerY) { 
    rect(0,centerY,centerX,centerY); 
} else if (mouseX > centerX && mouseY > centerY) { 
    rect(centerX,centerY,centerX,centerY); 
} 

}


