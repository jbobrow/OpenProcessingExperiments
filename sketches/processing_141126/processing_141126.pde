
PFont f;  
Rectangles r1;
Rectangles r2;
Rectangles r3;
Rectangles r4;
Rectangles r5;
Rectangles r6;
Rectangles r7;
Rectangles r8;
Rectangles r9;
Rectangles r10;
Rectangles r11;
Rectangles r12;
Rectangles r13;
Rectangles r14;
Rectangles r15;
Rectangles r16;
ArrayList<Rectangles> boards;

void setup() {  //setup function called initially, only once
  size(501, 501);
  background(255);  //set background white
  //creates each rectangle on the board setting the color to white
  r1 = new Rectangles(0,0, color(255,255,255),0);
  r5 = new Rectangles(0,125,color(255,255,255),4);
  r9 = new Rectangles(0,250,color(255,255,255),8);
  r13 = new Rectangles(0,375,color(255,255,255),12);
  r2 = new Rectangles(125,0,color(255,255,255),1);
  r3 = new Rectangles(250,0,color(255,255,255),2);
  r4 = new Rectangles(375,0,color(255,255,255),3);
  r6 = new Rectangles(125,125,color(255,255,255),5);
  r7 = new Rectangles(250,125,color(255,255,255),6);
  r8 = new Rectangles(375,125,color(255,255,255),7);
  r10 = new Rectangles(125,250,color(255,255,255),9);
  r11= new Rectangles(250,250,color(255,255,255),10);
  r12 = new Rectangles(375,250,color(255,255,255),11);
  r14 = new Rectangles(125,375,color(255,255,255),13);
  r15 = new Rectangles(250,375,color(255,255,255),14);
  r16 = new Rectangles(375,375,color(255,255,255),15);
  f = createFont("Arial",50,true);
  boards = new ArrayList<Rectangles>();
  //adds all rectangles to an array list that will represent the board
  boards.add(r1);
  boards.add(r2);
  boards.add(r3);
  boards.add(r4);
  boards.add(r5);
  boards.add(r6);
  boards.add(r7);
  boards.add(r8);
  boards.add(r9);
  boards.add(r10);
  boards.add(r11);
  boards.add(r12);
  boards.add(r13);
  boards.add(r14);
  boards.add(r15);
  boards.add(r16);
  for(int i = 0; i<16; i++)
  {
      boards.get(i).display();
      fill(color(100,0,0));    
  }
  //adds two random squares
  random();
  random();
}

