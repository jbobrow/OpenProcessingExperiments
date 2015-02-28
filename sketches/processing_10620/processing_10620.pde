
class Button{

  float xMin;
  float xMax;
  float yMin;
  float yMax;
  boolean textureToggle;
  boolean isMouseOver = false;
  boolean mouseOver;
  PImage loadTexture;
  PImage loadTextureMo;
  String buttonText;
  String buttonTextMo;
  int buttonId;
  color fillCol;
  color strokeCol;
  color textCol;
  color fillColMo;
  color strokeColMo;
  color textColMo;
  int fontSize;
  int fontSizeMo;
  PFont fontb;

  Button(int _buttonId,String _buttonText,String _buttonTextMo,float _xMin,float _xMax,float _yMin,float _yMax,boolean _textureToggle,boolean _mouseOver,PImage _loadTexture,PImage _loadTextureMo,String _fontb,color _fillCol,color _strokeCol,color _textCol,color _fillColMo,color _strokeColMo,color _textColMo,int _fontSize,int _fontSizeMo){
    this.buttonId = _buttonId;
    this.buttonText = _buttonText;
    this.buttonTextMo = _buttonTextMo;
    this.xMin = _xMin;
    this.xMax = _xMax;
    this.yMin = _yMin;
    this.yMax = _yMax;
    this.textureToggle = _textureToggle;
    this.mouseOver = _mouseOver;
    this.loadTexture = _loadTexture;
    this.loadTextureMo = _loadTextureMo;
    fontb = loadFont(_fontb);
    this.fillCol = _fillCol;
    this.strokeCol = _strokeCol;
    this.textCol = _textCol;
    this.fillColMo = _fillColMo;
    this.strokeColMo = _strokeColMo;
    this.textColMo = _textColMo;
    this.fontSize = _fontSize;
    this.fontSizeMo = _fontSizeMo;       
  }

  void draw(){
    isMouseOver();
    beginShape();
    if(mouseOver){
      if(isMouseOver){
        pushStyle();
        stroke(strokeColMo);
        fill(fillColMo);
        vertex(xMin,yMin);
        vertex(xMax,yMin);
        vertex(xMax,yMax);
        vertex(xMin,yMax);
        endShape(CLOSE);
        if(textureToggle){
          image(loadTextureMo,xMin+1,yMin+1,xMax-xMin-1,yMax-yMin-1);
        }
        fill(textColMo);
        textFont(fontb,fontSizeMo);
        textAlign(CENTER);
        text(buttonTextMo,xMin+3,yMin+7,xMax-xMin-3,yMax-yMin-3);
        textAlign(CORNER);
        popStyle();
      }
    }

    if(!isMouseOver || !mouseOver){
      pushStyle();
      beginShape();
      stroke(strokeCol);
      fill(fillCol);
      vertex(xMin,yMin);
      vertex(xMax,yMin);
      vertex(xMax,yMax);
      vertex(xMin,yMax);
      endShape(CLOSE);
      if(textureToggle){
        image(loadTexture,xMin+1,yMin+1,xMax-xMin-1,yMax-yMin-1);
      }
      fill(textCol);
      textFont(fontb,fontSize);
      textAlign(CENTER);
      text(buttonText,xMin+3,yMin+7,xMax-xMin-3,yMax-yMin-3);
      textAlign(CORNER);
      popStyle();
    }
  }

  void isMouseOver(){
    if(mouseX > xMin && mouseX < xMax && mouseY > yMin && mouseY < yMax){
      isMouseOver = true;
    }
    else{
      isMouseOver = false;
    }
  }

}


