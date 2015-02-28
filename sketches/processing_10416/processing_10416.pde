
class MinyGUI
{
  private int _x, _y, _w, _h, _totalH;
  color bg, fg, selectColor;
  private ArrayList properties;
  private MinyWidget locked;
  private VScrollbar scrollbar;
  
  MinyGUI(int x, int y, int w, int h) 
  {
    _x = x;
    _y = y;
    _w = w;
    _h = h;
    _totalH = 0;
    
    locked = null;
    bg = color(128);
    fg = color(0);
    selectColor = color(96);
    
    properties = new ArrayList();
  }
  
  private void update()
  {
    if(scrollbar != null)
      scrollbar.update();
      
    if(locked != null)
      locked.update();
    
    if(!overRect(_x, _y, _w, _h))
      return;
    
    // its value can have changed
    if(locked == null)
    {
      for(int i=0; i<properties.size(); i++)
        ((Property)properties.get(i)).update();
    }
  }
  
  void getLock(MinyWidget p)
  {
    if(locked == null)
      locked = p;
  }
  
  boolean hasLock(MinyWidget p)
  {
    return (locked==p);
  }
  
  void releaseLock(MinyWidget p) 
  {  
    if(locked == p)
      locked = null; 
  }
  
  void display()
  {
    update();
    
    if(scrollbar != null)
    {
      scrollbar.display();
      float y = _y+min(0, -(_totalH - _h) * scrollbar.pos);
      for(int i=0; i<properties.size(); i++)
      {
        Property p = (Property)properties.get(i);
        Rect r = p.getRect();
        p.setPosition(r._x, (int)y, r._w);
        int h = p.getHeight();
        if(y+h > _y && y<_y+_h)
          p.display();
        y += h;
      }
    }
    else
    {
      for(int i=0; i<properties.size(); i++)
        ((Property)properties.get(i)).display();
    }
    
    if(locked != null)
      locked.postDisplay();
  }
  
  void onMousePressed()
  {
    if(locked != null)
    {
      if(overRect(locked.getRect()))
      {
        locked.onMousePressed();
        return;
      }
      else
      {
        locked.lostFocus();
        locked = null;
      }
    }
    
    if(!overRect(_x, _y, _w, _h))
      return;
      
    if(scrollbar != null && overRect(scrollbar.getRect()))
      scrollbar.onMousePressed();
    
    for(int i=0; i<properties.size(); i++)
    {
      Property p = (Property)properties.get(i);
      if(overRect(p.getRect()))
      {
        p.onMousePressed();
        return;
      }
    }
  }
  
  Rect getRect() { return new Rect(_x, _y, _w, _h); }
  
  void onKeyPressed()
  {
    if(locked != null)
    {
      locked.onKeyPressed();
    }
  }
  
  void addProperty(Property p)
  {
    properties.add(p);
    if(scrollbar != null)
      p.setPosition(_x, _y+_totalH, _w-15);
    else
      p.setPosition(_x, _y+_totalH, _w);
    _totalH += p.getHeight();
    
    if(_totalH > _h)
    {
      scrollbar = new VScrollbar(this, new Rect(_x+_w-15, _y, 14, _h-1));
      for(int i=0; i<properties.size(); i++)
      {
        Property tp = ((Property)properties.get(i));
        Rect r = tp.getRect();
        tp.setPosition(r._x, r._y, _w-15);
      }
    }
  }
  
  void addButton(String name, ButtonCallback callback)
  { addProperty(new PropertyButton(this, name, callback)); }
  
  void addDisplay(String name, MinyValue value)
  { addProperty(new PropertyDisplay(this, name, value)); }
  
  void addEditBox(String name, MinyString value)
  { addProperty(new PropertyEditString(this, name, value)); }
  
  void addEditBox(String name, MinyInteger value)
  { addProperty(new PropertyEditInteger(this, name, value)); }
  
  void addEditBox(String name, MinyFloat value)
  { addProperty(new PropertyEditFloat(this, name, value)); }
  
