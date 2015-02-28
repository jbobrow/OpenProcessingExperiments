


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?


int patternSeperationX;


int offset = 1;
void setup() {

  size(200,400);
  background(#396a26);
  patternSeperationX = 80;
  int patternSeperationY = 80;

  //the white box simply shows you the space your pattern gets drawn

  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      yourFunction();
      popMatrix();
    }
  }
 
  
}


void draw() {
  //This is here so the program keeps running and the screengrab will work
}


  
  


void yourFunction() {

  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)

  stroke(#59e017);
  strokeWeight(4);
  noFill();
  beginShape();

  curveVertex(20+offset,15+offset);
  curveVertex(55+offset,45+offset);
  curveVertex(500+offset,20+offset);
  endShape();


  stroke(#125525);
  noFill();
  beginShape();


  curveVertex(50+offset,45+offset);
  curveVertex(35+offset,45+offset);
  curveVertex(15+offset,500+offset);
  curveVertex(200+offset,45+offset);

  endShape(); 

  stroke(#125525);
  noFill();
  beginShape();


  curveVertex(455+offset,500+offset);
  curveVertex(45+offset,35+offset);
  curveVertex(550+offset,15+offset);
  curveVertex(45+offset,200+offset);

  endShape(); 

  fill(#186247);
  quad(30+offset,100+offset,86+offset,20+offset,45+offset,30+offset,63+offset,76+offset);
  quad(76+offset,63+offset,30+offset,45+offset,20+offset,86+offset,100+offset,30+offset);





  //Takes PNG screenshots when you push S
  //Careful - doesn't prompt when overwriting files!
}


