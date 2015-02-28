
void setup(){
  size(700,700); //size of canvas
  background(255); ;//background color (black)
  noStroke(); //no stroke
}
void draw() {
background (0);
  flash(0,60);
  flash(200,80);
  eyes(200, 80, -1, -3); //pinky(pink)
  eyes(0, 60, -2, -2); //inky(blue)
  iris(200, 80, 0, -3); //pinky(pink)
  iris(0, 60, -2, -1); //inky(blue)
 }

color pick(){
  return color(random(225), random(225), random(225));
}


 void body(int x, int y, color c){
  fill(c);
  rect(0+x, 60+y, 10, 90); //first bar(in order from left to right)
  rect(10+x, 30+y, 10, 130);//2
  rect(20+x, 20+y, 10, 140);//3
  rect(30+x, 10+y, 10, 140);//4
  rect(40+x, 10+y, 10, 130);//5
  rect(50+x, 0+y, 10, 150);//6
  rect(60+x, 0+y, 10, 160);//7
  rect(70+x, 0+y, 10, 160);//8
  rect(80+x, 0+y, 10, 150);//9
  rect(90+x, 10+y, 10, 130);//10
  rect(100+x, 10+y, 10, 140);//11
  rect(110+x, 20+y, 10, 140);//12
  rect(120+x, 30+y, 10, 130);//13
  rect(130+x, 60+y, 10, 90);//last bar(14)
}
void eyes(int x, int y, int lr, int ud){
  int u=x+20;//eyes
  int v=y+30;//eyes
  u=u+10*lr;//eyes
  v=v+10*ud;//eyes
  fill(255);//color(white)
  rect(20+u, 100+v, 10, 30);//eye1(left)1st bar
  rect(30+u, 90+v, 10, 50);//2nd bar
  rect(40+u, 90+v, 10, 50);//3rd bar
  rect(50+u, 100+v, 10, 30);//4th bar
  rect(80+u, 100+v, 10, 30);//eye2(right)1st bar
  rect(90+u, 90+v, 10, 50);//2nd bar
  rect(100+u, 90+v, 10, 50);//3rd bar
  rect(110+u, 100+v, 10, 30);//4th bar
}
void iris(int x, int y, int lrb, int udb){
  int u=x+20;// iris
  int v=y+30;// iris
  u=u+(10*lrb);// iris
  v=v+(10*udb);// iris
  fill(0, 0, 255);//color(blue)
  rect(30+u, 110+v, 20, 20);//left iris
  rect(90+u, 110+v, 20, 20);//right iris

}

void flash(int x, int y) {
  body(0+x,60+y, pick());
}