void draw() 
{
  fill(0);
  textFont(f,35); 
}

 void keyPressed()
  {
      if(keyCode==LEFT)
      {
      if(boards.get(0).getColor()!=color(255,255,255) || boards.get(1).getColor()!=color(255,255,255) ||
      boards.get(2).getColor()!=color(255,255,255) || boards.get(3).getColor()!=color(255,255,255))
      {
        for(int i = 0; i<4; i++)
        {
          int j = i-1;
          while((j)>=0 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapLeft(boards.get(j));
            j--;
          }
          if(j>=0 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }

          //boards.get(i).moveLeft();
          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
          
        }
      }
      if(boards.get(4).getColor()!=color(255,255,255) || boards.get(5).getColor()!=color(255,255,255) ||
      boards.get(7).getColor()!=color(255,255,255) || boards.get(6).getColor()!=color(255,255,255))
      {
        for(int i = 4; i<8; i++)
        {
          int j = i-1;
          while((j)>=4 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapLeft(boards.get(j));
            j--;
          }
          if(j>=4 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }

          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      if(boards.get(8).getColor()!=color(255,255,255) || boards.get(9).getColor()!=color(255,255,255) ||
      boards.get(10).getColor()!=color(255,255,255) || boards.get(11).getColor()!=color(255,255,255))
      {
        for(int i = 8; i<12; i++)
        {
           int j = i-1;
          while((j)>=8 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapLeft(boards.get(j));
            j--;
          }
          if(j>=8 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }

          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      if(boards.get(15).getColor()!=color(255,255,255) || boards.get(14).getColor()!=color(255,255,255) ||
      boards.get(12).getColor()!=color(255,255,255) || boards.get(13).getColor()!=color(255,255,255))
      {
        for(int i = 12; i<16; i++)
        {
           int j = i-1;
          while((j)>=12 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapLeft(boards.get(j));
            j--;
          }
          if(j>=12 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }

          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      for(int i = 0; i<16; i++)
      {
        boards.get(i).not();
        if(boards.get(i).getColor()!=color(255,255,255))
        {
          text(boards.get(i).getNum(), boards.get(i).getX1() + 50, boards.get(i).getY1() + 50);
        }
      }
      
      resetNames();
      
      }

      if(keyCode==DOWN)
      {
      if(boards.get(0).getColor()!=color(255,255,255) || boards.get(12).getColor()!=color(255,255,255) ||
      boards.get(4).getColor()!=color(255,255,255) || boards.get(8).getColor()!=color(255,255,255))
      {
        for(int i = 12; i>=0; i-=4)
        {
          int j = i+4;
          while((j)<16&& boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapDown(boards.get(j));
            j+=4;
          }
          if(j<16 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }
          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      if(boards.get(1).getColor()!=color(255,255,255) || boards.get(5).getColor()!=color(255,255,255) ||
      boards.get(9).getColor()!=color(255,255,255) || boards.get(13).getColor()!=color(255,255,255))
      {
        for(int i = 13; i>=0; i-=4)
        {
           int j = i+4;
          while((j)<=15&& boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapDown(boards.get(j));
            j+=4;
          }
          if(j<16 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }
          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      if(boards.get(10).getColor()!=color(255,255,255) || boards.get(14).getColor()!=color(255,255,255) ||
      boards.get(2).getColor()!=color(255,255,255) || boards.get(6).getColor()!=color(255,255,255))
      {
        for(int i = 14; i>=0; i-=4)
        {
           int j = i+4;
          while((j)<16&& boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapDown(boards.get(j));
            j+=4;
          }
          if(j<16 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }

          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      if(boards.get(15).getColor()!=color(255,255,255) || boards.get(11).getColor()!=color(255,255,255) ||
      boards.get(7).getColor()!=color(255,255,255) || boards.get(3).getColor()!=color(255,255,255))
      {
        for(int i = 11; i>=0; i-=4)
        {
          int j = i+4;
          while((j)<16&& boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapDown(boards.get(j));
            j+=4;
          }
          if(j<16 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }

          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      resetNames();
      for(int i = 0; i<16; i++)
      {
        boards.get(i).not();
        if(boards.get(i).getColor()!=color(255,255,255))
        {
          text(boards.get(i).getNum(), boards.get(i).getX1() + 50, boards.get(i).getY1() + 50);
        }
      }
      
      }
      if(keyCode==RIGHT)
      {
             if(boards.get(0).getColor()!=color(255,255,255) || boards.get(1).getColor()!=color(255,255,255) ||
      boards.get(2).getColor()!=color(255,255,255) || boards.get(3).getColor()!=color(255,255,255))
      {
        for(int i = 3; i>=0; i--)
        {
          int j = i+1;
          while((j)<=3 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapRight(boards.get(j));
            j++;
          }
          if(j<=3 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }
          //boards.get(i).moveLeft();
          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      if(boards.get(4).getColor()!=color(255,255,255) || boards.get(5).getColor()!=color(255,255,255) ||
      boards.get(7).getColor()!=color(255,255,255) || boards.get(6).getColor()!=color(255,255,255))
      {
        for(int i = 7; i>=4; i--)
        {
          int j = i+1;
          while((j)<=7 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapRight(boards.get(j));
            j++;
          }
          if(j<8 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }
          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      if(boards.get(8).getColor()!=color(255,255,255) || boards.get(9).getColor()!=color(255,255,255) ||
      boards.get(10).getColor()!=color(255,255,255) || boards.get(11).getColor()!=color(255,255,255))
      {
        for(int i = 11; i>=8; i--)
        {
           int j = i+1;
          while((j)<=11 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapRight(boards.get(j));
            j++;
          }
          if(j<12 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }
          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      if(boards.get(15).getColor()!=color(255,255,255) || boards.get(14).getColor()!=color(255,255,255) ||
      boards.get(12).getColor()!=color(255,255,255) || boards.get(13).getColor()!=color(255,255,255))
      {
        for(int i = 15; i>=12; i--)
        {
           int j = i+1;
          while((j)<=15 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            boards.get(i).swapRight(boards.get(j));
            j++;
          }
          if(j<16 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }
          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      for(int i = 0; i<16; i++)
      {
        boards.get(i).not();
        if(boards.get(i).getColor()!=color(255,255,255))
        {
          text(boards.get(i).getNum(), boards.get(i).getX1() + 50, boards.get(i).getY1() + 50);
        }
      }
      resetNames();
      
      }
      if(keyCode==UP)
      {
     if(boards.get(0).getColor()!=color(255,255,255) || boards.get(12).getColor()!=color(255,255,255) ||
      boards.get(4).getColor()!=color(255,255,255) || boards.get(8).getColor()!=color(255,255,255))
      {
        for(int i = 0; i<=12; i+=4)
        {
          int j = i-4;
          boolean x = false;
          while((j)>=0 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            x = true;
            boards.get(i).swapUp(boards.get(j));
            j-=4;
          }
          if(j>=0 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }

          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
      if(boards.get(1).getColor()!=color(255,255,255) || boards.get(5).getColor()!=color(255,255,255) ||
      boards.get(9).getColor()!=color(255,255,255) || boards.get(13).getColor()!=color(255,255,255))
      {
        for(int i = 1; i<=13; i+=4)
        {
          int j = i-4;
          boolean x = false;
          while((j)>=0 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            x = true;
            boards.get(i).swapUp(boards.get(j));
            j-=4;
          }
          if(j>=0 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }


          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
        }
      }
       if(boards.get(2).getColor()!=color(255,255,255) || boards.get(6).getColor()!=color(255,255,255) ||
      boards.get(10).getColor()!=color(255,255,255) || boards.get(14).getColor()!=color(255,255,255))
      {
        for(int i = 2; i<=14; i+=4)
        {
          int j = i-4;
          boolean x = false;
          while((j)>=0 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            x = true;
            boards.get(i).swapUp(boards.get(j));
            j-=4;
          }
          if(j>=0 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }


          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
          if(x)
          {
            //i+=4;
          }
        }
      }
     if(boards.get(3).getColor()!=color(255,255,255) || boards.get(7).getColor()!=color(255,255,255) ||
      boards.get(11).getColor()!=color(255,255,255) || boards.get(15).getColor()!=color(255,255,255))
      {
        for(int i = 3; i<=15; i+=4)
        {
          int j = i-4;
          boolean x = false;
          while((j)>=0 && boards.get(i).getColor()!=color(255,255,255) && boards.get(j).getColor()==color(255,255,255))
          {
            x = true;
            boards.get(i).swapUp(boards.get(j));
            j-=4;
          }
          if(j>=0 && boards.get(i).getColor()==boards.get(j).getColor() && boards.get(i).getColor()!=color(255,255,255) && !boards.get(j).isUsed())
          {
            boards.get(i).combine(boards.get(j));
            boards.get(j).display();
          }


          boards.get(i).display();
          fill(color(100,0,0));
          //text(boards.get(i).getPos(),(boards.get(i).getX1()+50),(boards.get(i).getY1()+50));
          resetNames();
          if(x)
          {
            //i+=4;
          }
        }
      }
      for(int i = 0; i<16; i++)
      {
        boards.get(i).not();
        if(boards.get(i).getColor()!=color(255,255,255))
        {
          text(boards.get(i).getNum(), boards.get(i).getX1() + 50, boards.get(i).getY1() + 50);
        }
      }
      resetNames();
      
      }
      random();
  }
  
  void resetNames()
  {
      ArrayList<Rectangles> temp = new ArrayList<Rectangles>();
      for(int i = 0; i<16; i++)
      {
          temp.add(null);
      }
      for(int i = 0; i<16; i++)
      {
          int set = boards.get(i).getPos();
          println(set);
          temp.set(set,boards.get(i));
      }
      boards = temp;
  }
  
  
class Rectangles
{
    int x1;
    int y1;
    color c;
    int n;
    int pos;
    boolean used = false;
    Rectangles(int xpos1, int ypos1,color c1, int p)
    {
        x1 = xpos1;
        y1 = ypos1;
        c = c1;
        n = 2 * (int)(random(2) + 1);
        if(n==2 && c!=color(255,255,255))
        {
          c = color(0,255,255);
        }
        if(n==4 && c!=color(255,255,255))
        {
          c = color(0,255,255) - 30;
        }
        pos = p;
    }
        void display()
        {
            fill(c);
            rect(x1,y1,125,125);
        }
        void moveLeft()
        {
            x1-=125;
            int temp = pos;
            pos--;
            if(x1<0)
            {
                x1 = 375;
                if(c==(color(255,255,255)))
                {
                    pos+=4;
                    x1 = 375;
                }
                else
                {
                    pos++;
                    x1 = 0;
                }
            }
            //if(c==color(255,255,255))
            //{
            //  if(boards.get(pos).getColor()!=color(255,255,255))
            //  {
            //    if(boards.get(pos).getX1()==0)
            //    {
            //      pos+=3;
            //      x1 = 375;
            //    }
            //  }
           // }
            fill(color(100,0,0));
            //text(pos,(x1+50),(y1+50));
            //Rectangles one = boards.get(pos);
            //boards.set(pos,this);
            //boards.set(temp, one);
            //if(!pos==0 || !pos==4 || !pos==8 || pos==12 && !c==color(255,255,255))
            //{
            //        this.moveLeft();
            //}
        }
        void moveRight()
        {
            int temp = pos;
            pos++;
            x1+=125;
            if(x1>375)
            {
                if(c==(color(255,255,255)))
                {
                    pos-=4;
                    x1 = 0;
                }
                else
                {
                    pos--;
                    x1 = 375;
                }
            }
            fill(color(100,0,0));
        }
        void moveUp()
        {
            int temp = pos;
            pos-=4;
            y1-=125;
            if(y1<0)
            {
                y1 = 375;
                if(c==(color(255,255,255)))
                {
                    pos+=16;
                    y1 = 375;
                }
                else
                {
                    pos+=4;
                    y1 = 0;
                }
            }
            fill(color(100,0,0));
        }
        void moveDown()
        {
            int temp = pos;
            pos+=4;   
            y1+=125;
            if(y1>375)
            {
                if(c==(color(255,255,255)))
                {
                    pos-=16;
                    y1 = 0;
                }
                else
                {
                    pos-=4;
                    y1 = 375;
                }
            }
            fill(color(100,0,0));
        }
        void swapLeft(Rectangles r)
        {
          this.moveLeft();
          r.moveRight();
          r.display();
          
        }
        void swapDown(Rectangles r)
        {
          this.moveDown();
          r.moveUp();
          r.display();
          
        }
        void swapUp(Rectangles r)
        {
          this.moveUp();
          r.moveDown();
          r.display();
          
        }
        void swapRight(Rectangles r)
        {
          this.moveRight();
          r.moveLeft();
          r.display();
        }
        void combine (Rectangles r)
        {
          c = color(255,255,255);
          n = 2 * (int)(random(2) + 1);
          r.brighten();
        }
        void brighten ()
        {
          n = n * 2;
          used = true;
          c = c-30; 
        }
        color getColor()
        {
            return c;
        }
        int getPos()
        {return pos;}
        void setPos(int x)
        {
          pos = x;
        }
        int getX1()
        {return x1;}
        int getY1()
        {return y1;}
        int getNum()
        {return n;}
        boolean isUsed()
        {
          return used;
        }
        void not()
        {
          used = false;
        }
        void setColor(color co)
        {
          c = co;
        }
        
  }    
  void random()
  {
    int x = (int)random(16);
    while(boards.get(x).getColor()!=color(255,255,255))
    {
      x = (int)random(16);
    }
    if(boards.get(x).getNum()==2)
    {
      boards.get(x).setColor(color(0,255,255));
    }
    if(boards.get(x).getNum()==4)
    {
      boards.get(x).setColor(color(0,255,255) - 30);
    }
    boards.get(x).display();
    fill(color(100,0,0));
    text(boards.get(x).getNum(),(boards.get(x).getX1()+50),(boards.get(x).getY1()+50));
  }
