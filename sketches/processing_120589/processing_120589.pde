
PImage milkyway;//stores image
PFont aloveofthunder;//creates font variable

void setup(){
size (400,400); // Sketch window size
milkyway = loadImage("milkyway.gif");//loads image to sketch window
aloveofthunder = loadFont("ALoveofThunder-48.vlw");//loads font to window
smooth(); // Smooth animation
}

void draw(){

float R = random(255); // Randomly chooses a shade of red
float G = random(255); // Randomly chooses a shade of green 
float B = random(255); // Randomly chooses a shade of blue
image(milkyway,0,0); // Set an image as the background and it starts at coordinates 0,0
fill(0,150,200); // Colour of the text 
textFont(aloveofthunder,20);//creates font in that size
textAlign(LEFT); //sets text alignment
text("Martin Wingman",20,50); // Text that will be displayed
ellipseMode(CENTER); // Coordinates take from centre of ellipse
rectMode(CENTER); // Coordinates take from centre of rectangle

//Left Wing
fill(65,88,98); // Colour of left wing
triangle(mouseX+0,mouseY+20,mouseX-90,mouseY+20,mouseX+0,mouseY-50); // Coordinates of left wing

//Right Wing
fill(65,88,98); // Colour of right wing
triangle(mouseX+0,mouseY+20,mouseX+90,mouseY+20,mouseX+0,mouseY-50); // Coordinates of right wing

// Lower Body
fill(0,176,255); // Colour of the left arm
rect(mouseX,mouseY+30,70,40); // Size and coordinates of the lower body

// Body
stroke(0);// Colour of the line
fill(0,44,255); // Colour of the body
ellipse(mouseX,mouseY,80,80); // Size and coordinates of the body

// Left Arm
fill(0,255,18); // Colour of the left arm
ellipse(mouseX-40,mouseY,20,20); // Size and coordinates of the Ellipse
rect(mouseX-55,mouseY,20,10); // Size and coordinates of the Rectangle

// Right Arm
fill(0,255,18); // Colour of the left arm
ellipse(mouseX+40,mouseY,20,20); // Size and coordinates of the Ellipse
rect(mouseX+55,mouseY,20,10); // Size and coordinates of the Rectangle

// Head
fill(0,176,255); // Colour of the head
ellipse(mouseX,mouseY-40,60,60); // Size and coordinates of the head

// Eyes
fill(R,G,B); // Colour of the eyes
ellipse(mouseX-10,mouseY-50,12,20); // Size and coordinates of the left eye
ellipse(mouseX+10,mouseY-50,12,20); // Size and coordinates of the right eye

// Legs
fill(255); // Colour of the leg
line(mouseX-30,mouseY+50,mouseX-40,mouseY+60); // Size and coordinates of Leg 1
line(mouseX+30,mouseY+50,mouseX+40,mouseY+60); // Size and coordinates of Leg 2

}



