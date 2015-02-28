
class Grid  {
  
  
  float dia;
  float innerOpac;
  color lineColor1;
  color lineColor2;
  
  Grid()   {
  dia = 1;
  innerOpac = 255;
  lineColor1=color(20, 20, 150);
  lineColor2=color(mouseX, mouseY, 150);
  }
  
  void display()  {
    
    if (mousePressed == true)   {
     int passedTime1 = millis() - savedTime1;
     if (passedTime1 > totalTime1)  {
        noFill();
      stroke(lineColor2, innerOpac);
      ellipse(mouseX, mouseY, dia, dia);      
      dia = dia * 1.05;
      innerOpac = innerOpac - 10;
      if (innerOpac <= 50)  {
        innerOpac = innerOpac * 3;
      }
   savedTime1 = millis();
     }
    }
    
    if (mousePressed == false)   {
      dia = 1;
      innerOpac = 255;
    }
    
  }
  
}








class Line  {
  
  
  float dia;
  float innerOpac;
  color lineColor1;
  color lineColor2;
  
  Line()   {
  dia = 1;
  innerOpac = 255;
  lineColor1=color(random(35,50), random(100, 150), random(150, 190), random(75,255));
  lineColor2=color(mouseX, mouseY, 175);
  }
  
  void display()  {
    
    if (mousePressed == true)   {
     int passedTime1 = millis() - savedTime1;
     if (passedTime1 > totalTime1)  {
        noFill();
        strokeWeight(0.9);
      stroke(lineColor1);
      line(mouseX, mouseY, dia+mouseY/2, dia+mouseX/2);      
      dia = dia * 1.1;
      innerOpac = innerOpac - 10;
      if (innerOpac <= 50)  {
        innerOpac = innerOpac * 3;
      }
   savedTime1 = millis();
     }
    }
    
    if (mousePressed == false)   {
      dia = 1;
      innerOpac = 255;
    }
    
  }
  
}
  
  
  
  
  

