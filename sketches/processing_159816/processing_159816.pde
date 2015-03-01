
//week 2 assignment 5

//change the following values to change screen size:
int sizeX = 450; //width of the screen
int sizeY = 210; //height of the screen

int centerX = sizeX/2; //half of screen width
int centerY = sizeY/2; //half of screen height

void setup() { 
size(sizeX,sizeY); 
}

void draw() { 
background(255); 
stroke(0); 
line(centerX,0,centerX,sizeY); 
line(0,centerY,sizeX,centerY); //stopped working here. not done yet.

noStroke();
fill(0);

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
