
void printDigit(int _n, float _x, float _y, float _w, float _h){
  switch(_n){
  case 0:
    drawDigit("111101101101111", _x, _y, _w, _h);
    break;
  case 1:
    drawDigit("110010010010111", _x, _y, _w, _h);
    break;
  case 2:
    drawDigit("111001111100111", _x, _y, _w, _h);
    break;
  case 3:
    drawDigit("111001111001111", _x, _y, _w, _h);
    break;
  case 4:
    drawDigit("100101111001001", _x, _y, _w, _h);
    break;
  case 5:
    drawDigit("111100111001111", _x, _y, _w, _h);
    break;
  case 6:
    drawDigit("110100111101111", _x, _y, _w, _h);
    break;
  case 7:
    drawDigit("111001001010100", _x, _y, _w, _h);
    break;
  case 8:
    drawDigit("111101101101111", _x, _y, _w, _h);
    break;
  case 9:
    drawDigit("111101111001010", _x, _y, _w, _h);
    break;

  default:
    break;
  }
}

void drawDigit(String _matrix, float _x, float _y, float _w, float _h){
  float r = 0;
  if(_w/6 > _h/10) r = _h/5; else r = _w/3;
  if(int(_matrix.substring(0, 1)) == 1) ellipse(_x+_w/6*1, _y+_h/10*1, r, r);
  if(int(_matrix.substring(1, 2)) == 1) ellipse(_x+_w/6*3, _y+_h/10*1, r, r);
  if(int(_matrix.substring(2, 3)) == 1) ellipse(_x+_w/6*5, _y+_h/10*1, r, r);
  if(int(_matrix.substring(3, 4)) == 1) ellipse(_x+_w/6*1, _y+_h/10*3, r, r);
  if(int(_matrix.substring(4, 5)) == 1) ellipse(_x+_w/6*3, _y+_h/10*3, r, r);
  if(int(_matrix.substring(5, 6)) == 1) ellipse(_x+_w/6*5, _y+_h/10*3, r, r);
  if(int(_matrix.substring(6, 7)) == 1) ellipse(_x+_w/6*1, _y+_h/10*5, r, r);
  if(int(_matrix.substring(7, 8)) == 1) ellipse(_x+_w/6*3, _y+_h/10*5, r, r);
  if(int(_matrix.substring(8, 9)) == 1) ellipse(_x+_w/6*5, _y+_h/10*5, r, r);
  if(int(_matrix.substring(9, 10)) == 1) ellipse(_x+_w/6*1, _y+_h/10*7, r, r);
  if(int(_matrix.substring(10, 11)) == 1) ellipse(_x+_w/6*3, _y+_h/10*7, r, r);
  if(int(_matrix.substring(11, 12)) == 1) ellipse(_x+_w/6*5, _y+_h/10*7, r, r);
  if(int(_matrix.substring(12, 13)) == 1) ellipse(_x+_w/6*1, _y+_h/10*9, r, r);
  if(int(_matrix.substring(13, 14)) == 1) ellipse(_x+_w/6*3, _y+_h/10*9, r, r);
  if(int(_matrix.substring(14, 15)) == 1) ellipse(_x+_w/6*5, _y+_h/10*9, r, r);
}


