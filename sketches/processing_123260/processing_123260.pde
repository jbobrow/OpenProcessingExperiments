
//座標練習．個々のboxを回転させる
//元ネタ by → https://www.youtube.com/watch?v=EYxjZxLekLY
//元ネタは回転と大きさが音と同期してる（それぞれの立方体は.4秒ずつディレイ
//それも真似たいのでとりあえずは
Box[] b = new Box[20];

void setup(){
  size(450, 360, P3D);
  smooth();
  stroke(255);
  strokeWeight(4);
  for(int i=0; i<b.length; i++){
    b[i] = new Box();
  }
}
void draw(){
  background(150, 200, 130);
//  filter(BLUR);
  translate(width/2, height/2, 200);
  camera(map(mouseX, 0, width, -100, 100), map(mouseY, 0, height, -150, 150), 140,
         0, 0, 0,
         0, 1, 0);
  
  for(int i=0; i<b.length; i++){
    b[i].run();
  }
}
class Box{
  float ang1, ang2;
  float dim;
  float posx, posy, posz;    //このへんは適当
  color c;
  Box(){
    dim = 30;
    posx = random(-100, 100);  //適当にやった(以下同じ
    posy = random(-100, 100);
    posz = random(-100, 100);
    ang1 = random(-10, 10);
    ang2 = random(-10, 10);
    c = color(40, 150, 240);
  }
  void run(){
    fill(c, 100);
    pushMatrix();
    translate(posx, posy, posz); //てきとう
    rotateX(posx + ang1);        //テキトウ
    rotateY(posy + ang2);        //tekitou
    rotateZ(posz);              //ﾃｷﾄｫ
    box(dim, dim, dim);
    popMatrix();
    ang1+=0.1;
    ang2-=0.1;
  }
}
