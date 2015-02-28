
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(400,800);
  smooth();

   
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(#000000);
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
   
}
 
 
void draw()
{
  //This is here so the program keeps running and the screengrab will work
}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
   
  
  
fill(#5FB6FF);
noStroke();
beginShape();
vertex(10, 41);
vertex(24, 39);
vertex(27, 22);
vertex(30, 39);
vertex(45, 41);
vertex(30, 44);
vertex(27, 60);
vertex(24, 44);
endShape(CLOSE);

fill(#264C6C);
noStroke();
beginShape();
vertex(65, 54);
vertex(68, 65);
vertex(78, 68);
vertex(68, 71);
vertex(65, 82);
vertex(62, 71);
vertex(52, 68);
vertex(62, 65);
endShape(CLOSE);

fill(#5FB6FF);
noStroke();
beginShape();
vertex(78, 32);
vertex(80, 39);
vertex(87, 40);
vertex(80, 41);
vertex(78, 48);
vertex(77, 41);
vertex(71, 40);
vertex(77, 39);
endShape(CLOSE);

stroke(#264C6C);
line(50, 19, 50, 25);
stroke(#264C6C);
line(48, 22, 52, 22);

stroke(#5FB6FF);
line(15, 80, 15, 86);
stroke(#5FB6FF);
line(13, 83, 17, 83);

stroke(#264C6C);
line(40, 80, 40, 90);
stroke(#264C6C);
line(35, 85, 45, 85);

stroke(#5FB6FF);
line(85, 97, 90, 97);
stroke(#5FB6FF);
line(87, 100, 87, 95);
   
}
 
 void keyPressed() {
 save("wallpaper3.png");
}


