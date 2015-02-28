
int zoom = 3;
int gutter = 40;
int width = 70;
int height = 200;
int border = 1;
int hummock = 2;
int hollow = 3;

int dateCount;
int dateIndex;
String Descriptor[];
Setup fArray[];
int dateSelectorX;
int dateSelectorY = 400;
int minDateIndex;
int maxDateIndex = 20;
int counter = 0;
PFont font;
boolean go = false;

void setup()
{
  size(980, 640, P3D); 
  int a = 0;
  dateCount = 21;

  Descriptor = new String[dateCount];

  fArray = new Setup[dateCount];
  
  
//  text("Please wait whilst the data is retrieved.",450,320);
  for (int i = 0; i <= 20; i++)
  {
//      fArray[i] = new Setup("/home/AntMan/Documents/Msc/Project_ideas/memory_dist_t"+ a +".txt");
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
  
  dateIndex = 0;
  
  font = createFont("Georgia",10);
  textFont(font);
  rectMode(CORNER);
  frameRate(45);
  lights();
}


void draw()
{
  background(255);
  
  drawDateSelector(); 
  drawButton();
  noStroke();
  
  if (go)
  { 
      drawData(fArray[dateIndex]);
      if (dateIndex < maxDateIndex)
          dateIndex++;
      else go = false;
  }
  else drawData(fArray[dateIndex]);
  
}


void drawData(Setup ff)
{
  
  for (int i = 1; i < width ; i++)
  {
      for (int j = 0; j < height; j++)
      {
            //      The middle bit
            if (ff.getData(200-j,70-i) == hollow )
            {
                pushMatrix();
                translate((80+(i*10)), 540-j, 50-(j*6));
                fill(#000099);
                box(10,20,5);
                popMatrix();
            }

            if (ff.getData(200-j,70-i) == hummock)
            {     
                 pushMatrix();
                 translate((80+(i*10)), 540-j, 50-(j*6));
                 fill(#00CC00);
                 box(10,20,5);
                 popMatrix();
            } 
      }
  }
  
}

void  drawDateSelector()
{
    fill(0);
    dateSelectorX = (980 - dateCount) / 2;
    
    stroke(#33FF00);
    strokeWeight(1);
    
    for (int i = 0; i <= 20; i++)
    {
        int x = dateSelectorX + i*3;
        x = ((980/5)-(dateCount/5))+i*3;

        if (i == dateIndex)
        {
           stroke(0);
           stroke(#33FF00);
           
           line(x*2, 5, x*2, 20);
           textAlign(CENTER, TOP);

           text(Descriptor[dateIndex], x*2, 30);
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
           line(x*2, 15, x*2, 20); 
        }
    }  
}

void drawButton()
{
   noStroke();
   
   if (!go)
   {
       fill(220);
       ellipse(335, 25, 35, 35); 
       fill(0);
       triangle(330, 10, 330, 40, 350, 25);
   }
   else
   {
       fill(220);
       ellipse(335, 25, 35, 35); 
       fill(0);
       rect(330,12,4,25);
       rect(338,12,4,25);         
   }

}

void setDate(int index)
{
   dateIndex = index;
   loop();
}

void mousePressed()
{
   if ((mouseX >= 315 && mouseX <=345) && (mouseY >= 10 && mouseY <=42))
   {
         if (go)
           go = false;
         else go = true;
         
         if (dateIndex == maxDateIndex)
           dateIndex = 0;
//       dateIndex = 0;
//       go = true;
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