  void addSlider(String name, MinyInteger value, int mini, int maxi)
  { addProperty(new PropertySliderInteger(this, name, value, mini, maxi)); }
  
  void addSlider(String name, MinyFloat value, float mini, float maxi)
  { addProperty(new PropertySliderFloat(this, name, value, mini, maxi)); }
  
  void addCheckBox(String name, MinyBoolean value)
  { addProperty(new PropertyCheckBox(this, name, value)); }
  
  void addList(String name, MinyInteger value, String choices)
  { addProperty(new PropertyList(this, name, value, choices)); }
}

interface ButtonCallback
{
  void onButtonPressed();
}

interface MinyValue
{
  String getString();
}

class MinyInteger implements MinyValue
{
  private Integer _v;
  MinyInteger(Integer v) { _v = v; }
  Integer getValue() { return _v; }
  void setValue(Integer v) { _v = v; }
  String getString() { return _v.toString(); }
}

class MinyFloat implements MinyValue
{
  private Float _v;
  MinyFloat(Float v) { _v = v; }
  Float getValue() { return _v; }
  void setValue(Float v) { _v = v; }
  String getString() { return _v.toString(); }
}

class MinyBoolean implements MinyValue
{
  private Boolean _v;
  MinyBoolean(Boolean v) { _v = v; }
  Boolean getValue() { return _v; }
  void setValue(Boolean v) { _v = v; }
  String getString() { return _v.toString(); }
}

class MinyString implements MinyValue
{
  private String _v;
  MinyString(String v) { _v = v; }
  String getValue() { return _v; }
  void setValue(String v) { _v = v; }
  String getString() { return _v; }
}

class Rect
{
  int _x, _y, _w, _h;
  Rect(int x, int y, int w, int h)
  { _x=x; _y=y; _w=w; _h=h; }
  
  void grow(int v)
  { _x-=v; _y-=v; _w+=2*v; _h+=2*v; }
}

boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) 
    return true;
  else
    return false;
}

boolean overRect(Rect r) 
{ return overRect(r._x, r._y, r._w, r._h); }

void rect(Rect r)
{ rect(r._x, r._y, r._w, r._h); }

void text(String t, Rect r)
{ text(t, r._x, r._y, r._w, r._h); } 

interface MinyWidget
{
  Rect getRect();
  void update();
  void display();
  void lostFocus();
  void onMousePressed();
  void onKeyPressed();
  void postDisplay();
}

class Property implements MinyWidget
{
  protected MinyGUI _parent;
  String _name;
  protected int _x, _y, _w;
  
  Property(MinyGUI parent, String name)
  {
    _parent = parent;
    _name = name;
  }
  
  void setPosition(int x, int y, int w)
  {
    _x = x;
    _y = y;
    _w = w;
  }
  
  int getHeight() { return 20; }
  Rect getRect() { return new Rect(_x, _y, _w, getHeight()); }
  
  void update() {}
  void display()
  {
    textAlign(LEFT, CENTER);
    fill(_parent.fg);
    text(_name, _x+5, _y, _w * 0.4 - 7, 20); 
  }
  void lostFocus() {}
  void onMousePressed() {}
  void onKeyPressed() {}
  void postDisplay() {}
}

class PropertyButton extends Property
{
  ButtonCallback _callback;
  PropertyButton(MinyGUI parent, String name, ButtonCallback callback)
  { 
    super(parent, name);
    _callback = callback;
  }
  
  Rect getBox()
  { return new Rect((int)(_x+_w*0.2), _y+1, (int)(_w*0.6), 18); }
  
  void onMousePressed()
  {
    if(overRect(getBox()))
      _callback.onButtonPressed();
  }
  
  void display()
  {
    stroke(_parent.fg); fill(_parent.bg);
    Rect b = getBox();
    if(!mousePressed && overRect(b) && _parent.hasLock(null))
      strokeWeight(2);
    rect(b);
    strokeWeight(1);
    b.grow(-1);
    textAlign(CENTER, TOP);
    fill(_parent.fg);
    text(_name, b);
  }
}

