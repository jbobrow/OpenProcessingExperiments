


//what happens if you change these both to 50? what are they doingtothe pattern?
int patternSeperationX = 75;
int patternSeperationY = 75;


void setup(){
 size(300,600);
 smooth();
 //the white box simply shows you the space your pattern gets drawn in
 fill(255);
 noStroke();
 rect(0,0,patternSeperationX,patternSeperationY);
 stroke(0);
 background(255);
 for(int i = 0; i < width/patternSeperationX; i++){
    for(int j = 0; j < height/patternSeperationY; j++){
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      yourFunction();
      popMatrix();
    }
 }

}





void yourFunction(){

 //-------------------------------------YOUR PATTERN GOESINHERE-------------------------------
 //try making pleasant designs :-)


fill(100, 100, 255);
noStroke();
rect(0, 0, 300, 44);


int a = 0;

while(a < 10)
{
 stroke(0, 0, 255);
 strokeWeight(2);
 line(0, 11*a, width, 11*a);
 a = a+1;
}

fill(222, 36, 36);
strokeWeight(1);
stroke(0, 0, 103);
triangle(10, 65, 60, 65, 35, 10);

fill(255, 244, 15, 225);
noStroke();
triangle(11, 64, 34, 64, 18, 50);
triangle(18, 50, 38, 50, 25, 35);

stroke(0, 0, 103);
line(34, 65, 45, 33);



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


void draw(){
 noLoop();
 fill(185, 131, 30, 45);
 noStroke();
 rect(0, 0, 100, 530);
 rect(0, 0, 200, 100);
 rect(0, 0, 250, 550);
 
}



