
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(57, 165, 144);
  background(57, 165, 144);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);

  for(int i = 0; i < 500/patternSeperationX; i++){
      for(int j = 0; j < 500/patternSeperationY; j++){
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
   
   
   stroke(144, 191, 179);
   strokeWeight(2);
   line(10, 5, 20, 5);
   line(25, 5, 30, 5);
   line(44, 3, 53, 3);
   line(46, 7, 57, 7);
   line(64, 7, 69, 7);
   line(70, 3, 80, 3);
   line(83, 9, 90, 9);
   line(95, 5, 100, 5);
   
   line(3, 14, 18, 14);
   line(25, 14, 35, 14);
   line(37, 17, 40, 17);
   line(45, 15, 54, 15);
   line(60, 14, 63, 14);
   line(70, 16, 85, 16);
   line(90, 18, 95, 18);
   
   line(6, 20, 10, 20);
   line(40, 22, 47, 22);
   line(4, 30, 20, 30);
   line(43, 30, 46, 30);
   line(49, 32, 59, 32);
   line(64, 33, 90, 33);
   line(0, 35, 18, 35);
   line(25, 38, 50, 38);
   line(57, 42, 65, 42);
   line(70, 43, 75, 43);
   line(80, 40, 90, 40);
   line(92, 44, 100, 44);
   line(4, 48, 10, 48);
   line(14, 45, 22, 45);
   line(30, 47, 33, 47);
   line(36, 50, 70, 50);
   line(10, 52, 20, 52);
   line(25, 51, 30, 51);
   line(44, 54, 53, 54);
   line(46, 50, 57, 50);
   line(64, 53, 69, 53);
   line(70, 53, 80, 53);
   line(83, 55, 90, 55);
   line(95, 56, 100, 56);
   line(3, 58, 18, 58);
   line(25, 57, 35, 57);
   line(37, 57, 40, 57);
   line(45, 59, 54, 59);
   line(60, 60, 63, 60);
   line(75, 58, 85, 58);
   line(90, 61, 95, 61);
   line(6, 63, 10, 63);
   line(40, 62, 47, 62);
   line(4, 65, 20, 65);
   line(43, 68, 46, 68);
   line(49, 66, 59, 66);
   line(64, 69, 90, 69);
   line(0, 70, 18, 70);
   line(25, 68, 38, 68);
   line(45, 70, 50, 70);
   line(57, 72, 65, 72);
   line(10, 75, 20, 75);
   line(25, 75, 30, 75);
   line(44, 78, 53, 78);
   line(46, 77, 57, 77);
   line(64, 80, 69, 80);
   line(70, 83, 80, 83);
   line(83, 79, 90, 79);
   line(95, 75, 100, 75);
   line(3, 84, 18, 84);
   line(25, 84, 35, 84);
   line(37, 80, 40, 80);
   line(45, 85, 54, 85);
   line(60, 86, 63, 86);
   line(70, 86, 85, 86);
   line(90, 88, 95, 88);
   line(6, 90, 10, 90);
   line(40, 92, 47, 92);
   line(4, 90, 20, 90);
   line(43, 94, 46, 94);
   line(49, 96, 59, 96);
   line(4, 98, 10, 98);
   line(14, 95, 22, 95);
   line(30, 97, 33, 97);
   line(36, 100, 49, 100);
   line(10, 99, 20, 99);
   
   
   stroke(216, 182, 42);
   strokeWeight(5);
   line(25, 0, 25, 100);
   line(75, 0, 75, 100);
   
   strokeWeight(3);
   fill(126, 8, 1);
   ellipse(25, 25, 30, 15);
   
   stroke(255);
   strokeWeight(6);
   fill(216, 182, 42);
   ellipse(25, 75, 30, 15);
   
   stroke(216, 182, 42);
   strokeWeight(5);
   fill(255);
   ellipse(75, 25, 30, 15);
   
   strokeWeight(2); 
   fill(216, 182, 42);
   ellipse(75, 75, 30, 15);
   
   stroke(255);
   strokeWeight(3);
   line(65, 72, 65, 78);
   line(72, 70, 72, 79);
   line(79, 70, 79, 79);
   line(86, 72, 86, 78);
  
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

