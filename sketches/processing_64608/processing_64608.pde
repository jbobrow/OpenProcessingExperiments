
board brd=new board();
int l=10;
int h=10;
tile[] board=new tile[l*h];
int index; 


void setup()
{
  size(300,300);
  smooth();
  
  fill(166,166,166);
  int sum;
  background(99,99,99);
  //set board
   for(int x=0;x<h;x++)
  {
    for(int y=0;y<l;y++)
    {
      index=x*l+y;
      rect(y*30,x*30,30,30);
      board[index]=new tile(index);
    }
  }
   
  //set bombs
  for(int x=0;x<h;x++)
  {
    for(int y=0;y<l;y++)
    {
      index=x*l+y;
      if(random(0,100)<20)
        board[index].chgImg("x");
      else
        board[index].chgImg("o");
    }
  }
  
  //set numbers
  for(int x=0;x<h;x++)
  {
    for(int y=0;y<l;y++)
    {
      index=x*l+y;
      //check if bomb
      if(board[index].retImg().equals("x")==false)
      {
        sum=0;
        //check corners
        if(index==0)
        {
          if(board[index+1].retImg().equals("x"))
            sum++;
          if(board[index+l].retImg().equals("x"))
            sum++;
          if(board[index+l+1].retImg().equals("x"))
            sum++;
        }
        else if(index==l-1)
        {
          if(board[index-1].retImg().equals("x"))
            sum++;
          if(board[index+l].retImg().equals("x"))
            sum++;
          if(board[index+l+1].retImg().equals("x"))
            sum++;
        }
        else if(index==l*h-l)
        {
          if(board[index+1].retImg().equals("x"))
            sum++;
          if(board[index-l].retImg().equals("x"))
            sum++;
          if(board[index-l+1].retImg().equals("x"))
            sum++;
        }
        else if(index==l*h-1)
        {
          if(board[index-1].retImg().equals("x"))
            sum++;
          if(board[index-l].retImg().equals("x"))
            sum++;
          if(board[index-l+1].retImg().equals("x"))
            sum++;
        }
        
        //check edges
        else if(index/l==0)
        {
          
          if(board[index-1].retImg().equals("x"))
            sum++;
          if(board[index+1].retImg().equals("x"))
            sum++;
          if(board[index+l].retImg().equals("x"))
            sum++;
          if(board[index+l-1].retImg().equals("x"))
            sum++;
          if(board[index+l+1].retImg().equals("x"))
            sum++;
        }  
        
        else if(index/l==h-1)
        {
          
          if(board[index-1].retImg().equals("x"))
            sum++;
          if(board[index+1].retImg().equals("x"))
            sum++;
          if(board[index-l].retImg().equals("x"))
            sum++;
          if(board[index-l+1].retImg().equals("x"))
            sum++;
          if(board[index-l-1].retImg().equals("x"))
            sum++;
        }  
        
        else if(index%l==0)
        {
          
          if(board[index-l].retImg().equals("x"))
            sum++;
          if(board[index+1].retImg().equals("x"))
            sum++;
          if(board[index+l].retImg().equals("x"))
            sum++;
          if(board[index-l+1].retImg().equals("x"))
            sum++;
          if(board[index+l+1].retImg().equals("x"))
            sum++;
        }  
        
        else if(index%l==l-1)
        {
          
          if(board[index-1].retImg().equals("x"))
            sum++;
          if(board[index-l].retImg().equals("x"))
            sum++;
          if(board[index+l].retImg().equals("x"))
            sum++;
          if(board[index+l-1].retImg().equals("x"))
            sum++;
          if(board[index-l-1].retImg().equals("x"))
            sum++;
        }  
        
        //check rest
        else
        {
          if(board[index-1].retImg().equals("x"))
            sum++;
          if(board[index-l].retImg().equals("x"))
            sum++;
          if(board[index+l].retImg().equals("x"))
            sum++;
          if(board[index+l-1].retImg().equals("x"))
            sum++;
          if(board[index+1].retImg().equals("x"))
            sum++;
          if(board[index-l-1].retImg().equals("x"))
            sum++;
          if(board[index+l+1].retImg().equals("x"))
            sum++;
          if(board[index-l+1].retImg().equals("x"))
            sum++;
        }
       if(sum==0)
         board[index].chgImg("");
       else
         board[index].chgImg(""+sum); 
      }
      
    }
    
  }
  
  
  
}