class PropertyDisplay extends Property
{
  MinyValue _value;
  PropertyDisplay(MinyGUI parent, String name, MinyValue value)
  {
    super(parent, name);
    _value = value;
  }
  
  void display()
  {
    super.display();
    text(_value.getString(), _x + _w*0.4 + 3, _y, _w *0.6 - 8, 20);
  }
}

class PropertyEdit extends Property
{
  protected int cursorPos, cursorTime, selectionStart, selectionEnd;
  protected boolean cursorOn, selectioning;
  protected String editText;
  
  PropertyEdit(MinyGUI parent, String name)
  {
    super(parent, name);
    cursorPos = 0;
    cursorTime = 0;
    cursorOn = true;
    selectioning = false;
    selectionStart = selectionStart = -1;
  }
  
  Rect getBox()
  { return new Rect((int)(_x+_w*0.4+3), _y+1, (int)(_w*0.6-8), 18); }
  
  int findCursorPos()
  {
    float tc = mouseX - (int)(_x+_w*0.4+4); 
    int closestPos = editText.length();
    float closestDist = _w;
    for(int i=editText.length(); i>=0; i--)
    {
      float tw = textWidth(editText.substring(0,i));
      float d = abs(tc-tw);
      if(d < closestDist)
      {
        closestDist = d;
        closestPos = i;
      }
      else
        break;
    }
    return closestPos;
  }
  
  void onMousePressed()
  {
    if(overRect(getBox()))
    {
      if(!_parent.hasLock(this))
      {
        _parent.getLock(this);
        cursorTime = millis()+500;
        cursorOn = true;
        editText = getValue();
      }
           
      cursorPos = findCursorPos();
      selectioning = true;
      selectionStart = cursorPos;
    }
  }
  
  void onKeyPressed()
  {
    switch(key)
    {
      case CODED:
        switch(keyCode)
        {
          case LEFT:
            cursorPos = max(cursorPos-1, 0);
            break;
          case RIGHT:
            cursorPos = min(cursorPos +1, editText.length());
            break;
        }
        break;
      case RETURN:
      case ENTER:
        lostFocus();
        break;
      case DELETE:
        if(!selectioning && (selectionStart != -1))
        {
          editText = editText.substring(0, selectionStart) + editText.substring(selectionEnd);
          cursorPos = selectionStart;
          selectionStart = selectionEnd = -1;
        }
        else if(cursorPos < editText.length())
          editText = editText.substring(0, cursorPos) + editText.substring(cursorPos+1);
        break;
      case BACKSPACE:
        if(!selectioning && (selectionStart != -1))
        {
          editText = editText.substring(0, selectionStart) + editText.substring(selectionEnd);
          cursorPos = selectionStart;
          selectionStart = selectionEnd = -1;
        }
        else if(cursorPos > 0)
        {
          editText = editText.substring(0, cursorPos-1) + editText.substring(cursorPos);
          cursorPos--;
        }
        break;
      default:
        if(!selectioning && (selectionStart != -1))
        {
          editText = editText.substring(0, selectionStart) + editText.substring(selectionEnd);
          cursorPos = selectionStart;
          selectionStart = selectionEnd = -1;
        }
        String tempText = editText.substring(0, cursorPos) + key + editText.substring(cursorPos);
        if(validate(tempText))
        {
          editText = tempText;
          cursorPos++;
        }
        break;
    }
  }
  
  boolean validate(String test) { return true; }
  void saveValue() {}
  String getValue() { return ""; }
  
  void lostFocus()
  {
    if(validate(editText))
      saveValue();
    cursorPos = 0;
    cursorOn = true;
    selectioning = false;
    cursor(ARROW);
    _parent.releaseLock(this);
  }
  
  void update()
  {
    if(!_parent.hasLock(this))
      return;
      
    if(millis() > cursorTime)
    {
      cursorOn = !cursorOn;
      cursorTime = millis() + 500;
    }
    
    if(!mousePressed)
    {
      selectioning = false;
      if(selectionStart != selectionEnd)
      {
        int start = min(selectionStart, selectionEnd);
        int end = max(selectionStart, selectionEnd);
        selectionStart = start;
        selectionEnd = end;
      }
      else
        selectionStart = selectionEnd = -1;
    }
      
    if(overRect(getBox()))
      cursor(TEXT);
    else
      cursor(ARROW);
      
    if(selectioning)
      cursorPos = selectionEnd = findCursorPos();
  }
  
