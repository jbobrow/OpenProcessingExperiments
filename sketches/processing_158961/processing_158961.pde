
void setup() {
  size(500,570);
}

void draw() {
  
strokeWeight(3);
stroke(255,255,255,255);

fill(0,0,0,255);

rectMode(CENTER);
rect(250,285,500,570);
rect(250,70,10,50); //sights small
rect(250,80,20,40); //sights
rect(250,390,80,250); //handle
rect(250,380,40,100); //trigger




ellipse(250,235,250,250); //outer chamber circle
//ellipse(250,235,175,175); //chamber ref
ellipse(250,235,50,50); //pivot
ellipse(250,235,25,25); //small pivot

fill(58,102,151,255); //blue
ellipse(250,320,60,60); //bottom bullet
fill(220,210,60,255); //yellow
ellipse(175,195,60,60); //top left bullet
fill(245,119,192,255); //pink
ellipse(325,195,60,60); //top right bullet
fill(199,196,189,255); //white
ellipse(175,275,60,60); //bottom left bullet
fill(148,95,1); //brown
ellipse(325,275,60,60); //bottom right bullet

fill(0,0,0,255);
ellipse(250,150,130,130); //outer barrel
ellipse(250,150,100,100); //inner barrel
fill(237,161,13,255); //orange
ellipse(250,150,60,60); //top bullet

//RES

fill(255,255,255,255);
rectMode(CORNER);
rect(20,20,15,100);
rect(20,20,60,15);
rect(65,20,15,45);
rect(20,65,75,15);
rect(80,65,15,55);

rect(20,155,75,15);
rect(20,155,15,100);
rect(20,197.5,60,15);
rect(20,240,75,15);

rect(20,290,75,15);
rect(20,290,15,50);
rect(20,332.5,75,15);
rect(80,332.5,15,50);
rect(20,375,75,15);

//DOG
rect(405,20,60,15);
rect(405,20,15,100);
rect(405,105,60,15);
rect(468,38,15,65);

rect(405,155,75,15);
rect(405,155,15,100);
rect(465,155,15,100);
rect(405,240,75,15);

rect(405,290,75,15);
rect(405,290,15,100);
rect(405,375,75,15);
rect(465,335,15,50);
rect(450,335,15,15);

}