void draw()
{
  for(int x=0;x<h;x++)
  {
    for(int y=0;y<l;y++)
    {
      textSize(25);
      index=x*l+y;
      if(board[index].retstate()==false)
      {
        fill(181,181,181);
        rect(y*30,x*30,30,30);
        //print imgs
        if(board[index].retImg().equals("B"))
          fill(139,37,0);
        else if(board[index].retImg().equals("x"))
          fill(255,0,0);
        else
          fill(0,0,0);
        text(board[index].retImg(),y*30,x*30,30,30);
      }
      else
      {
        fill(99,99,99);
        rect(y*30,x*30,30,30);
      }
     
  
    }
  }
  
}

void mousePressed()
{
  boolean end=false;
  index=int(mouseY/30)*l+int(mouseX/30);
  if(board[index].retImg().equals(""))
    brd.check(board[index]);
  else
    board[index].setstate(false);
  if(mouseButton==LEFT)
  {
    board[index].setCl(true);
  }
  if(mouseButton==RIGHT&&(board[index].retImg().equals("B"))==false&&board[index].retCh()==false)
  {
    board[index].saveImg();
    board[index].chgImg("B");
    
  }
  else if(mouseButton==RIGHT&&board[index].retImg().equals("B"))
  {
    board[index].chgImg(board[index].retSimg());
    board[index].setstate(true);
  }
  
 if(mouseButton==LEFT&&board[index].retImg().equals("x"))
 {  
    for(int x=0;x<h;x++)
    {
      for(int y=0;y<l;y++)
      {
        index=x*l+y;
        if(board[index].retImg().equals("x"))
          board[index].setstate(false);
      }
    }
   
 }
}




class board
{
  
