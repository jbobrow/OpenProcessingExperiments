
/*--------------------
Schotter

Created 10 Feb 2015
by Catherine Lee

--------------------*/

void setup() {
 size(13*25,24*25);
 background(255);
 noFill(); 
 rectMode(CENTER);
 noLoop();
}

void draw() {
  int i,u;
  int numberRows = 22;
  int numberColumns = 12;
  translate(25,25); //moves origin to (25,25)
  for(i = 0; i<numberRows; i++) {      //creates 22 rows
    for(u = 0; u<numberColumns; u++) {    //creates 12 columns
      pushMatrix();              //saves (25,25) ???
      translate(25*u,i*26);        //moves over and down depending on i and u
      rotate(random(TWO_PI*i/-130,TWO_PI*i/130)); //rotating after translation so that not rotating the translation
      rect(0,0,25,25);
      popMatrix();
    }
  }
}
