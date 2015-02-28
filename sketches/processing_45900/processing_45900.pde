
//Kim Ash
//Takes Shakespeare's Sonnet XIV and displays quatrains and rhymes, and scrolls through lines.

String[] sonnet;
PFont font;

void setup()
{
  size(700, 700);
  sonnet = loadStrings("sonnetXIV.txt");
  
  font = loadFont("Cochin-30.vlw");
  textFont(font);
  textAlign(LEFT);
}

void draw()
{
  background(0);
  fill(255);
  
  for(int i = 0; i < 14; i++)
  {
    if (keyPressed)
    {
      if (key == 'Q'|| key == 'q')  //displays the quatrains
       {
        if (i < 4)
        {
          fill(255, 0, 0);
          text(sonnet[i], 50, 40*(i+2));
        }
         
         else if (i < 8 && i >= 4)
         {
           fill(255, 255, 0);
           text(sonnet[i], 50, 40*(i+2));
         }
         
         else if (i < 12 && i >= 8)
         {
           fill(0, 255, 0);
           text(sonnet[i], 50, 40*(i+2));
         }
         
         else
         {
           fill(0, 255, 255);
           text(sonnet[i], 50, 40*(i+2));
         }
       }
       
       if (key == 'R'|| key == 'r')  //displays the rhymes
       {
         String line_i = sonnet[i];
         
         String rhyme = lastWord(line_i);
         String rhymeCaps = rhyme.toUpperCase();
         
         String first = line_i.substring(0, line_i.lastIndexOf(" ")+1);
         
         if (i==0 || i==2)
         {
           fill(255, 0, 0);
         }
         
         else if (i==1 || i==3)
         {
           fill(255, 135, 5);
         }
         
         else if (i==4 || i==6)
         {
           fill(255, 255, 0);
         }
         
         else if (i==5 || i==7)
         {
           fill(0, 255, 0);
         }
         
         else if (i==8 || i==10)
         {
           fill(0, 255, 255);
         }
         
         else if (i==9 || i==11)
         {
           fill(0, 0, 255);
         }
         
         else
         {
            fill(255, 0, 255); 
         }
         
         text(first + rhymeCaps, 50, 40*(i+2)); 
       }
     
    }
    
    else if (mouseY <= 40*(i+2) && mouseY >= (40*(i+2))-20)
    { 
       String verse = sonnet[i];
       text(verse, 50, 40*(i+2));
       break;
    }
    
    else
    {
      text(sonnet[i], 50, 40*(i+2));
    }
  }
  
}

String lastWord(String last)  //picks out the last word of each line
{
  last = last.substring(last.lastIndexOf(" ")+1, last.length());
  return last;
}



