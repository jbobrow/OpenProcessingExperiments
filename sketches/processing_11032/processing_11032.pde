
class ColorGradient
{
  class VarKey
  { float position; color value; }
  private color _defaultValue;
  private boolean _useLookupTable;
  private color[] _lookupTable;
  private int _interpolationMethod;
  
  ArrayList keysList;
  
  ColorGradient(color defaultValue)
  {
    _defaultValue = defaultValue;
    _useLookupTable = false;
    keysList = new ArrayList();
    _interpolationMethod = 0;
  }
  
  int getInterpolation() { return _interpolationMethod; }
  void setInterpolation(int i) { _interpolationMethod = i%5; }
  
  int size() { return keysList.size(); }
  void clear() { keysList.clear(); update(); }
  void remove(int index) { keysList.remove(index); update(); }
  
  int add(float pos, color val)
  {
    pos = constrain(pos, 0, 1);
    
    VarKey newVar = new VarKey();
    newVar.position = pos;
    newVar.value = val;
    
    int size = keysList.size();
    for(int i=0; i<size; i++)
    {
      VarKey v = (VarKey)keysList.get(i);
      if(v.position == pos) // don't add, just update 
      { v.value = val; update(); return i; }
    }
    
    keysList.add(newVar);
    update();
    return size;
  }
  
  void set(int index, float pos, color val)
  {  
    pos = constrain(pos, 0, 1);
    VarKey var = (VarKey)keysList.get(index);
    var.position = pos;
    var.value = val;
    update();
  }
  
  void setValue(int index, color val)
  { 
    ((VarKey)keysList.get(index)).value = val; 
    update(); 
  }
  
  void setPosition(int index, float pos)
  { 
    pos = constrain(pos, 0, 1);
    ((VarKey)keysList.get(index)).position = pos; 
    update(); 
  }
  
  float getPosition(int index)
  { return ((VarKey)keysList.get(index)).position; }
  
  color getValue(int index)
  { return ((VarKey)keysList.get(index)).value; }
  
  int getPrev(float pos)
  {
    int size = keysList.size();
    int best = -1;
    float bestPos = pos;
    for(int i=0; i<size; i++)
    {
      float p = getPosition(i);
      if(p < pos && (bestPos <= p || bestPos == pos))
      {
        bestPos = p;
        best = i;
      }
    }
    
    return best;
  }
  
  int getPrev(int index) { return getPrev(getPosition(index)); }
  
  int getNext(float pos)
  {
    int size = keysList.size();
    int best = -1;
    float bestPos = pos;
    for(int i=0; i<size; i++)
    {
      float p = getPosition(i);
      if(p > pos && (bestPos >= p || bestPos == pos))
      {
        bestPos = p;
        best = i;
      }
    }
    
    return best;
  }
  
  int getNext(int index) { return getNext(getPosition(index)); }
  
  color get(float pos)
  {
    int size = keysList.size();
    if(size == 0)  return _defaultValue;
    if(size == 1) return ((VarKey)keysList.get(0)).value;
    
    if(_useLookupTable)
    {
      int i = constrain(floor(pos*_lookupTable.length), 0, _lookupTable.length-1);
      return _lookupTable[i];
    }
    
    TreeMap sorted = getSortedMap();
    
    if(_interpolationMethod != 4 && sorted.containsKey(pos))
      return (Integer)sorted.get(pos);
      
    SortedMap left, right;
    left = sorted.headMap(pos);
    if(left.size() == 0) return (Integer)sorted.get(sorted.firstKey());
    right = sorted.tailMap(pos);
    if(right.size() == 0) return (Integer)sorted.get(sorted.lastKey());
    
    float leftKey, rightKey;
    leftKey = (Float)left.lastKey();
    rightKey = (Float)right.firstKey();
    
    float amt = (pos-leftKey)/(rightKey-leftKey);
    
    color leftValue, rightValue;
    leftValue = (Integer)sorted.get(leftKey);
    rightValue = (Integer)sorted.get(rightKey);
    
    switch(_interpolationMethod)
    {
      case 0:
      default:
        return lerpColor(leftValue, rightValue, (1-cos(amt*PI))/2);
      case 1:
        return lerpColor(leftValue, rightValue, amt);
      case 2:
        return rightValue;
      case 3:
        return leftValue;
      case 4:
        return amt<0.5?leftValue:rightValue;
        //return (leftValue+rightValue)/2;
    }
  }
  
  // prepare a lookup table used in following calls of "get"
  void useLookupTable(int size)
  {
    _lookupTable = new color[size];
    _useLookupTable = true;
    update();
  }
  
  // compute a lookup table, not kept
  color[] getTable(int size)
  {
    color[] v = new color[size];
    boolean b = _useLookupTable;
    _useLookupTable = false;
    for(int i=0; i<size; i++)
    {
      float p = (float)i/(size-1);
      v[i] = get(p);
    }
    _useLookupTable = b;
    return v;
  }
  
