
int savedTime1;
int savedTime2;
int totalTime1 = 5;
int totalTime2 = 50;
float dia = 1;
float inner = 255;
float twoAlpha = 0;

void setup()   {
  size(715, 715);
  background(235);
  smooth();
  strokeWeight(1);
  frameRate(60);
  savedTime1 = millis();
  savedTime2 = millis();
}
    
    void draw()   {
      color lineColor1 = color(20, 20, 150);
      color lineColor2 = color(random(-20, 20), 150+random(0, 100), random(-20, 20));
      float littleSize = random(5, 25) + abs(pmouseX - mouseX);
       int posX = mouseX;
       int posY = mouseY;
  
  if (mousePressed == true)   {
     int passedTime1 = millis() - savedTime1;
     int passedTime2 = millis() - savedTime2;
     if (passedTime1 > totalTime1)  {
        noFill();
      stroke(0, inner);
      rectMode(CENTER);
      rect(posX, posY, dia, dia);      
      dia = dia * 1.05;
      inner = inner - 10;
      if (inner <= 50)  {
        inner = inner * 3;
      }
      
   savedTime1 = millis();
     }
     
     
     if (passedTime2 > totalTime2)  {
     stroke(0, twoAlpha);
       // noStroke();
      // fill(0, random(10, 75));
      rect(mouseX + random(-200, 600), mouseY + random(-200, 400), littleSize, littleSize);      
    savedTime2 = millis();
    
     }           
   }
 }
    
   
    
    void mouseReleased()   {
      dia = 1;
      inner = 255;
    }
    
    
void keyPressed()   {
    if (key == 'z')  {
       background(235);
    }
    
    if (key == 'a')  {
       twoAlpha = 255;
    }
     if (key == 's')  {
       twoAlpha = 0;
    }
    
  }
    
  


