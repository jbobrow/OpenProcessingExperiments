
/*
primitive button
*/
class Button
{
  int x, y;
  int height1;
  int width1;
  color basecolor, textcolor;
  color highlightedcolor;
  boolean over = false;
  boolean pressed = false;   
  String tex;
  int ticker = 10;
  Button(int ix, int iy, int iwidth, int iheight, color icolor, color itextcolor, String itex) 
  {
    x = ix;
    y = iy;
    tex = itex;
    width1 = iwidth;
    height1 = iheight;
    basecolor = icolor;
    textcolor = itextcolor;
    highlightedcolor = basecolor+100;
    if (highlightedcolor > 255)
    {
     highlightedcolor = 255; 
    }
  }
  
 boolean mouseClicked()
 {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height1) 
    {
      if ((pressed == false))
      {
        //println("Pressed!");
        pressed = true;
        ticker = 10;
        return true;
      }
    } 
    return false;
 }
 
 void mouseReleased()
 {
   pressed = false;
 }
  
  void drawSelf(int bgcol1, int bgcol2, int bgcol3, int bgcol4)
  {
   /*ticker--;
   if (ticker <= 0)
   {
     pressed = false;
   }*/
   fill(textcolor);
   text(tex, 1,1, width1, height1);
   fill(0,255);
   rect(x-2,y-2, width1+4, height1+4);
   if (pressed)
   {
    fill(highlightedcolor);
   }
   if (pressed == false)
   {
    fill(basecolor); 
   }
   rect(x,y, width1, height1);
   fill(bgcol1,bgcol2,bgcol3,bgcol4);
  }
}