  private TreeMap getSortedMap()
  {
    int size = keysList.size();
    if(size == 0) return null; 
    TreeMap mp = new TreeMap();
    
    for(int i=0; i<size; i++)
    {
      VarKey v = (VarKey)keysList.get(i);
      mp.put(v.position, v.value);
    }
    
    return mp;
  }
  
  private void update()
  {
    if(!_useLookupTable) return;
    _useLookupTable = false;
    for(int i=0; i<_lookupTable.length; i++)
    {
      float p = (float)i/(_lookupTable.length-1);
      _lookupTable[i] = get(p);
    }
    _useLookupTable = true;
  }
}

class GradientFrame extends MinyFrame implements FrameCreator
{
  private ColorGradient _value;
  private MinyColor _color;
  private PropertyGradient _property;
  private ColorChooserFrame _frame;
  private PImage _imgChecker, _imgSmallChecker; 
  private PGraphics _gradient;
  private int _editingPos, _editingColor, _selected;
  
  GradientFrame(MinyGUI parent, String name, ColorGradient value, PropertyGradient property)
  {
    super(parent, name);
    _value = value;
    _property = property;
    _color = new MinyColor(color(0));
    _editingPos = _editingColor = _selected = -1;
    
    setMoveable(true); 
    setResizeable(true);
    _minW = 200;
    
    _imgChecker = createImage(100, 30, RGB);
    _imgChecker.loadPixels();
    for(int x=0; x<_imgChecker.width; x++)
    {
      for(int y=0; y<_imgChecker.height; y++)
      {
        boolean b = (x%20 < 10);
        if(y%20 < 10) b = !b;
        _imgChecker.pixels[y*_imgChecker.width+x]=b?color(160):color(95);
      }
    }
    _imgChecker.updatePixels();
    
    _imgSmallChecker = createImage(15, 15, RGB);
    _imgSmallChecker.loadPixels();
    for(int x=0; x<_imgSmallChecker.width; x++)
    {
      for(int y=0; y<_imgSmallChecker.height; y++)
      {
        boolean b = (x < 8);
        if(y < 8) b = !b;
        _imgSmallChecker.pixels[y*_imgSmallChecker.width+x]=b?color(160):color(95);
      }
    }
    _imgSmallChecker.updatePixels();
  }
  
  void placeAt(int x, int y) { placeAt(x, y, 350, 105); updateGradient(); }
  void onClose() { _property.onCloseFrame(this); }
  void onResize() { updateGradient(); }
  Rect getBox() 
  { 
    Rect r = getClientArea();
    r.x += 10; r.w -= 20; r.y += 5; r.h = 30;
    return r;
  }
  
  void updateGradient()
  {
    Rect r = getBox();
    _gradient = createGraphics(r.w, r.h, JAVA2D);
    _gradient.beginDraw();
    _gradient.background(color(255, 255, 255, 0));
    // checker background
    for(int x=0; x<r.w; x+=_imgChecker.width)
      _gradient.image(_imgChecker, x, 0);
      
   // color gradient
   color[] v = _value.getTable(r.w);
   for(int x=0; x<r.w; x++)
   {
     _gradient.stroke(v[x]);
     _gradient.line(x, 0, x, 40);
   }
    _gradient.endDraw();
  }
  
  void update()
  {
    super.update();
    _box.h = 105;
    
    if(_parent.hasLock(this))
    {
      if(!mousePressed)
      {
        _parent.releaseLock(this);
      //  if(_editingPos != -1) updateGradient(); 
        _editingPos = -1;
      }
      else if(_editingPos != -1 && pmouseX != mouseX)
      {
        Rect r = getClientArea();
        int w = getBox().w;
        float p = constrain(map(mouseX-r.x, 0, r.w, 0, 1), 0, 1);
        _value.setPosition(_editingPos, p);
        updateGradient();
      }
    }
  }
  
  void onMousePressed()
  {
    super.onMousePressed();
    _selected = -1;
    
    Rect r = getBox();
    if(overRect(r))
    {
      if(_parent.getModCtrl())
      {
        float p = constrain(map(mouseX-r.x, 0, r.w, 0, 1), 0, 1);
        color c = _value.get(p);
        _value.add(p, c);
        updateGradient();
      }
    }
    
    for(int i=0; i<_value.size(); i++)
    {
      int x = r.x+floor(map(_value.getPosition(i), 0, 1, 0, r.w-1));
      int y = r.y+r.h;
      if(overRect(x-8, y+24, 16, 16))
      {
        _color.setValue(_value.getValue(i));
        if(_frame == null)
        {
          _frame = new ColorChooserFrame(_parent, _name + " (" + i + ")", _color, this);
          _frame.placeAt(mouseX, mouseY);
          _parent.addFrame(_frame);
        }
        else if(_editingColor != i)
        {
          _frame.computeColorBoxes();
          _frame._name = _name + " (" + i + ")";
        }
        _editingColor = i;
        _parent.changeFocus(_frame);
        _parent.putFrameOnTop(_frame);
        return;
      }
      
      if(overRect(x-8, y, 16, 24))
      {
        _selected = i;
        _editingPos = i;
        _parent.getLock(this);
        return;
      }
    }
  }
  
