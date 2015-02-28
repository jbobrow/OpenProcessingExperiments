
// I know this isn't the prettiest but it's fairly easy to implement all you have to do is copy and paste the code 
Button newbtn;
buttonTable btntbl;
void setup() {
  size(500, 500);
  background(255);
  newbtn = new Button("  Test  ", 0, 0, 0); 
  btntbl = new buttonTable(0, 0, newbtn);
  btntbl.addButton("  test2  ");
  btntbl.display();
  btntbl.btntab[0].selected = true;
}
void draw()
{
  btntbl.display();
}
void mousePressed()
{
 
 if( btntbl.update())
  {
      switch (btntbl._selected._listindex)
      {
          case 0:println("test");break;
          case 1:println("test2");break;
          default:break;
      }
  }
}



 
//copy copy below this if you want to use the table button. feel free to use/modify/expand just give me a bit of credit. :)

class buttonTable {
  int x, y;
  PGraphics bt;
  Button[] btntab = {};
  Button _selected;
  int width;
  buttonTable(int _x, int _y, Button first)
  {
    x= _x;
    y=_y;
    this._selected = btntab[0];
    width = first._width;
    btntab = append(btntab, first);
    
    bt = createGraphics(width, first._height*btntab.length(), P2D);
    bt.beginDraw();
    first.display(bt);
    bt.endDraw();
    
    
  }
 
  boolean update()
  {
    if (mousePressed && mouseX < x+bt.width && mouseX > x && mouseY < y+bt.height && mouseY >y)
    {
     bt = createGraphics(width, btntab[0]._height*btntab.length(), P2D);
    bt.beginDraw();
 
      for (int i = 0; i <=btntab.length()-1;i++)
      {
       if (width<btntab[i]._width)
       {width = btntab[i]._width;}
        btntab[i].update();
        btntab[i].display(bt);
        if (btntab[i].selected)
        {
            this._selected = btntab[i];
        }
      }
      bt.endDraw();
      return true;
    }
    else{ return false;}
  }
  var display()
  {
    for (int i = 0; i <=btntab.length()-1;i++)
    {
      btntab[i].display(bt);
    }
    image(bt,x,y);
  }
  var addButton(String name)
  {
      btntab = append(btntab, new Button(name, x,y, btntab.length()));
      if (btntab[btntab.length()-1]._width > width ){
       width = btntab[btntab.length()-1]._width;}
      bt = createGraphics(width, btntab[btntab.length()-1]._height*btntab.length(), P2D);
      bt.beginDraw();
      for (int i = 0; i <=btntab.length()-1;i++)
      {
        btntab[i].update();
        btntab[i].display(bt);
      }
      bt.endDraw();
  }
}
 
 
class Button {
  PGraphics btnimg;
  PGraphics btnimg2;
  String _caption;
  boolean _mouseOver = false;
  boolean selected = false;
  boolean _mouseClicked = false;
  float _height;
  float _width;
  int _x;
  int _y;
  int _listindex = 0;
  Button (String caption, int x, int y, int index)
  {
    PFont font;
    font = loadFont("FFScala.ttf"); 
    textFont(font, 16); 
    _x = x; 
    _y = y; 
    _height = 24;
    _caption = caption;
    _width = textWidth(caption)+10;
 
 
    btnimg = createGraphics(int(_width), int(24), P2D);
    _listindex = index;
    btnimg.fill(00);
    btnimg.textFont(font, 16); 
    btnimg.beginDraw();
    btnimg.background(255);
 
    btnimg.rect(0, 0, _width-1, _height-1, 2);
    btnimg.fill(230);
    btnimg.rect(0, 0, _width-3, _height-3, 2);
    btnimg.fill(0);
    btnimg.text(_caption, 2, 5, _width-6, _height-6);
    btnimg.smooth();
    btnimg.endDraw();
   
    btnimg2 = createGraphics(int(_width), int(24), P2D);
    btnimg2.fill(200);
    btnimg2.textFont(font, 16); 
    btnimg2.beginDraw();
    btnimg2.background(255);
 
    btnimg2.rect(0, 0, _width-1, _height-1, 2);
    btnimg2.fill(0);
    btnimg2.rect(0, 0, _width-3, _height-3, 2);
    btnimg2.fill(255);
    btnimg2.text(_caption, 2, 5, _width-6, _height-6);
    btnimg2.smooth();
    btnimg2.endDraw();
  }
  void display(PGraphics event)
  {
    if (selected)
    {
      event.image(btnimg2, _x, _y+(_listindex*(_height+1)));
    }
    else
    {
 
      event.image(btnimg, _x, _y+(_listindex*(_height+1)));
    }
  }
  boolean update()
  {
 
 
    if (mousePressed && mouseX < _x+_width && mouseX > _x && mouseY < _y+((_listindex+1)*(_height+1)) && mouseY >_y+((_listindex)*(_height+1)))
    {
      selected = true;
      //println(selected);
 
 
      return true;
    }
    else {
    selected = false;
      return false;
      
    }
  }
}
