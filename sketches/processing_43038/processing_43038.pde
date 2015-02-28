
class Square
{
  // width in pixels
  int w;
  int x;
  int y; 
  int c;
  boolean decrement;

  Square()
  {
    x = 0;
    y = 0;
    w = 90;
    c = 0;
    decrement = false;
  }
  
  Square(int _x, int _y, int _w, int _c)
  {
    x = _x;
    y = _y;
    w = _w;
    c = _c;
  }

  void draw()
  {    
    switch(c){
        case 0:
        fill(#0d0000);break;
        case 1:
        fill(#3f0002);break;
        case 2:
        fill(#520000);break;
        case 3:
        fill(#600303);break;
        case 4:
        fill(#5b0000);break;
        case 5:
        fill(#680000);break;
        case 6:
        fill(#7e0000);break;
        case 7:
        fill(#a60101);break;
        case 8:
        fill(#c10202);break;
        case 9:
        fill(#cb2204);break;
        case 10:
        fill(#cd0101);break;
        case 11:
        fill(#d83004);break;
        case 12:
        fill(#dc2904);break;
        case 13:
        fill(#e24e06);break;
        case 14:
        fill(#e46c05);break;
        case 15:
        fill(#e78605);break;
        case 16:
        fill(#fd4606);break;
        case 17:
        fill(#ffc407);break;
      }
    rect(x, y, w, w);  
  }
  
  void upAndDown(){
    if(decrement){
      c--;
      if(c<0){
        decrement = false;
        c = 0;
      }
    } else {
      c++;
      if(c>17){
        decrement = true;
        c = 17;
      } 
    }
  }

  void mousePressed()
  {
  } 
}

Square[] squares;

void setup()
{
  int res_x = 600;
  int res_y = 600;
  int sq_size = 60;
  size(res_x, res_y);
  frameRate(10);

  squares = new Square[res_x/sq_size*res_y/sq_size];

  int idx = 0;
  for (int i=0; i < res_x/sq_size; i++){
      for (int j=0; j < res_y/sq_size; j++){
        int c = floor(random(0,17));
        squares[idx] = new Square(i*sq_size, j*sq_size, sq_size, c);
        idx++;
      }
  } 
}
  
void draw()
{
  background(#FFFFFF);
  // black outlines
  stroke(0, 0);
  smooth();
  
  for (int index=0; index < squares.length; index = index + 1){        
    if(squares[index] != null){
      squares[index].upAndDown();
      squares[index].draw();
    }
  } 
}
  
  
void mousePressed()
{
}

void mouseMoved()
{
}

void mouseReleased()
{
}


