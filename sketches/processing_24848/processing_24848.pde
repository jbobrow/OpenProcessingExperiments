

//what happens if you change these both to 50? what are they doingtothe pattern?
int patternSeperationX = 75;
int patternSeperationY = 75;


void setup() {

 size(300,600);
 smooth();
 //the white box simply shows you the space your pattern gets drawn in
 noStroke();
 rect(0,0,patternSeperationX,patternSeperationY);
 stroke(0);
 background(196, 200, 255);
 for(int i = 0; i < width/patternSeperationX; i++) {
   for(int j = 0; j < height/patternSeperationY; j++) {
     pushMatrix();
     translate(i*patternSeperationX, j*patternSeperationY);
     yourFunction();
     popMatrix();
   }
 }
}



void yourFunction() {

 //-------------------------------------YOUR PATTERN GOESNHERE-------------------------------
 //try making pleasant designs :-)

 int a = 0;

 while(a < 10)
 {

   strokeWeight(2);
   stroke(0, 0, 255, 20);
   line(0, 11*a, width, 11*a);
   a = a+1;
 }
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

void draw() {
 noLoop();

 stroke(255, 244, 15, 225);
 strokeWeight(2);
 line(20, 120, 20, 600);
 stroke(222, 36, 36, 225);
 line(40, 99, 40, 600);
 line(30, 135, 30, 600);
 line(50, 150, 50, 600);
 line(50, 90, 50, 600);


 stroke(0, 1, 111, 255);
 line(300, 65, 260, 65);
 line(300, 129, 240, 129);
 line(300, 150, 265, 150);

 stroke(255);
 line(240, 99, 170, 99);
 line(220, 140, 150, 135);

 line(20, 120, 90, 120);
 line(40, 99, 110, 90);
 line(30, 135, 100, 140);
 line(50, 150, 120, 160);
 line(50, 90, 120, 65);

 fill(255);
 noStroke();
 triangle(240, 99, 230, 99, 239, 90);
 triangle(240, 99, 230, 99, 240, 105);
 triangle(220, 140, 210, 140, 220, 130);
 triangle(220, 140, 215, 140, 225, 150);

 triangle(90, 120, 84, 120, 90, 110);
 triangle(90, 120, 80, 120, 97, 125);
 triangle(110, 90, 100, 93, 110, 85);
 triangle(110, 90, 100, 93, 110, 95);
 triangle(100, 140, 90, 140, 99, 130);
 triangle(100, 140, 90, 140, 100, 146);
 triangle(120, 160, 110, 160, 120, 155);
 triangle(120, 160, 110, 160, 120, 169);
 triangle(120, 65, 110, 70, 120, 55);
 triangle(120, 65, 110, 70, 125, 70);


 stroke(0, 0, 255, 50);
 line(300, 65, 280, 65);
 line(300, 65, 290, 65);
 line(300, 129, 270, 129);
 line(300, 129, 285, 129);
 line(300, 150, 280, 150);
 line(300, 150, 290, 150);


}





