
int x;
int y;



void setup() {
size(720, 480);
smooth();

}


void draw () {
  
  
x = 50;
y = 50;

//Body
noStroke();
fill(225);
ellipse(x+295, y+177, 55, 100); //Right Sholder
ellipse(x+325, y+177, 55, 100); //Left Sholder
fill(0);
rect(x+295, y+126, 30, 250); //Middle Shape
fill(50);
triangle(x+295, y+126, 320, 250, 345, 423); //Left Side
triangle(x+325, y+126, 400, 250, 375, 423); //Right Side

//Feet
fill(255, 121, 0);
triangle(x+295, y+376, 352, 415, 360, 426); //Left Foot
triangle(360, 426, 368, 415, 375, 426); //Right Foot

//Neck
fill(230);
ellipse(x+310, y+127, 25, 40); // Neck
fill(190);
ellipse(x+310, y+127, 20, 10); // Neck Shadow


//Top
noStroke();
fill(0);
ellipse(x+310, y+50, 155, 155); //Head
fill(255);
ellipse(x+310, y+77, 100, 100); //Face
fill(0);
ellipse(x+285, y+63, 15, 15); //Left Eye
fill(0);
ellipse(x+335, y+63, 15, 15); //Right Eye
stroke(0);
line(x+310, x+63, 360, 140); //Nose
line(x+300, y+90, 370, 140); //Mouth
stroke(255);
line(x+310, y+-32, 360, 90); //Hair Line
line(x+275, y+63, 345, 113); //Eye Ball
line(x+325, y+63, 405, 113); // Eye Ball
}