  void check(tile clicked)
  {
    tile c=clicked;
    c.setstate(false);
    int index=int(c.retx());
    boolean end=false;
    if(c.retCh())
      end=true;
    c.setCh(true);
    //check corners
    while(!end)
    {
        if(index==0)
        {
          if((board[index+1].retImg().equals(""))==false)
          {
            board[index+1].setstate(false);
            end=true;
          }
          else
            check(board[index+1]);
          if((board[index+l].retImg().equals(""))==false)
          {
            board[index+l].setstate(false);
            end=true;
          }
          else
            check(board[index+l]);
          if((board[index+l+1].retImg().equals(""))==false)
          {
            board[index+l+1].setstate(false);
            end=true;
          }
          else
            check(board[index+l+1]);
        }
        else if(index==l-1)
        {
          if((board[index-1].retImg().equals(""))==false)
          {
            board[index-1].setstate(false);
            end=true;
          }
          else
            check(board[index-1]);
          if(!(board[index+l].retImg().equals("")))
          {
            board[index+l].setstate(false);
            end=true;
          }
          else
            check(board[index+l]);
          if(!(board[index+l-1].retImg().equals("")))
          {
            board[index+l-1].setstate(false);
            end=true;
          }
          else
            check(board[index+l-1]);
        }
        else if(index==l*h-l)
        {
          if(!(board[index+1].retImg().equals("")))
          {
            board[index+1].setstate(false);
            end=true;
          }
          else
            check(board[index+1]);
          if(!(board[index-l].retImg().equals("")))
          {
            board[index-l].setstate(false);
            end=true;
          }
          else
            check(board[index-l]);
          if(!(board[index-l+1].retImg().equals("")))
          {
            board[index-l+1].setstate(false);
            end=true;
          }
          else
            check(board[index-l+1]);
        }
        else if(index==l*h-1)
        {
          if(!(board[index-1].retImg().equals("")))
          {
            board[index-1].setstate(false);
            end=true;
          }
          else
            check(board[index-1]);
          if(!(board[index-l].retImg().equals("")))
          {
            board[index-l].setstate(false);
            end=true;
          }
          else
            check(board[index-l]);
          if(!(board[index-l+1].retImg().equals("")))
          {
            board[index-l+1].setstate(false);
            end=true;
          }
          else
            check(board[index-l+1]);
        }
        
        //check edges
        else if(index/l==0)
        {
          
          if(!(board[index-1].retImg().equals("")))
          {
            board[index-1].setstate(false);
            end=true;
          }
          else
            check(board[index-1]);
          if(!(board[index+1].retImg().equals("")))
          {
            board[index+1].setstate(false);
            end=true;
          }
          else
            check(board[index+1]);
          if(!(board[index+l].retImg().equals("")))
          {
            board[index+l].setstate(false);
            end=true;
          }
          else
            check(board[index+l]);
          if(!(board[index+l-1].retImg().equals("")))
          {
            board[index+l-1].setstate(false);
            end=true;
          }
          else
            check(board[index+l-1]);
          if(!(board[index+l+1].retImg().equals("")))
          {
            board[index+l+1].setstate(false);
            end=true;
          }
          else
            check(board[index+l+1]);
        }  
        
        else if(index/l==h-1)
        {
          
          if(!(board[index-1].retImg().equals("")))
          {
            board[index-1].setstate(false);
            end=true;
          }
          else
            check(board[index-1]);
          if(!(board[index+1].retImg().equals("")))
          {
            board[index+1].setstate(false);
            end=true;
          }
          else
            check(board[index+1]);
          if(!(board[index-l].retImg().equals("")))
          {
            board[index-l].setstate(false);
            end=true;
          }
          else
            check(board[index-l]);
          if(!(board[index-l+1].retImg().equals("")))
          {
            board[index-l+1].setstate(false);
            end=true;
          }
          else
            check(board[index-l+1]);
          if(!(board[index-l-1].retImg().equals("")))
          {
            board[index-l-1].setstate(false);
            end=true;
          }
          else
            check(board[index-l-1]);
        }  
        
        else if(index%l==0)
        {
          
          if(!(board[index-l].retImg().equals("")))
          {
            board[index-l].setstate(false);
            end=true;
          }
          else
            check(board[index-l]);
          if(!(board[index+1].retImg().equals("")))
          {
            board[index+1].setstate(false);
            end=true;
          }
          else
            check(board[index+1]);
          if(!(board[index+l].retImg().equals("")))
          {
            board[index+l].setstate(false);
            end=true;
          }
          else
            check(board[index+l]);
          if(!(board[index-l+1].retImg().equals("")))
          {
            board[index-l+1].setstate(false);
            end=true;
          }
          else
            check(board[index-l+1]);
          if(!(board[index+l+1].retImg().equals("")))
          {
            board[index+l+1].setstate(false);
            end=true;
          }
          else
            check(board[index+l+1]);
        }  
        
        else if(index%l==l-1)
        {
          
          if(!(board[index-1].retImg().equals("")))
          {
            board[index-1].setstate(false);
            end=true;
          }
          else
            check(board[index-1]);
          if(!(board[index-l].retImg().equals("")))
          {
            board[index-l].setstate(false);
            end=true;
          }
          else
            check(board[index-l]);
          if(!(board[index+l].retImg().equals("")))
          {
            board[index+l].setstate(false);
            end=true;
          }
          else
            check(board[index+l]);
          if(!(board[index+l-1].retImg().equals("")))
          {
            board[index+l-1].setstate(false);
            end=true;
          }
          else
            check(board[index+l-1]);
          if(!(board[index-l-1].retImg().equals("")))
          {
            board[index-l-1].setstate(false);
            end=true;
          }
          else
            check(board[index-l-1]);
        }  
        
        //check rest
        else
        {
          if(!(board[index-1].retImg().equals("")))
          {
            board[index-1].setstate(false);
            end=true;
          }
          else
            check(board[index-1]);
          if(!(board[index-l].retImg().equals("")))
          {
            board[index-l].setstate(false);
            end=true;
          }
          else
            check(board[index-l]);
          if(!(board[index+l].retImg().equals("")))
          {
            board[index+l].setstate(false);
            end=true;
          }
          else
            check(board[index+l]);
          if(!(board[index+l-1].retImg().equals("")))
          {
            board[index+l-1].setstate(false);
            end=true;
          }
          else
            check(board[index+l-1]);
          if(!(board[index+1].retImg().equals("")))
          {
            board[index+1].setstate(false);
            end=true;
          }
          else
            check(board[index+1]);
          if(!(board[index-l-1].retImg().equals("")))
          {
            board[index-l-1].setstate(false);
            end=true;
          }
          else
            check(board[index-l-1]);
          if(!(board[index+l+1].retImg().equals("")))
          {
            board[index+l+1].setstate(false);
            end=true;
          }
          else
            check(board[index+l+1]);
          if(!(board[index-l+1].retImg().equals("")))
          {
            board[index-l+1].setstate(false);
            end=true;
          }
          else
            check(board[index-l+1]);
        }
    }
  }
}


void keyPressed()
{
  if(key=='r')
    setup();
}

class tile 
{
  int x;
  String img;
  String simg;
  boolean state;
  boolean clicked;
  boolean checked;
  tile(int xx)
  {
    x=xx;
    state=true;
    clicked=false;
  }
  
  void saveImg()
  {
    simg=img;
  }
  
  String retSimg()
  {
    return simg;
  }
  void chgImg(String stg)
  {
   img=stg;
  } 
 
  String retImg()
  {
    return img;
  }
  
  String retx()
  {
    return ""+x;
  }
  
  boolean retstate()
  {
    return state;
  }
  
  void setstate(boolean boo)
  {
    state=boo;
  }
  
  void setCl(boolean cl)
  {
    clicked=cl;
  }
  
  boolean retCl()
  {
    return clicked;
  }
  
  void setCh(boolean ch)
  {
    checked=ch;
  }
  
  boolean retCh()
  {
    return checked;
  }
  
 
}

