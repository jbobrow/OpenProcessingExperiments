
String TopText ="";
String BottomText ="";
int textY = 460;
boolean numerator = true;
boolean correct = true;
int QuestNum = 1;

void Answer()
{
  fill(0);
  stroke(5);
  fill(200);
  rect(-1,562, 500, 500);
  stroke(0);
  strokeWeight(5);
  line (322, 640, 398, 640);
  fill(0);
  textSize(25);
  text (TopText, 320, 633);
  text (BottomText, 320 , 667);

  if (numerator) line (398, 607, 398, 634); 
  else if (!numerator) line (398, 647, 398, 671);
  
  if(!correct) correct = true;
  println("X: " + mouseX + "," + "Y: " + mouseY);

}

 void mouseClicked()
{
  //if (mouseX>=317 && mouseX<=403 && mouseY>=580 && mouseY<=640) numerator = true;
  //else if (mouseX>=317 && mouseX<=403 && mouseY>=643 && mouseY<=690) numerator = false;
}

void keyTyped()
{
  if (key == ENTER)
  {
    if(ScreenNum == 3)
    {
      if(QuestNum == 1)
      {
        if(TopText.equals("3") && BottomText.equals("3")) {
          NewQuestion();
          Speed += 2;
          Score += 1;
        }
        else {
          NewQuestion();
          Speed -= 0.5;
       }
      }
       if(QuestNum == 2) {
       if(TopText.equals("5") && BottomText.equals("6")) {
         NewQuestion();
         Speed += 2;
         Score += 1;
       }
       else {
         NewQuestion();
         Speed -= 0.5;
       }
       }
       if(QuestNum == 3) {
         if(TopText.equals("6") && BottomText.equals("7")) {
           NewQuestion();
           Speed += 2;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 4) {
         if(TopText.equals("1") && BottomText.equals("6")) {
           NewQuestion();
           Speed += 2;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
       }
       }
       if(QuestNum == 5) {
         if(TopText.equals("0") && BottomText.equals("0")) {
           NewQuestion();
          Speed += 2;
          Score += 1;       
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 6) {
         if(TopText.equals("2") && BottomText.equals("2")) {
           NewQuestion();
          Speed += 2;
          Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 7) {
         if(TopText.equals("4") && BottomText.equals("7")) {
           NewQuestion();
          Speed += 2;
          Score += 1;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 8) {
         if(TopText.equals("4") && BottomText.equals("4")) {
           NewQuestion();
          Speed += 2;
          Score += 1;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 9) {
         if(TopText.equals("4") && BottomText.equals("9")) {
           NewQuestion();
          Speed += 2; 
          Score += 2;    
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
      }
      if(ScreenNum == 4)
      {
        if(QuestNum == 1)
      {
        if(TopText.equals("3") && BottomText.equals("3")) {
          NewQuestion();
          Speed += 2;
          Score += 2;
        }
        else {
          NewQuestion();
          Speed -= 0.5;
       }
      }
       if(QuestNum == 2) {
       if(TopText.equals("5") && BottomText.equals("6")) {
         NewQuestion();
         Speed += 2;
         Score += 2;
       }
       else {
         NewQuestion();
         Speed -= 0.5;
       }
       }
       if(QuestNum == 3) {
         if(TopText.equals("6") && BottomText.equals("7")) {
           NewQuestion();
           Speed += 2;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 4) {
         if(TopText.equals("1") && BottomText.equals("6")) {
           NewQuestion();
           Speed += 2;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 5) {
         if(TopText.equals("0") && BottomText.equals("0")) {
           NewQuestion();
           Speed += 2;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
         if(QuestNum == 6) {
           if(TopText.equals("2") && BottomText.equals("9")) {
             NewQuestion();
             Speed += 3;
             Score += 10;
           }
           else{
             NewQuestion();
             Speed -= 0.5;
           }
         }
         if(QuestNum == 7) {
           if(TopText.equals("8") && BottomText.equals("9")) {
             NewQuestion();
             Speed += 3;
             Score += 10;
           }
           else {
             NewQuestion();
             Speed -= 0.5;
           }
         }
         if(QuestNum == 8) {
           if(TopText.equals("4") && BottomText.equals("8")) {
             NewQuestion();
             Speed += 3;
             Score += 10;
           }
           else {
             NewQuestion();
             Speed -= 0.5;
           }
         }
         if(QuestNum == 9) {
           if(TopText.equals("3") && BottomText.equals("16")) {
             NewQuestion();
             Speed += 3;
             Score += 10;
           }
           else{
             NewQuestion();
             Speed -= 0.5;
           }
         }
      }
        if(ScreenNum == 5) {
          if(QuestNum == 1)
      {
        if(TopText.equals("7") && BottomText.equals("10")) {
          NewQuestion();
          Speed += 3;
          Score += 2;
        }
        else {
          NewQuestion();
          Speed -= 0.5;
       }
      }
       if(QuestNum == 2) {
       if(TopText.equals("7") && BottomText.equals("8")) {
         NewQuestion();
         Speed += 3;
         Score += 2;
       }
       else {
         NewQuestion();
         Speed -= 0.5;
       }
       }
       if(QuestNum == 3) {
         if(TopText.equals("6") && BottomText.equals("7")) {
           NewQuestion();
           Speed += 3;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 4) {
         if(TopText.equals("1") && BottomText.equals("6")) {
           NewQuestion();
           Speed += 3;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 5) {
         if(TopText.equals("2") && BottomText.equals("9")) {
           NewQuestion();
           Speed += 3;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
         if(QuestNum == 6) {
           if(TopText.equals("2") && BottomText.equals("9")) {
             NewQuestion();
             Speed += 3;
             Score += 5;
           }
           else{
             NewQuestion();
             Speed -= 0.5;
           }
         }
         if(QuestNum == 7) {
           if(TopText.equals("8") && BottomText.equals("9")) {
             NewQuestion();
             Speed += 3;
             Score += 5;
           }
           else {
             NewQuestion();
             Speed -= 0.5;
           }
         }
         if(QuestNum == 8) {
           if(TopText.equals("4") && BottomText.equals("8")) {
             NewQuestion();
             Speed += 3;
             Score += 5;
           }
           else {
             NewQuestion();
             Speed -= 0.5;
           }
         }
         if(QuestNum == 9) {
           if(TopText.equals("3") && BottomText.equals("16")) {
             NewQuestion();
             Speed += 3;
             Score += 5;
           }
           else{
             NewQuestion();
             Speed -= 0.5;
           }
         }
        }
         if(ScreenNum == 6)
         {
           if(QuestNum == 1)
      {
        if(TopText.equals("5") && BottomText.equals("9")) {
          NewQuestion();
          Speed += 4;
          Score += 2;
        }
        else {
          NewQuestion();
          Speed -= 0.5;
       }
      }
       if(QuestNum == 2) {
       if(TopText.equals("5") && BottomText.equals("6")) {
         NewQuestion();
         Speed += 4;
         Score += 2;
       }
       else {
         NewQuestion();
         Speed -= 0.5;
       }
       }
       if(QuestNum == 3) {
         if(TopText.equals("10") && BottomText.equals("49")) {
           NewQuestion();
           Speed += 4;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 4) {
         if(TopText.equals("1") && BottomText.equals("6")) {
           NewQuestion();
           Speed += 4;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
       if(QuestNum == 5) {
         if(TopText.equals("0") && BottomText.equals("0")) {
           NewQuestion();
           Speed += 4;
           Score += 2;
         }
         else {
           NewQuestion();
           Speed -= 0.5;
         }
       }
         if(QuestNum == 6) {
           if(TopText.equals("2") && BottomText.equals("9")) {
             NewQuestion();
             Speed += 4;
             Score += 10;
           }
           else{
             NewQuestion();
             Speed -= 0.5;
           }
         }
         if(QuestNum == 7) {
           if(TopText.equals("8") && BottomText.equals("9")) {
             NewQuestion();
             Speed += 4;
             Score += 10;
           }
           else {
             NewQuestion();
             Speed -= 0.5;
           }
         }
         if(QuestNum == 8) {
           if(TopText.equals("4") && BottomText.equals("8")) {
             NewQuestion();
             Speed += 4;
             Score += 10;
           }
           else {
             NewQuestion();
             Speed -= 0.5;
           }
         }
         if(QuestNum == 9) {
           if(TopText.equals("3") && BottomText.equals("16")) {
             NewQuestion();
             Speed += 4;
             Score += 10;
           }
           else{
             NewQuestion();
             Speed -= 0.5;
           }
         }
        }
           
      }
    
  
   if(key == DELETE || key == BACKSPACE)
  {
    if (numerator)
    {
      int stringLength = TopText.length();
      if(stringLength > 0) TopText = TopText.substring(0, stringLength-1);
    }
     else if(!numerator)
     {
       int stringLength = BottomText.length();
       if(stringLength > 0) BottomText = BottomText.substring(0, stringLength-1);
     }
  }
    else if(key=='0' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9')
    {
      if (numerator) TopText += key;
      else if (!numerator) BottomText += key;
    }
}

void Question()
{
  if(ScreenNum == 3)
  {
    if(QuestNum == 1)
    {
      textSize(30);
      fill(0);
      text("2   1", 54, 644);
      text("3   3", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
    }
    if(QuestNum == 2)
    {
       textSize(30);
      fill(0);
      text("4   1", 54, 644);
      text("6   6", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
  }
  if(QuestNum == 3)
  {
      textSize(30);
      fill(0);
      text("5   1", 54, 644);
      text("7   7", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
    
}
if(QuestNum == 4) 
{
    textSize(30);
      fill(0);
      text("2   1", 54, 644);
      text("6   6", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("-", 75, 660);
}
if(QuestNum == 5)
{
    textSize(30);
      fill(0);
      text("3   3", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("-", 75, 660);
  }
  if(QuestNum == 6)
  {
    textSize(30);
      fill(0);
      text("2   0", 54, 644);
      text("2   0", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
  }
  if(QuestNum == 7)
  {
    textSize(30);
      fill(0);
      text("6   2", 54, 644);
      text("7   7", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("-", 75, 660);
  }
  if(QuestNum == 8)
  {
    textSize(30);
      fill(0);
      text("1   3", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
  }
  if(QuestNum == 9)
  {
    textSize(30);
      fill(0);
      text("2   2", 54, 644);
      text("9   9", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
  }
 }
 if(ScreenNum == 4) 
 {
    if(QuestNum == 1)
    {
      textSize(30);
      fill(0);
      text("2   1", 54, 644);
      text("3   3", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
    }
    if(QuestNum == 2)
    {
       textSize(30);
      fill(0);
      text("4   1", 54, 644);
      text("6   6", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
  }
  if(QuestNum == 3)
  {
      textSize(30);
      fill(0);
      text("5   1", 54, 644);
      text("7   7", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
    
}
if(QuestNum == 4) 
{
    textSize(30);
      fill(0);
      text("2   1", 54, 644);
      text("6   6", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("-", 75, 660);
}
if(QuestNum == 5)
{
    textSize(30);
      fill(0);
      text("3   3", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("-", 75, 660);
  }
  if(QuestNum == 6)
  {
      textSize(30);
      fill(206,83,192);
      text("2   1", 54, 644);
      text("3   3", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("x", 75, 660);
  }
  if(QuestNum == 7)
  {
       textSize(30);
      fill(206,83,192);
      text("2   3", 54, 644);
      text("3   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("/", 75, 660);
 }
 if(QuestNum == 8) {
      textSize(30);
      fill(206,83,192);
      text("1   2", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("/", 75, 660);
 }
 if(QuestNum == 9) {
      textSize(30);
      fill(206,83,192);
      text("1   3", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("x", 75, 660);
 }
 }
 if(ScreenNum == 5)
 {
   if(QuestNum == 1)
    {
      textSize(30);
      fill(255,0,0);
      text("3   2", 54, 644);
      text("10 5", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
    }
    if(QuestNum == 2)
    {
       textSize(30);
      fill(255,0,0);
      text("3   1", 54, 644);
      text("8   2", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
  }
  if(QuestNum == 3)
  {
      textSize(30);
      fill(0);
      text("5   1", 54, 644);
      text("7   7", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
    
}
if(QuestNum == 4) 
{
    textSize(30);
      fill(0);
      text("2   1", 54, 644);
      text("6   6", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("-", 75, 660);
}
if(QuestNum == 5)
{
    textSize(30);
      fill(255,0,0);
      text("8   2", 54, 644);
      text("9   3", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("-", 75, 660);
  }
  if(QuestNum == 6)
  {
      textSize(30);
      fill(206,83,192);
      text("2   1", 54, 644);
      text("3   3", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("x", 75, 660);
  }
  if(QuestNum == 7)
  {
       textSize(30);
      fill(206,83,192);
      text("2   3", 54, 644);
      text("3   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("/", 75, 660);
 }
 if(QuestNum == 8) {
      textSize(30);
      fill(206,83,192);
      text("1   2", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("/", 75, 660);
 }
 if(QuestNum == 9) {
      textSize(30);
      fill(206,83,192);
      text("1   3", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("x", 75, 660);
 } 
 }
 if(ScreenNum == 6)
 {
    if(QuestNum == 1)
    {
      textSize(30);
      fill(206,83,192);
      text("5   1", 54, 644);
      text("3   3", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("x", 75, 660);
    }
    if(QuestNum == 2)
    {
       textSize(30);
      fill(0);
      text("4   1", 54, 644);
      text("6   6", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("+", 75, 660);
  }
  if(QuestNum == 3)
  {
      textSize(30);
      fill(206,83,192);
      text("5   2", 54, 644);
      text("7   7", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("x", 75, 660);
    
}
if(QuestNum == 4) 
{
    textSize(30);
      fill(0);
      text("2   1", 54, 644);
      text("6   6", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("-", 75, 660);
}
if(QuestNum == 5)
{
    textSize(30);
      fill(0);
      text("3   3", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("-", 75, 660);
  }
  if(QuestNum == 6)
  {
      textSize(30);
      fill(206,83,192);
      text("2   1", 54, 644);
      text("3   3", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("x", 75, 660);
  }
  if(QuestNum == 7)
  {
       textSize(30);
      fill(206,83,192);
      text("2   3", 54, 644);
      text("3   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("/", 75, 660);
 }
 if(QuestNum == 8) {
      textSize(30);
      fill(206,83,192);
      text("1   2", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("/", 75, 660);
 }
 if(QuestNum == 9) {
      textSize(30);
      fill(206,83,192);
      text("1   3", 54, 644);
      text("4   4", 54, 680);
      textSize(50);
      text("_ ", 50, 650);
      text("_", 101, 650);
      textSize(30);
      text("x", 75, 660);
 }   
 }
   
}
void NewQuestion()
{
  correct = true;
  QuestNum = (int) random(1,9);
  TopText="";
  BottomText="";
  numerator=true;
}

