
PFont f;

ArrayList<StringList> words;

StringList local;

int fontsize = 18;
int maxlen = 15;
int minlen = 4;

void setup() 
{
  size(800, 600);
  background(0);


  // Create the font
  
  println(PFont.list());
  f = createFont("Georgia", fontsize);
  textFont(f);
  textAlign(CENTER, CENTER);
  
   words = new ArrayList<StringList>();  // Create an empty ArrayList
  
   int n = 0;
   while (n <= maxlen+1)
   {
      words.add(new StringList());  // Start by adding one element
      n++;
   }
   
   
    int len=0;
   String allwords[] = loadStrings("words1.txt");
  int i = 0;
   for(i = 0; i< allwords.length; i++)
   {
     
     len = allwords[i].length();
     if(len < maxlen)
     {
       words.get(len).append(allwords[i]);
     
     /*  
       if(len > 17)
       {
         print(allwords[i]);
         print(" ");
        println(len);
        
       }
        */
        
     }
     
   }
  
} 

////////////////////////////////////////////////

void draw() 
{
  background(0);

  // Set the left and top margin
  int margin = 2;
  translate(margin*4, margin*4);

  int gap = (int(fontsize * 1.1));
int ascii = 0;
int cols = 0;
int rows=0;
  
  for (int y = 0; y < height-gap; y += gap) 
  {
    cols=0;
    for (int x = 0; x < ((width-gap) - 200); x += gap) 
    {
       cols++;
    }
    rows++;
  }
  
    fill(255);

   String rc = rows + " x " + cols;
    text(rc, ((width-gap) - 140), ((height-gap) - (height - 20)));
    
   
  
  int r= 0;
  int c =0;
  
  char[][] page = new char[cols][rows];
  
  for (int y = 0; y < height-gap; y += gap) 
  {
    c = 0;
    for (int x = 0; x < ((width-gap) - 200); x += gap) 
    {
      
      ascii = int(random(97,122));
      
      char letter = char(ascii);
      
      if (letter == 'a' || letter == 'e' || letter == 'i' || letter == 'o' || letter == 'u') {
        fill(255, 204, 0);
      } 
      else {
        fill(255);
      }

      // Draw the letter to the screen
      text(letter, x, y);
      page[c][r] = letter;

       c++;
    }
    r++;
  }
  /////////////////////////////////////////
  ///start hieght of found words
  int cur =50;
  local = new StringList();
   for (int y = 0; y < cols; y++) 
   {
      for (int x = 0; x < rows; x++) 
      {
         
       ///////////////////////////////search horizontal 
        int x1;
          int y1;
          int homex = x1 = x;
          int homey = y1 = y;
          x1++;
          
          String s =  page[homex][homey] + "";

          int n =  x1 - homex;
        while( x1 < cols &&  n < maxlen)
        {
          s = s + page[x1][y1];
          int len = (x1 - homex)+1; 
          if(len > minlen)
          {
           int wordx = int(((homex*gap)+margin + ((x1*gap)+margin)) / 2);
           int wordy = (homey*gap)+margin;
            
            if(words.get(len).hasValue(s))
            {
               print("V - ");
              println(s);
              noFill();
              stroke(204, 102, 0);
                strokeWeight(3);
              ellipse(wordx, wordy, (len*gap), fontsize);
              fill(255);
               text(s, ((width-gap) - 140), ((height-gap) - (height - cur)));
                cur+=fontsize;
            }
          }
          x1++;
           n = x1 - homex;
        }  
        
        
        
        //////////////////////search vertical
           homex = x1 = x;
           homey = y1 = y;
          y1++;
          
           s =  page[homex][homey] + "";

          n =  y1 - homey;
        while( y1 < rows &&  n < maxlen)
        {
          s = s + page[x1][y1];
          int len = (y1 - homey)+1; 
          if(len > minlen)
          {
            
             int wordx = (homex*gap)-margin;
           int wordy = int(((homey*gap)+margin + ((y1*gap)+margin)) / 2);
           
            if(words.get(len).hasValue(s))
            {
              print("H - ");
              println(s);
               noFill();
              stroke(204, 102, 0);
                strokeWeight(3);
              ellipse(wordx, wordy,fontsize,(len*gap));
              fill(255);
               text(s, ((width-gap) - 140), ((height-gap) - (height - cur)));
              cur+=fontsize;
            }
          }
          y1++;
           n =y1 - homey;
        }  
        
    
         
    
        
          //local page[x][y];
      }
  }   
      
      
  ////////////////////////////////////////
  
  
}
