
Suns [] arrayOfSuns = new Suns [10];

void setup(){
size(500, 500);
  for(int i = 0; i < arrayOfSuns.length; i++){
arrayOfSuns [i] = new Suns(color (random(0, 225)), int (random(0, width)), int (random(0, height)), int (random(50, 100)), int (random(50, 100)));

  }
}

void draw(){
  
  background(206, 31, 219);
  
  for(int i = 0; i < arrayOfSuns.length; i++){
  arrayOfSuns[i].display();
  }

}


class Suns {
  int w;
  int h;
  int sunColor;
  int xpos;
  int ypos;
  
  Suns(color tempColor, int _xpos, int _ypos, int _w, int _h){
    w = _w;
    h = _h;
    sunColor = tempColor;
    xpos = _xpos;
    ypos = _ypos;
  }
  
  void display(){
  fill(sunColor);
  ellipse(xpos, ypos, w, h);
}

}

  


