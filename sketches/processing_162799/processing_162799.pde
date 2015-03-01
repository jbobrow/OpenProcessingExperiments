
//setup() function runs once, at beginning of program

void setup() {
  size(500, 500);
fill(#2B7520);
noStroke();
ellipse(250,400,300,350);
fill(#328724);

ellipse(250,450,225,275);

fill(#2B7520);

ellipse(250,250,300,150);

fill(#E305E3);
strokeWeight(2);
arc(250, 255, 100, 100, 0, PI);
fill(0,0,0);
ellipse(235,240,5,15);
ellipse(265,240,5,15);
}

//draw() function loops infinitely, allows animation and interaction

void draw() {
 
  fill(random(255), random(255), random(255)); 
  ellipse(150, 200, random(100), random(100)); 

  fill(random(255), random(255), random(255)); 
  ellipse(350, 200, random(100), random(100)); 
}

