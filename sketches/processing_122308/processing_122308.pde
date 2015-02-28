
char letter;
String words = "";
float resultat;
boolean finish=false;
int fase=1;
int pes;

void setup() 
{
  size(640, 360);
  // Create the font
  textFont(createFont("Verdana", 36));
}

void draw() 
{
  if (fase==1)
  {
    background(0); // Set background to black
    // Draw the letter to the center of the screen
    textSize(14);
    text("Quan peses? " + words, 50, 90);
  
  }
  else if (fase==2)
  {
    background(0);
    textSize(14);
    text("Peses " + pes + " kg", 50, 90);
    text("Quant medeixes?"+ words, 50, 140);
  }
}

void keyPressed() 
{
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if (((key >= '0')&& (key <= '9'))||(key=='.'))  
  {
    letter = key; 
    words = words + key;
    // Write the letter to the console
    println(key);
  }
  if (keyCode==BACKSPACE)
  {
     String nova="";
     for (int i=0; i<words.length()-1; i=i+1)
     {
       nova=nova+words.charAt(i);
     } 
     words=nova;
  }
  if (keyCode==ENTER)
  {
    if (fase==1)
    {
      pes=int(words);
      words="";
      fase=2;
    }
    else if (fase==2)
    {
     
      fase=3;
    }
    else if (fase==3)
    {
      fase=4;
    }
  }
}