  void display()
  {
    super.display();
    
    noFill(); stroke(_parent.fg);
    Rect b = getBox();
    if(_parent.hasLock(this))
      strokeWeight(2);
    rect(b);
    strokeWeight(1);
    b.grow(-1);
    textAlign(LEFT, CENTER);
    if(_parent.hasLock(this))
    {
      if(selectionStart != selectionEnd)
      {
        float tw1, tw2, tw;
        tw1 = textWidth(editText.substring(0, selectionStart));
        tw2 = textWidth(editText.substring(0, selectionEnd));
        tw = tw2-tw1;
        
        fill(_parent.selectColor); noStroke();
        rect(b._x+tw1, b._y+1, tw, b._h-2);
        noFill();
      }
      
      fill(_parent.fg);
      text(editText, b);
      if(cursorOn)
      {
        float tw = textWidth(editText.substring(0, cursorPos));
        line(_x+_w*0.4+4+tw, _y +4, _x+_w*0.4+4+tw, _y+17);
      }
    }
    else
      text(getValue(), b);
  }
}

class PropertyEditString extends PropertyEdit
{
  MinyString _value;
  
  PropertyEditString(MinyGUI parent, String name, MinyString value)
  {
    super(parent, name);
    _value = value;
  }
  
  boolean validate(String test)
  { return textWidth(test) < getBox()._w-2; }
  
  void saveValue()
  { _value.setValue(editText); }
  
  String getValue()
  { return _value.getValue(); }
}

class PropertyEditInteger extends PropertyEdit
{
  MinyInteger _value;
  
  PropertyEditInteger(MinyGUI parent, String name, MinyInteger value)
  {
    super(parent, name);
    _value = value;
  }
  
  boolean validate(String test)
  { 
    if(test.equals("-"))
      return true;
    try
    {
      Integer.parseInt(test);
      return true;
    }
    catch(NumberFormatException e)
    { return false; }
  }
  
  void saveValue()
  { 
    try
    { _value.setValue(Integer.parseInt(editText)); }
    catch(NumberFormatException e) {} 
  }
  
  String getValue()
  { return _value.getValue().toString(); }
}

class PropertyEditFloat extends PropertyEdit
{
  MinyFloat _value;
  
  PropertyEditFloat(MinyGUI parent, String name, MinyFloat value)
  {
    super(parent, name);
    _value = value;
  }
  
  boolean validate(String test)
  { 
    if(test.equals("-"))
      return true;
    try
    {
      Float.parseFloat(test);
      return true;
    }
    catch(NumberFormatException e)
    { return false; }
  }
  
  void saveValue()
  { 
    try
    { _value.setValue(Float.parseFloat(editText)); }
    catch(NumberFormatException e) {} 
  }
  
  String getValue()
  { return _value.getValue().toString(); }
}

class PropertySlider extends Property
{
  protected boolean _over;
  
  PropertySlider(MinyGUI parent, String name)
  {
    super(parent, name);    
  }
  
  float getPos() { return 0.0; }
  void setPos(float v) {}
  
  private Rect getBox()
  {
    float fpos = (_x + _w*0.4 + 8) + (_w*0.6 - 18) * getPos();
    return new Rect((int)fpos-5, _y+8, 10, 10);
  }
  
  void update()
  {
    if(mousePressed) 
    {
      if(_over)
        _parent.getLock(this);
    }
    else
      _parent.releaseLock(this);
     
    if(_parent.hasLock(this))
    {
      float t = mouseX - (_x + _w*0.4 + 8);
      t /= _w*0.6 - 18;
      setPos(t);
    }
    else
      _over = overRect(getBox()) && !mousePressed;
  }
  
