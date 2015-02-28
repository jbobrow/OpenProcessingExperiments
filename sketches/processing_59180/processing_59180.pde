

String textEnteredTop ="";
String textEnteredBottom = "";
int textY = 460;
boolean numerator=true;
boolean correct=true;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Answer()
{
  stroke(0);
  strokeWeight(5);
  line (400, 475, 470, 475);
  fill(255);
  textSize(25);
  text (textEnteredTop, 400, 460);
  text (textEnteredBottom, 400, 500);

  if (numerator) line (470, 437, 470, 462); 
  else if (!numerator) line (470, 482, 470, 500);

  /*
  if (!correct)  
  {
    correct = true;
    LoseHealth += 20; 
  }*/
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void mouseClicked()
{
  if (mouseX>=370 && mouseX<=500 && mouseY>=430 && mouseY<=470) numerator = true;
  else if (mouseX>=370 && mouseX<=500 && mouseY>=477 && mouseY<=515) numerator = false;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void keyPressed()
{
  
  if (key == ' ')
   {
   if (numerator) numerator = false;
   else if (!numerator) numerator = true;
   }
   if (keyCode == UP) numerator = true;
   if (keyCode == DOWN) numerator = false;
   
  if (key == ENTER)
  { 
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if (Level == 1)
    {
      if (QuestionNumber == 1)
      {
        if (textEnteredTop.equals("6") && textEnteredBottom.equals("7"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 2)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("5"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 3)
      {
        if (textEnteredTop.equals("8") && textEnteredBottom.equals("9"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 4)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("6"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 5)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("4"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 6)
      {
        if (textEnteredTop.equals("9") && textEnteredBottom.equals("10"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 7)
      {
        if (textEnteredTop.equals("7") && textEnteredBottom.equals("9"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 8)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("8"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 9)
      {
        if (textEnteredTop.equals("8") && textEnteredBottom.equals("15"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 10)
      {
        if (textEnteredTop.equals("13") && textEnteredBottom.equals("14"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 11)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("15"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 12)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("18"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 13)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("5"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 14)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("8"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 15)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("4"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 16)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("14"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 17)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("12"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 18)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("2"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 19)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("6"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 20)
      {
        if (textEnteredTop.equals("4") && textEnteredBottom.equals("15"))  NewQuestion();
        else correct = false;
      }
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    else if (Level == 2)
    {
      if (QuestionNumber == 1)
      {
        if (textEnteredTop.equals("7") && textEnteredBottom.equals("36"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 2)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("14"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 3)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("18"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 4)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("16"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 5)
      {
        if (textEnteredTop.equals("22") && textEnteredBottom.equals("15"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 6)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("8"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 7)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("7"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 8)
      {
        if (textEnteredTop.equals("27") && textEnteredBottom.equals("16"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 9)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("12"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 10)
      {
        if (textEnteredTop.equals("20") && textEnteredBottom.equals("27"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 11)
      {
        if (textEnteredTop.equals("53") && textEnteredBottom.equals("60"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 12)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("12"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 13)
      {
        if (textEnteredTop.equals("17") && textEnteredBottom.equals("20"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 14)
      {
        if (textEnteredTop.equals("11") && textEnteredBottom.equals("18"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 15)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("6"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 16)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("3"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 17)
      {
        if (textEnteredTop.equals("11") && textEnteredBottom.equals("24"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 18)
      {
        if (textEnteredTop.equals("19") && textEnteredBottom.equals("45"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 19)
      {
        if (textEnteredTop.equals("11") && textEnteredBottom.equals("18"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 20)
      {
        if (textEnteredTop.equals("4") && textEnteredBottom.equals("3"))  NewQuestion();
        else correct = false;
      }
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    else if (Level == 3)
    {
      if (QuestionNumber == 1)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("28"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 2)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("28"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 3)
      {
        if (textEnteredTop.equals("9") && textEnteredBottom.equals("20"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 4)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("35"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 5)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("35"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 6)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("6"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 7)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("14"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 8)
      {
        if (textEnteredTop.equals("4") && textEnteredBottom.equals("9"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 9)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("5"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 10)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("4"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 11)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("15"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 12)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("10"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 13)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("5"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 14)
      {
        if (textEnteredTop.equals("8") && textEnteredBottom.equals("15"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 15)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("10"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 16)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("6"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 17)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("21"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 18)
      {
        if (textEnteredTop.equals("10") && textEnteredBottom.equals("21"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 19)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("6"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 20)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("14"))  NewQuestion();
        else correct = false;
      }
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    else if (Level == 4)
    {
      if (QuestionNumber == 1)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("2"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 2)
      {
        if (textEnteredTop.equals("4") && textEnteredBottom.equals("9"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 3)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("3"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 4)
      {
        if (textEnteredTop.equals("18") && textEnteredBottom.equals("7"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 5)
      {
        if (textEnteredTop.equals("16") && textEnteredBottom.equals("7"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 6)
      {
        if (textEnteredTop.equals("15") && textEnteredBottom.equals("7"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 7)
      {
        if (textEnteredTop.equals("4") && textEnteredBottom.equals("3"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 8)
      {
        if (textEnteredTop.equals("9") && textEnteredBottom.equals("10"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 9)
      {
        if (textEnteredTop.equals("8") && textEnteredBottom.equals("5"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 10)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("8"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 11)
      {
        if (textEnteredTop.equals("7") && textEnteredBottom.equals("8"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 12)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("3"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 13)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("3"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 14)
      {
        if (textEnteredTop.equals("20") && textEnteredBottom.equals("7"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 15)
      {
        if (textEnteredTop.equals("3") && textEnteredBottom.equals("2"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 16)
      {
        if (textEnteredTop.equals("4") && textEnteredBottom.equals("5"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 17)
      {
        if (textEnteredTop.equals("2") && textEnteredBottom.equals("5"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 18)
      {
        if (textEnteredTop.equals("5") && textEnteredBottom.equals("2"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 19)
      {
        if (textEnteredTop.equals("1") && textEnteredBottom.equals("2"))  NewQuestion();
        else correct = false;
      }
      if (QuestionNumber == 20)
      {
        if (textEnteredTop.equals("15") && textEnteredBottom.equals("16"))  NewQuestion();
        else correct = false;
      }
    }
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  else 
  {
    if (key == DELETE || key == BACKSPACE)
    {
      if (numerator)
      {
        int stringLength = textEnteredTop.length();
        if (stringLength > 0) textEnteredTop = textEnteredTop.substring(0, stringLength-1);
      }
      else if (!numerator)
      {
        int stringLength = textEnteredBottom.length();
        if (stringLength > 0) textEnteredBottom = textEnteredBottom.substring(0, stringLength-1);
      }
    }
    else if (key=='0' || key =='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9')
    {
      int stringLength1 = textEnteredTop.length();
      int stringLength2 = textEnteredBottom.length();
      if (numerator && stringLength1 < 4) textEnteredTop += key;
      else if (!numerator && stringLength2 < 4) textEnteredBottom += key;
    }
  }
}


