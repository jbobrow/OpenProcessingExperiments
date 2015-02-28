
Zoog[] zoogies = new Zoog[200];

void setup() {
size(400,400);
smooth();
for (int i = 0; i < zoogies.length; i++) {
zoogies[i] = new Zoog(random(width),random(height),30,30,8);
}
}

void draw() {
background(255); // Draw a black background
for (int i = 0; i < zoogies.length; i++) {
zoogies[i].display();
zoogies[i].jiggle();
}
}

class Zoog {
// Zoog's variables
float x,y,w,h,eyeSize;
// Zoog constructor
Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {
x = tempX;
y = tempY;
w = tempW;
h = tempH;
boolean mouse;
eyeSize = tempEyeSize;
}

// Move Zoog
void jiggle() {
// Change the location
x = x + random(-1,1);
y = y + random(-1,1);
// Constrain Zoog to window
x = constrain(x,0,width);
y = constrain(y,0,height);
}

  
// Display Zoog
void display() {
  //body
fill(150);
stroke(0); 
ellipse(x,y+30,28,40); 

//head
ellipse(x,y,w,w); 

//hands
ellipse(x-7,y+40,8,8);
ellipse(x+8,y+40,8,8);

//nose 
ellipse(x,y+20,8,4); 

//eyes
ellipse(x-10,y+10,8,16); 
ellipse(x+10,y+10,8,16);  
stroke(0);
ellipse(x-11,y+7,4,8); 
ellipse(x+9,y+7,4,8); 

//feet
stroke(0);
ellipse(x-13,y+52,25,15); 
ellipse(x+14,y+52,25,15);

//ears
stroke(0);
ellipse(x-19,y-35,16,32); 
ellipse(x+19,y-35,16,32); 
stroke(0);
ellipse(x-18,y-25,8,16); 
ellipse(x+18,y-25,8,16); 

}

}

