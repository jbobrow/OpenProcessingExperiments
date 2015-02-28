
/***

This is program that sketches a model of our solar system. 
Stars are set to twinkle every frame that passes. Enjoy.

credits to 
http://www.enotes.com/science-fact-finder/space/what-colors-planets
http://www.universetoday.com/15568/how-many-planets-are-in-the-solar-system/

***/

// By Allen Andrew Vanevery Jr
void setup() {
size(200,200); // Set the size of the window
background(0); // Draw a black background
smooth();

//Sun
fill(255,159,3); //redorange
ellipse(200,200,80,80); //Sun

// Planets
fill(0,0,255);
ellipse(20,20,20,20); // Neptune

fill(0,255,0);
ellipse(40,40,20,20); // Uranus

fill(255,255,0);
ellipse(60,60,35,35); // Saturn

stroke(131,75,0); //Brown
fill(255,0,0); // Red
ellipse(80,80,40,40); // Jupiter

fill(255,0,0); //Red
ellipse(100,100,7,7); // Mars

stroke(0,0,255);
fill(0,255,0); //Green
ellipse(120,120,10,10); // Earth

fill(255,255,0); //Yellow
ellipse(140,140,5,5); // Venus

fill(255,147,5); //Orange
point(160,160); // Mercury

//Legend
fill(255);
stroke(0);
rect(0,170,100,35);

//The Word Planet
line(5,175,5,190);//P
ellipse(10,177,10,10);

line(17,175,17,190); //L

ellipse(23,187,7,7); //A
line(25,183,27,190);

line(29,183,29,190); //N
line(29,183,35,183);
line(35,183,35,190);

line(37,183,43,183); //E
line(37,183,37,190);
line(37,186,43,186);
line(37,190,43,190);

line(45,183,52,183); //T
line(48,183,48,190);
}
//Stars
void draw() {
int starX = int(random(1,195));
int starY = int(random(1,195));
stroke(255);
point(starX,starY);
}

