
void rBox(int x, int y, int _w, int _h, color _bg, color _fg, boolean mode){
  float a;
  float b;
  
  if (mode){
    a = _h/6;
    b =  a/4;
  } else {
    a = _h/12;
    b =  a/6;
  }
  
  float W = _w/2;
  float H = _h/2;
  
  fill(_bg);
  strokeWeight( 2 );
  stroke(_fg);
  beginShape(); 
    vertex(       x +W -a,  y -H );
    
    bezierVertex( x +W -b , y -H,
                  x +W    , y -H +b, 
                  x +W    , y -H +a);
                  
    vertex(       x +W    , y +H -a);
    
    bezierVertex( x +W    , y +H -b,
                  x +W -b , y +H,
                  x +W -a , y +H);
                  
    vertex(       x -W +a , y +H );
    
    bezierVertex( x -W +b , y +H,
                  x -W    , y +H -b,
                  x -W    , y +H -a );
                  
    vertex(       x -W    , y -H +a );
    
    bezierVertex( x -W    , y -H +b,
                  x -W +b , y -H,
                  x -W +a , y -H );
  endShape(CLOSE);
}

class Tecla{
  
  int x, y, w, h;
  String s;
  
  PFont font;
  
  color bg = color(255);
  color fg = color(0);
  
  Tecla(int _x, int _y, int _w, int _h, String _s){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    s = _s;
    font = createFont("Arial",(h/10)*3);
  }
  
  void display(){
    rBox(x,y,w,h,bg,fg,true);
    fill(fg);
    textFont(font);
    textAlign(CENTER);
    text(s, x, y+(h/10)*1.3);
  }

  boolean isOver(int _x, int _y){
    if (_x >= x - w/2 && _x <= x + w/2 && _y >= y - h/2 && _y <= y + h/2) return true;
    else return false;
  }  
}

class Teclado{
  Tecla[] teclas;
  
  int x, y, w, h;
  
  Teclado(int  tempX, int tempY){
    x = tempX;
    y = tempY;
    
    w = 932;
    h = 429;
    
    String[] data = loadStrings("min-es.kbd");
    teclas = new Tecla[data.length];
    for(int i = 0; i < teclas.length; i++){
      String[] values = split(data[i],",");
      int posX   = int(values[1]);
      int posY   = int(values[2]);
      float largo  = int(values[3]);
      float alto   = int(values[4]);
      println(w + " " + h );
      teclas[i] = new Tecla(x + posX, y + posY,int(largo),int(alto), values[0]);
    }
  }
  
  void display(){
    
    rBox(473 + x,223 + y,w,h,255,100,false);
      
    for(int i = 0; i< teclas.length; i++){
      teclas[i].display();
    }
  }
}

