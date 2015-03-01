
void setup(){
size(400,350);
background(255);
}

void draw() {
}

void mousePressed() {
stroke(0);
fill(175);
rectMode(CENTER);
rect(mouseX,mouseY,160,160);



//House Dimensions and color
stroke(0);
fill(#E6ED86);
rectMode(CORNERS);
rect(100,100,260,200);

//Chimney Dimensions and color
stroke(0);
fill(#44B75A);
rectMode(CORNERS);
rect(130,20,160,70);

//Roof dimensions and color
stroke(0);
fill(#868B49);
triangle(100,100,180,20,260,100);

// Window 1
stroke(0);
fill(#79FAF7);
rectMode(CORNERS);
rect(120,120,150,150);
line(120,135,150,135);
line(135,120,135,150);

//window 2
stroke(0);
fill(#79FAF7);
rectMode(CORNERS);
rect(210,120,240,150);
line(225,120,225,150);
line(210,135,240,135);

//door
stroke(0);
fill(#FFD31F);
rectMode(CORNERS);
rect(165,160,195,200);
fill(0);
ellipse(170,180,3,3);

//Stoop
stroke(0);
fill(255);
rectMode(CORNERS);
rect(150,200,210,210);



}

