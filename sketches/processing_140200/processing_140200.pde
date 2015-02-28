
int savedTime;
int totalTime = 5000;

void setup() {
  size(350,350);
  background(255);
  savedTime = millis();
}

void draw() {
  drawButton();
  timer();
}

void timer()                               // Checks if time passed is XXXX seconds! - tbd by PARAMETER
{
  
  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) {
    println( " 5 seconds have passed! " );
    savedTime = millis();                     // Save the current time to restart the timer!
    writeValue();
  }
  
}


int rectCoorX = 100;
int rectCoorY = 100;
int rectWidth = 100;
int rectHeight = 30;
color rectColor = color(180);
color overColor = color(230);
color currentColor;

boolean mouseOverSave(int x, int y)  //detects if mouse if over the PRINT button
{
  boolean toReturn = false;
  if(mouseX<= (rectCoorX + rectWidth) && mouseX >= rectCoorX){
    if(mouseY <= (rectCoorY + rectHeight) && mouseY>= rectCoorY){
      toReturn = true;
    }
  }
  return toReturn;
}

void drawButton()              // draws print button, and changes colour if OVER
{
  fill(currentColor);
  background(255);
  if(mouseOverSave(mouseX, mouseY)){
     currentColor = overColor;
  }else{
    currentColor = rectColor;
  }
  rect(rectCoorX,rectCoorY,rectWidth,rectHeight);
}

int[] saver = new int[3];
int globaleZaehler = 0;

void mouseClicked()
{
  
  if(mouseOverSave(mouseX, mouseY))
  {
     printsaved();                         //prints saved values
  }
}

void writeValue()
{
  int zwSpeicher = -1;
  
  
    zwSpeicher = mouseX;
    try
    {
      saver[globaleZaehler] = zwSpeicher;
      println(globaleZaehler + " = " + saver[globaleZaehler]);
      globaleZaehler++;      
    }
    catch(Exception ArrayIndexOutOfBounds)
    {
      for(int i = 0; i <= saver.length - 2 ; i ++)
      {
        saver[i] = saver[i+1];
      }
      saver[saver.length-1] = zwSpeicher;
    }
  
  println("data write");
}

void printsaved()                    // prints saved values
{
  println("p 0 = "+saver[0]);
  println("p 1 = "+saver[1]);
  println("p 2 = "+saver[2]);
}



