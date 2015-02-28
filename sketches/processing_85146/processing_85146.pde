
PImage img;
int cellsize = 10;//ドットのサイズ
int cols, rows;
float kaiten=0;
 
void setup() {
  size(800,800,P3D);
  img = loadImage( "RainbowSpiral.jpg" );//読み込む画像名
  cols = width/cellsize;
  rows = height/cellsize;
}
 
void draw() {
  background(0);
  img.loadPixels();
  translate(width/2,height/2);
  rotate(kaiten);
  kaiten += 0.005;//回転の速さ
 
  for (int i = 0; i < cols; i++ ) {
  for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2;
      int y = j*cellsize + cellsize/2;
      int loc = x + y*width;      
      color c = img.pixels[loc];
      
      float z = (mouseX/(float)width) * brightness(img.pixels[loc]) - 50.0;//画像の大きさ
      
      pushMatrix();
      translate(x,y,z*400);//奥行き
      fill(c);
      stroke(c);
      ellipse(-400+mouseY,-400+mouseY,cellsize,cellsize);//画像の位置
      popMatrix();
 
    }
  }
}

void mousePressed(){
  kaiten = 0;
}

