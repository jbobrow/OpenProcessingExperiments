
PImage foto;
int pos_x, pos_y;

void setup() {
  size(400, 400);
  foto = loadImage("Lenna.jpg");
  pos_x = -400;
  pos_y = -400;
}

void draw() {
  background(0);
  image(foto, pos_x, pos_y);
  pos_x ++;
  pos_y ++;
  
  if(pos_y > 0 && pos_x > 0)
    noLoop();
}


