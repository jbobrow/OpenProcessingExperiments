
int zoom = 3;
int gutter = 40;
int the_width = 70;
int the_height = 200;
int border = 1;
int hummock = 2;
int hollow = 3;

int dateCount;
int dateIndex;
String Descriptor[];
Setup fArray[];
int dateSelectorX;
int dateSelectorY = 30;
int minDateIndex;
int maxDateIndex = 20;
PFont font;

boolean go = false;


void setup()
{
   size(210,640);
   int a = 0;
   dateCount = 21;

   Descriptor = new String[dateCount];
   
   fArray = new Setup[dateCount];

   for (int i = 0; i <= 20; i++)
   {
      //println("Referencing /Users/anthonysmee/Sites/AMP/bikefacts/Processing/2d/data/memory_dist_t"+ a +".txt");
      //fArray[i] = new Setup("/home/AntMan/Documents/Msc/Project_ideas/memory_dist_t"+ a +".txt");
      //fArray[i] = new Setup("/Users/anthonysmee/Sites/AMP/bikefacts/Processing/Shapes/shapes/data/memory_dist_t"+a+".txt");
//      fArray[i] = new Setup("http://localhost/bikefacts/Processing/2d/data/memory_dist_t"+a+".txt");
      fArray[i] = new Setup("http://www.bikefacts.co.uk/Processing/data/memory_dist_t"+a+".txt");      
      a = a + 5;
   }
   
   a = 0;
   
   for (int i = 0; i <= 20; i++)
   {
       Descriptor[i] = "t " + a;
       a = a + 5; 
   }
  
   colorMode(HSB,255);
   frameRate(45);
   background(0); 
   
   font = createFont("Georgia", 10);
   textFont(font);
}

void draw()
{
   background(0);

   drawDateSelector(); 
   drawButton();
   //drawData(fArray[dateIndex]);
  
   if (go)
   {    
      drawData(fArray[dateIndex]);
      if (dateIndex < maxDateIndex)
         dateIndex++;
      else go = false;
   }
   else
   {
     drawData(fArray[dateIndex]);
     
     //if (dateIndex == maxDateIndex)
     //    dateIndex = 0;
   }
  
}

void drawData(Setup ff)
{  
     for (int i = 0; i < the_width; i++)
     {
         for(int j = 0; j < the_height; j++)
         {
             if (ff.getData(j,i) == hollow )
             {
                 fill(#00FF00);                      // GREEN !!!!
                 rect((i*zoom), (j*zoom)+gutter, zoom, zoom);
             }
   
             if (ff.getData(j,i) == hummock)
             {
                 fill(#0033FF);                      // BLUE !!!!
                 rect((i * zoom),(j * zoom)+gutter, zoom, zoom);
             }
   
             if (ff.getData(j,i) == border)
             {
                 fill(#000000);                      // BLACK !!!!
                 rect((i*zoom),(j*zoom)+gutter,zoom,zoom);
             } 
         }
     }
}


void  drawDateSelector()
{
    fill(0);
    dateSelectorX = (the_width - dateCount) / 2;
    
    stroke(#33FF00);
    strokeWeight(1);
    fill(0, 102, 153);
  
    for (int i = 0; i <= 20; i++)
    {
        int x = dateSelectorX + i*3;
        if (i == dateIndex)
        {
           stroke(0);
           stroke(#33FF00);
  
           line(x*2, 15, x*2, 3);
           textAlign(CENTER, TOP);
           text(Descriptor[dateIndex], x*2, 20);
        }
        else
        {
           if ((i >= minDateIndex) && (i <= maxDateIndex))
           {
              stroke(128);
           }
           else
           {
              stroke(204);
           }
           line(x*2, 15, x*2, 7); 
        }
    }  
}

void drawButton()
{
   noStroke();
   
   if (!go)
   {
     fill(204);
     ellipse(20, 20, 30, 30); 
     fill(0);
     triangle(18, 10, 18, 30, 30, 20);
   }
   else
   {
     fill(204);
     ellipse(20, 20, 30, 30); 
     fill(0);
     rect(14,10,4,20);
     rect(22,10,4,20);
   }   
}

void setDate(int index)
{
   dateIndex = index;
   loop();
}

void mousePressed()
{
   if (mouseX >= 10 && mouseX <=30)
   {
       if (go)
         go = false;
       else go = true;
       
       if (dateIndex == maxDateIndex)
         dateIndex = 0;
      
   }     
}

void keyPressed()
{
   if (key == CODED)
   {
      if (keyCode == LEFT)
      {
         int newDate = max(dateIndex - 1, minDateIndex);
         setDate(newDate); 
      }
      else if (keyCode == RIGHT)
      {
          int newDate = min(dateIndex + 1, maxDateIndex);
          setDate(newDate); 
      }
   } 
}

