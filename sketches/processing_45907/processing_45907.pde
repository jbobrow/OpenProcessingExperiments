
class Button{
int x,y;
int size;
color baseGray;
color overGray;
color pressGray;
boolean over = false;
boolean pressed = false;

Button(int xp, int yp, int s, color b, color o, color p){
  x = xp;
  y = yp;
  size = s;
  baseGray = b;
  overGray = o;
  pressGray = p;
}

void update(){
  if ((mouseX >= x) && (mouseX <= x+size) &&
      (mouseY >= y) && (mouseY <= y+size)){
        over = true;
      } else {
        over = false;
      }
}

boolean press(){
  if(over == true){
    pressed = true;
    return true;
  } else {
    return false;
  }
}

void release(){
  pressed = false;
}

void display(){
  if (pressed == true){
    fill(pressGray);
  }else if (over == true){
    fill(overGray);
  }else{
    fill(baseGray);
  }
  stroke(0);
  rect(x,y,size,size);
}
}

