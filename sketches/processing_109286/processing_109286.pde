
//Nancy Own - Visual Studios
//Assignment #1/2  09/12/13



void setup() {

// set window size
size(400,400);
// styling
smooth();


}

void draw() {
  
  float bg = random(255);
  background(bg);
 //randomize colors of pink circles 
 //drwaing ellipses
  fill (255,34,bg);
  ellipse (200,200,90,90);
  ellipse (132,132,120,120);
  ellipse (80,80,50,50);
  ellipse (360,360,90,90);
  ellipse (280,280,150,150);
  ellipse (275,165,90,90);
  ellipse (100,200,40,40);
  ellipse (50,340,170,170);
  ellipse (165,275,90,90);
  ellipse (45,220,90,90);
  ellipse (110,250,65,65);
  ellipse (185,380,140,140);
  //randomize color of radius changing cirlce
  fill (bg,0,bg);
  //random radius
  ellipse (370,50,bg,bg);
  //add text to composition
  text("Nancy", 20, 70);
  //randomize text size
  float name = random(100);
  textSize(name);
  


}





