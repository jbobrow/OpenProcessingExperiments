
PImage steps;

void setup() {
size(400,400);
steps = loadImage("steps.jpg");
image(steps, 400, 400);
//background(0, 100, 43);

smooth();
}

void draw () {
  background(steps);

int y=140;
int x=200;
x=mouseX;
y=mouseY;
//background(0, 100, 43);


//if (mousePressed) {
  //background(38,0,166);
  
//}


noStroke();

fill(193, 62, 24);
triangle(x, y, x+50, y-90, x-50, y-90); //Head

fill(255, 73, 22);
triangle(x-10, y-90, x, y-60, x+10, y-90); //head diamond colour

noStroke();
fill(237, 95, 24);
triangle(x+50, y-90, x+30, y-130, x+30, y-90); //Right Ear

triangle(x-50, y-90, x-30, y-130, x-30, y-90); // Left Ear

fill(0);
stroke(1);
triangle(x, y, x+10, y-20, x-10, y-20); //nose

noStroke();

fill(237, 95, 24);

triangle(x, y, x+40, y+60, x-40, y+60); //Shoulders
rect(x-40, y+60, 80, 100); //body


fill(193, 62, 24);
rect(x+40, y+120, 50, 20);
rect(x+90, y+120, -20, -30);
quad(x+70, y+90, x+90, y+100, x+110, y+70, x+85, y+70);
rect(x+85, y+70, 50, 20);
rect(x+135, y+70, -30, -30); 
triangle(x+135, y+40, x+120, y+20, x+105, y+40); //tail shape

fill(237, 95, 24);
triangle(x+135, y+90, x+120, y+70, x+105, y+90); 
fill(255, 73, 22);
triangle(x+113, y+30, x+120, y+20, x+127, y+30); //tail details colour

fill(193, 62, 24);
triangle(x+40, y+160, x, y+160, x+20, y+180);
triangle(x-40, y+160, x, y+160, x-20, y+180); //Paws (feet)


triangle(x-40, y+60, x-10, y+80, x-40, y+100);
ellipseMode(CORNER);
ellipse(x-52, y+60, 20, 40);
fill(255, 73, 22);
triangle(x-40, y+100, x-20, y+120, x-40, y+140); //paws (left hand)

fill(193, 62, 24);
triangle(x+40, y+60, x+10, y+80, x+40, y+100);
ellipse(x+31, y+60, 20, 40);
fill(255, 73, 22);
triangle(x+40, y+100, x+20, y+120, x+40, y+140); //paws (right hand)


if (mouseY<320) {
  fill(0,169,235); 
}

else {
  noFill();
  stroke(237, 95, 24);
  strokeWeight(0.5);
}                            // shuts eyes when hiding in long grass

if (mousePressed) {
  
  fill (237, 95, 24);       // blinks
  
}

//float c=map(mouseY, 400, 0, 0, 300);
//stroke(237, 95, 24, 160);
//fill(c,c);

triangle(x+10, y-70, x+30, y-70, x+10, y-50); //Right Eye
triangle(x-10, y-70, x-30, y-70, x-10, y-50); //Left Eye

stroke(73, 49, 30);
strokeWeight(4);
strokeCap(ROUND);

for (int g=0; g<410; g+=10) {
  if (mousePressed) {
  float my =mouseY /10;
  float offsetA =random(-my, my);
  float offsetB =random(-my, my);
  
  line(g +offsetA, 320, g - offsetB, 400);
  }
 else {
   for (int gS=0; gS<410; gS+=10) {
   line(gS, 320, gS, 400);
   }
 }
}                                    //makes grass wave


}












