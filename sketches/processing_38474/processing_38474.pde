
//Nathan Aaronson
//This code shows a random number of
//rectangles with random widths and heights
//organized around a circle
//This was inspired by my parti for studio
//which uses the same scheme except
//with a semicircle

void setup () {
size(500,500);
background(0);
}

void draw () {
smooth();
fill(255,0,0);
ellipse(width/2,height/2,20,20);
}

void mouseClicked () {
  background(0);
  int radius = 150;

translate(width/2, height/2);  //move origin to the center

for(int x = 0; x < 360; x+=random(5,50)){
  pushMatrix();   //new coordinate system
    rotate(radians(x));    //rotate the origin
    translate(radius,0);   //move the origin to the radius
    fill(255,150);
    rectMode(CENTER);
    rect(0,0,random(100,150),random(25,75));  //draw the random rectangles
  popMatrix();    //reset the coordinate system
}
}