  void onMousePressed()
  {
    if(overRect(getBox()))
    {
      _over = true;
      _parent.getLock(this);
    }
    else if(overRect((int)(_x + _w*0.4 + 3), _y+8, _x + _w-5, _y+15))
    {
      float t = mouseX - (_x + _w*0.4 + 8);
      t /= _w*0.6 - 18;
      setPos(t);
    }
  }
  
  void display()
  {
    super.display();
    
    fill(_parent.bg); stroke(_parent.fg);
    line(_x + _w*0.4 + 3, _y+13, _x + _w-5, _y+13);
    if(_over || _parent.hasLock(this)) strokeWeight(2); 
    rect(getBox());
    strokeWeight(1);
  }
}

class PropertySliderInteger extends PropertySlider
{
  MinyInteger _value;
  int _mini, _maxi;
  
  PropertySliderInteger(MinyGUI parent, String name, MinyInteger value, int mini, int maxi)
  {
    super(parent, name);    
    _value = value;
    _mini = mini;
    _maxi = maxi;
  }
  
  float getPos() 
  { return (_value.getValue() - _mini) / (float)(_maxi - _mini); }
  
  void setPos(float v) 
  { _value.setValue(round(constrain(_mini+v*(_maxi-_mini), _mini, _maxi))); }
  
  void update()
  {
    super.update();
    _value.setValue(constrain(_value.getValue(), _mini, _maxi));
  }
}

class PropertySliderFloat extends PropertySlider
{
  MinyFloat _value;
  float _mini, _maxi;
  
  PropertySliderFloat(MinyGUI parent, String name, MinyFloat value, float mini, float maxi)
  {
    super(parent, name);    
    _value = value;
    _mini = mini;
    _maxi = maxi;
  }
  
  float getPos() 
  { return (_value.getValue() - _mini) / (_maxi - _mini); }
  
  void setPos(float v) 
  { _value.setValue(constrain(_mini+v*(_maxi-_mini), _mini, _maxi)); }
  
  void update()
  {
    super.update();
    _value.setValue(constrain(_value.getValue(), _mini, _maxi));
  }
}

class PropertyCheckBox extends Property
{
  MinyBoolean _value;
  
  PropertyCheckBox(MinyGUI parent, String name, MinyBoolean value)
  {
    super(parent, name);
    _value = value;
  }
  
  Rect getBox()
  { return new Rect((int)(_x + _w*0.4 + 3), _y + 8, 10, 10); }
  
  void display()
  {
    super.display();
    
    stroke(_parent.fg); fill(_parent.bg);
    Rect myBox = getBox();
    rect(myBox);
    
    if(_value.getValue())
    {
      fill(_parent.fg);
      myBox.grow(-2);
      rect(myBox);
    }
  }
  
  void onMousePressed()
  {
    if(overRect(getBox()))
      _value.setValue(!_value.getValue());
  }
}

class VScrollbar implements MinyWidget
{
  MinyGUI _parent;
  float pos;
  protected Rect _zone;
  protected boolean _over;
  
  VScrollbar(MinyGUI parent, Rect zone)
  {
    _parent = parent;
    _zone = zone;
    pos = 0;
    _over = false;
  }
  
  Rect getRect() { return _zone; }
  Rect getBox()
  { return new Rect(_zone._x+2, (int)(_zone._y+2+pos*(_zone._h-24)), _zone._w-4, 20); }
  
  void onMousePressed()
  {
    if(overRect(getBox()))
    {
      _over = true;
      _parent.getLock(this);
    }
    else
    {
      float t = mouseY - (_zone._y + 12);
      t /= _zone._h-24;
      pos = constrain(t, 0, 1);
    }
  }
  
  void update()
  {
    if(mousePressed) 
    {
      if(_over)
        _parent.getLock(this);
    }
    else
      _parent.releaseLock(this);
      
    if(_parent.hasLock(this))
    {
      float t = mouseY - (_zone._y + 12);
      t /= _zone._h-24;
      pos = constrain(t, 0, 1);
    }
    else
      _over = overRect(getBox()) && !mousePressed;
  }
  