  void onKeyPressed()
  {
    super.onKeyPressed();
    
    if(_selected != -1 && /*key == CODED &&*/ (keyCode == DELETE || keyCode == BACKSPACE))
    {
      if(_frame != null && _editingColor == _selected)
        _parent.removeFrame(_frame);
      _value.remove(_selected);
      _selected = -1;
      updateGradient();
    }    
  }
  
  void display()
  {
    super.display();
    
    Rect r = getBox();
    if(_editingColor != -1 && _color.getValue() != _value.getValue(_editingColor))
    {
      _value.setValue(_editingColor, _color.getValue());
      updateGradient();
    }
    else if(_gradient == null || _gradient.width != r.w || _gradient.height != r.h)
      updateGradient();
    
    int w = r.w;
    image(_gradient, r.x, r.y);
    stroke(_parent.fg); noFill();
    r.x--; r.y--; r.w++; r.h++;
    rect(r);
    
    r = getClientArea();
    for(int i=0; i<_value.size(); i++)
    {
      int x = r.x+10+floor(map(_value.getPosition(i), 0, 1, 0, w-1));
      int y = r.y+35;
      
      if(_selected == i) fill(_parent.selectColor);
      else noFill();
      
      // selection handles
      beginShape();
      vertex(x, y);
      vertex(x+8, y+16);
      vertex(x+8, y+24);
      vertex(x-8, y+24);
      vertex(x-8, y+16);
      vertex(x, y);
      endShape();
      
      // color squares
      image(_imgSmallChecker, x-7, y+25);
//      copy(_imgChecker, 0, 0, 20, 20, x-7, y+25, 15, 15);
      fill(_value.getValue(i));
      rect(x-8, y+24, 16, 16);
    }
  }
  
  void onCloseFrame(MinyFrame frame) { _editingColor=-1; _frame=null; }
}

class PropertyGradient extends Property
{ 
  private ColorGradient _value;
  private PImage _imgChecker;
  private PGraphics _gradient;
  private GradientFrame _frame;

  PropertyGradient(MinyGUI parent, String name, ColorGradient value)
  {
    super(parent, name);    
    _value = value;
    int h = getHeight()-3;
    _imgChecker = createImage(h, h, RGB);
    _imgChecker.loadPixels();
    for(int x=0; x<h; x++)
    {
      for(int y=0; y<h; y++)
      {
        boolean b = (x%h < h/2);
        if(y%h < h/2) b = !b;
        _imgChecker.pixels[y*h+x]=b?color(160):color(95);
      }
    }
    _imgChecker.updatePixels();
  }
  
  Rect getBox()
  { return new Rect((int)(_x+_w*0.4+3), _y+1, (int)(_w*0.6-8), 18); }
  
  void onMousePressed()
  {
    if(overRect(getBox()))
    {
      if(_frame == null)
      {
        _frame = new GradientFrame(_parent, _name, _value, this);
        _frame.placeAt(mouseX, mouseY);
        _parent.addFrame(_frame);
      }
      _parent.changeFocus(_frame);
      _parent.putFrameOnTop(_frame);
    }
  }
  
  void updateGradient()
  {
    Rect r = getBox();
    r.x++; r.w--; r.y++; r.h--;
    if(_gradient == null || _gradient.width != r.w || _gradient.height != r.h)
      _gradient = createGraphics(r.w, r.h, JAVA2D);
    _gradient.beginDraw();
    _gradient.background(color(255, 255, 255, 0));
    int h = getHeight()-3;
    int x;
    for(x=0; x+h<r.w; x+=h)
      _gradient.image(_imgChecker, x, 0);
    int w = r.w - x;
    _gradient.copy(_imgChecker, 0, 0, w, h, x, 0, w, h);
    
    color[] c = _value.getTable(r.w);
    for(x=0; x<r.w; x++)
    {
      _gradient.stroke(c[x]);
      _gradient.line(x, 0, x, r.h);
    }
    _gradient.endDraw();
  }
  
  void display(PGraphics pg, int y)
  {
    super.display(pg, y);
    
    Rect r = getBox();
    r.x -= _x; r.y += y-_y;
    pg.noFill(); pg.stroke(_parent.fg);
    rect(pg, r);
    
    if(_gradient == null || r.w-1 != _gradient.width)
      updateGradient();
        
    pg.noFill(); pg.stroke(_parent.fg);
    rect(pg, r);
    pg.image(_gradient, r.x+1, r.y+1);
  }
  
  void onCloseFrame(MinyFrame frame) { _frame = null; updateGradient(); }
}

