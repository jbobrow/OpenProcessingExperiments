
//Designing a Robot
//Inspiration http://blog.spoongraphics.co.uk/wp-content/uploads/2011/robot/robot-character-sm.jpg
//Colin McCarthy

//Setup
void setup(){
size(700,1000);
smooth();
frameRate(20);
}

void draw(){
background(240);
ellipseMode(RADIUS);

// End Setup

//
// Body
//
strokeWeight(4);
stroke(0);
fill(200);

// Chest
beginShape();
vertex(225,340);
vertex(475,340);
vertex(475,500);
vertex(425,660);
vertex(275,660);
vertex(225,500);
endShape(CLOSE);
// End Chest

// Lines
strokeWeight(1);
line(245,515,280,650);
line(259,515,289,650);
line(274,515,298,650);
line(288,515,307,650);
line(303,515,316,650);
line(317,515,325,650);
line(331,515,334,650);
line(345,515,345,650);
// Half
line(355,515,355,650);
line(369,515,364,650);
line(383,515,373,650);
line(397,515,384,650);
line(411,515,393,650);
line(425,515,405,650);
line(440,515,414,650);
line(455,515,421,650);
// End Lines

// Small Circles
fill(25,100,125);
ellipse(250,480,7,7);
ellipse(275,480,7,7);
ellipse(300,480,7,7);
ellipse(325,480,7,7);
// End Small Circles

// Rectanges
fill(150);
  //grey
strokeWeight(2);
rect(235,350,165,120);

fill(25,100,125);
  //blue
strokeWeight(1);
rect(250,365,90,90);

fill(215,230,30);
  //yellow
strokeWeight(1);
rect(350,365,40,90);
// End Rectangles

// Circles
fill(150);
strokeWeight(2);
ellipse(435,380,20,20);

fill(150);
strokeWeight(2);
ellipse(435,450,20,20);

fill(215,230,30);
strokeWeight(1);
ellipse(435,450,15,15);

fill(215,10,25);
  //red
strokeWeight(1);
ellipse(435,380,15,15);
// End Circles

//
// End Body
//

//
// Legs
//
fill(100);
strokeWeight(4);
rect(300,660, 30,70);

fill(100);
strokeWeight(4);
rect(375,660, 30,70);
// end legs

//feet
fill(215,10,25);
strokeWeight(4);
beginShape();
vertex(315,720);
vertex(340,740);
vertex(355,770);
vertex(275,770);
vertex(290,740);
vertex(315,720);
endShape();

fill(215,10,25);
strokeWeight(4);
beginShape();
vertex(390,720);
vertex(415,740);
vertex(430,770);
vertex(350,770);
vertex(365,740);
vertex(390,720);
endShape();
// end feet

//
// End Legs
//

//
// Head
//

// Neck
fill(35,200,240);
strokeWeight(2);
beginShape();
ellipse(325,325,5,5);
ellipse(325,335,5,5);
ellipse(375,325,5,5);
ellipse(375,335,5,5);
noStroke();
rect(325,320, 50,10);
rect(325,330, 50,10);
stroke(0);
strokeWeight(2);
line(325,330,375,330);
endShape();
// End Neck

fill(125);
strokeWeight(4);
rect(250,250, 200,70);

fill(215,250,30);
strokeWeight(1);
ellipse(305+((((mouseX-350)^2)/10)+15),280+((((mouseY-500)^2)/30)+5),15,15);

fill(215,230,30);
strokeWeight(1);
ellipse(395+((((mouseX-350)^2)/10)-15),280+((((mouseY-500)^2)/30)+5),15,15);

//
// End Head
//

//
// Arms
//

fill(150);
strokeWeight(4);
rect(150,350, 75,25);

fill(150);
strokeWeight(4);
rect(475,350, 75,25);

fill(215,10,25);
strokeWeight(4);
rect(165,375, 50,100);

fill(215,10,25);
strokeWeight(4);
rect(490,375, 50,100);

//
// End Arms
//

//
//Fire all Lazers
//
if (mousePressed){
fill(215,250,30);
ellipse(300,285,700,35);
ellipse(400,285,700,35);

fill(0,0,0);
textSize(45);
text( "I Am Firing All Lazers",100,100);

}
//
//End Fire Lazers
//

}
