
int y =35;
void setup(){
  size(600,600);
}

void draw(){
  background(204);
  if (key ==CODED){
    if (keyCode ==UP){
    y=20;
  } else if (keyCode == DOWN){
    y=50;
  }
}else {y=35;
}rect (25,y,50,30);
}


