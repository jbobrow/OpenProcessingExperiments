
class Button
{
  float xPos,yPos,wButton,hButton;
  String str;
  boolean clicked;
  
  Button(float x,float y,boolean pressed)
  {
    xPos=x;
    yPos=y;
    clicked=pressed;
  }
  
  Button(float x,float y,float w,float h)
  {
    xPos=x;
    yPos=y;
    wButton=w;
    hButton=h;
  }
  
  Button(float x,float y,float w,float h,String s)
  {
    xPos=x;
    yPos=y;
    wButton=w;
    hButton=h;
    str=s;
  }
  
  Button()
  {
    xPos=mouseX;
    yPos=mouseY;
    wButton=200;
    hButton=50;
  }
  
  void update()
  {
    if(mousePressed)
    {
      clicked=true;
    }
  }
  
  void display_button(float x,float y,float w,float h)
  {
     noFill();
     stroke(0);
     strokeWeight(3);
     rect(x,y,w,h);
  }
   
  void display_button(float x,float y,float w,float h,String s)
  {
    rect(x,y,w,h);
    MathLib ml=new MathLib();
    PVector v;
    v=ml.cal_pos_rect(x,y,w,h);
    text(s,v.x,v.y);
    
  } 
  
  void click()
  {
    clicked=true;
  }
  
  void unclick()
  {
    clicked=false;
  }  
  
  void change_text_button(float mx,float my,String s)
  {
    MathLib ml=new MathLib();
    PVector v;
  }
  
  void change_size_button(Button b)
  {
    
  }
 
}

