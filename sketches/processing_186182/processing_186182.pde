
/*--------------------
Schotter 2

Created 16 Feb 2015
by Catherine Lee

--------------------*/

void setup() {
 size(14*25,25*25);
 background(255);
 noFill(); 
 rectMode(CENTER);
 smooth();
 noLoop();
}

void draw() {
  int i,u;
  int numberRows = 22;
  int numberColumns = 12;
  //translate(23,25);
  
  for(i = 0; i<numberRows; i++) {      //creates 22 rows
    for(u = 0; u<numberColumns; u++) {    //creates 12 columns
      pushMatrix();              //saves (25,25)
      translate(5+25*u,i*25);        //moves over and down depending on i and u
      rotate(random(TWO_PI*i/-130,TWO_PI*i/130)); //rotating after translation so that not rotating the translation
      rect(30,26,25,25);
      popMatrix();
    }
  }
}
