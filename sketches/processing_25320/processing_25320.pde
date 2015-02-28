


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?


 

int offset = 25;
void setup(){
  
size(200,400);

background(#396a26);
int patternSeperationX = 100;
int patternSeperationY = 80;


  //the white box simply shows you the space your pattern gets drawn in






  
  
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
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
  
noStroke();
color c = color(105, 113, 216, 83);
fill(c);
rect(30, 30, 70, 140);
float value = alpha(c);  //Sets "value" to "102"
fill(value);
rect(100, 30, 70, 140);

stroke(#6c07b4);
line(85, 20, 85, 75);
stroke(#6c07b4);
line(85, 75, 30, 75);

stroke(#6c07b4);
line(75, 85, 20, 85);
stroke(#6c07b4);
line(35, 75, 85, 30);


  
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


curveVertex(500+offset,455+offset);
curveVertex(35+offset,45+offset);
curveVertex(15+offset,500+offset);
curveVertex(200+offset,45+offset);

 endShape(); 
 
 

 
 fill(#186247);
 quad(30+offset,100+offset,86+offset,20+offset,45+offset,30+offset,63+offset,76+offset);
 quad(76+offset,63+offset,30+offset,45+offset,20+offset,86+offset,100+offset,30+offset);





//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!





}