  void display()
  {
    noFill(); stroke(_parent.fg);
    rect(_zone);
    
    fill(_parent.bg);
    if(_over || _parent.hasLock(this))
    {
      strokeWeight(2);
      Rect b = getBox();
      b._x++; b._w--; b._y++; b._h--;
      rect(b);
      strokeWeight(1);
    }
    else
      rect(getBox());
  }
  
  void lostFocus() { _over = false; }
  void onKeyPressed() {}
  void postDisplay() {}
}

class PropertyList extends Property
{
  MinyInteger _value;
  String[] _choices;
  protected boolean _below, _moving, _over;
  protected int _selected;
  
  PropertyList(MinyGUI parent, String name, MinyInteger value, String choices)
  {
    super(parent, name);
    _value = value;
    _choices = split(choices, ';');
    _below = true;
    _selected = -1;
  }
  
  Rect getBox()
  { return new Rect((int)(_x+_w*0.4+3), _y+2, (int)(_w*0.6-8), 18); }
  
  Rect getRect()
  {
    if(!_parent.hasLock(this))
      return super.getRect();
    else
      return new Rect(_x, 2+(_below?_y:_y-(getHeight()-2)*_choices.length), _w, (getHeight()-2)*(_choices.length+1));
  }
  
  void onMousePressed()
  {
    if(_parent.hasLock(this))
    {
       Rect b = getBox();
       int h = b._h;
       b.grow(-1);
       if(!_below) b._y -= (_choices.length+1) * h;
       for(int i=0; i<_choices.length; i++)
       {
         b._y+=h;
         if(overRect(b))
           _value.setValue(i);
       }
      _parent.releaseLock(this);
    }
    else if(overRect(getBox()))
    {
      _parent.getLock(this);
      Rect p = _parent.getRect();
      Rect b = getBox();
      if(b._y+b._h+(b._h-1)*_choices.length > p._y+p._h) _below = false;
      else _below = true;
      _selected = _value.getValue();
      _moving = true;
      _over = false;
    }
  }
  
  void update()
  {
    _value.setValue(constrain(_value.getValue(), 0, _choices.length));
    
    if(_moving)
    {
      if(!mousePressed)
      {
        if(_over)
        {
          _value.setValue(_selected);
          _parent.releaseLock(this);
          return;
        }
        _moving = false;
      }
      
      _over = false;
      Rect b = getBox();
      int h = b._h;
      b.grow(-1);
      if(!_below) b._y -= (_choices.length+1) * h;
      for(int i=0; i<_choices.length; i++)
      {
        b._y+=h;
        if(overRect(b))
        {
          _selected = i;
          _over = true;
          break;
        }
      }
      
      if(!_over) _selected = _value.getValue();
    }
  }
  
  void display()
  {
    super.display();
    noFill(); stroke(_parent.fg);
    Rect b = getBox();
    b._w-=14;
    rect(b);
    b.grow(-1);
    fill(_parent.fg);
    textAlign(LEFT, CENTER);
    text(_choices[(int)_value.getValue()], b);
    
    b = getBox();
    b._x += b._w-14;
    b._w = 14;
    noFill();
    rect(b);
    line(b._x+3, b._y+3, b._x+b._w/2, b._y+b._h-4);
    line(b._x+b._w/2, b._y+b._h-4, b._x+b._w-3, b._y+3);
  }
  
  void postDisplay()
  {
    Rect b = getBox();
    b._y += _below ? b._h : -_choices.length*b._h;
    b._h *= _choices.length;
    fill(_parent.bg); stroke(_parent.fg);
    rect(b);
    
    b = getBox();
    int h = b._h;
    b.grow(-1);
    if(!_below) b._y -= (_choices.length+1) * h;
    noStroke(); fill(_parent.selectColor);
    rect(b._x, b._y+h*(1+_selected), b._w+1, b._h+1);
    fill(_parent.fg);
    textAlign(LEFT, CENTER);
    for(int i=0; i<_choices.length; i++)
    {
      b._y+=h;
      text(_choices[i], b);
    }
  }
}

