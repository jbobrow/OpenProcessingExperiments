
//my own project

float x; 
float easing = 8*0.1;
float diameter = 12;

void setup() {
    size(400,400);
    // set background color to white
    background(255);
    
    myhappycreature();
    mysadcreature();
} 

//*************************************************

void draw() {
myhappycreature();
//making the creature move
if (mousePressed) {
mysadcreature();
println("mouseX: " + mouseX +", mouseY " + mouseY);
}
}




//*************************************************
void myhappycreature() {
  
//coloring the body
//body
background(255);
fill(6, 255, 6);
ellipse(mouseX + 50, mouseY + 65,30,60);

//coloring the head
//head
fill(100, 125, 225);
ellipse( mouseX + 50,mouseY + 20,55,35);

//eyes
fill(255, 6, 6);
ellipse( mouseX + 35,mouseY + 20,20,20);
ellipse( mouseX + 65,mouseY + 20,20,20);

//mouth
ellipse( mouseX + 50,mouseY + 30,5,5);

//arms
line( mouseX + 38,mouseY + 49,mouseX + 30,mouseY + 76);
line( mouseX + 66,mouseY + 49,mouseX + 60,mouseY + 76);

//legs
line( mouseX + 45,mouseY + 95,mouseX + 45,mouseY + 120);
line( mouseX + 55,mouseY + 95,mouseX + 55,mouseY + 120);
}


//*************************************************
void mysadcreature() {

background(255);
//coloring the body
//bodyfill(6, 255, 6);
ellipse(mouseX + 50, mouseY + 65,30,60);

//coloring the head
//head
fill(100, 125, 225);
ellipse( mouseX + 50,mouseY + 20,55,35);

//eyes
fill(255, 6, 6);
ellipse( mouseX + 35,mouseY + 10,10,10);
ellipse( mouseX + 65,mouseY + 10,10,10);

//mouth
ellipse( mouseX + 50,mouseY + 30,5,5);

//arms
line( mouseX + 38,mouseY + 49,mouseX + 60,mouseY + 76);
line( mouseX + 66,mouseY + 49,mouseX + 60,mouseY + 76);

//legs
line( mouseX + 45,mouseY + 95,mouseX + 45,mouseY + 120);
line( mouseX + 55,mouseY + 95,mouseX + 55,mouseY + 120);
}

