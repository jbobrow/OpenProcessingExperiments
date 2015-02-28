




///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?



void setup(){

  size(200,400);



  
  //the white box simply shows you the space your pattern gets drawn in

background(#396a26); 
int patternSeperationX = 80;
int patternSeperationY = 50;




  
  
  
  for(int i = 1; i < width/patternSeperationX; i++){
      for(int j = 1; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  

}


void draw(){
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
stroke(#59e017);
strokeWeight(4);
noFill();
beginShape();
curveVertex(500,50);
curveVertex(500,50);
curveVertex(50,50);
curveVertex(50,50);
curveVertex(50,50);
curveVertex(500,50);
endShape();

stroke(#125525);
noFill();
beginShape();


curveVertex(500,220);
curveVertex(35,450);
curveVertex(32,50);
curveVertex(225,405);
 endShape(); 
 fill(#186247);
 quad(30, 30, 86, 20, 45, 63, 3, 76);
 quad(100, 38, 63, 45, 20, 86, 30, 30);



//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!

  

}

