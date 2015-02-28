
int x=0;//defines x
int y=0;//defines y

void setup(){
 size(800, 300);//size of canvas
 background(0);//background color (black)
 noStroke();//no stroke
}

void draw(){
  background(0);
  x=(x+4)%1500;//what x=
  y=(y+4)%1;//what y=
  pacman(-590+x,40+y);
  body(20+x, 30+y, color(41, 43, 167));//blinky(red)
  body(-130+x, 30+y, color(41, 43, 167));//pinky(pink)
  body(-280+x, 30+y, color(41, 43, 167));//inky(blue)
  body(-430+x, 30+y, color(41, 43, 167));//clyde(orange)
  iris(20+x, -30+y);//blinky(red)
  iris(-130+x, -30+y);//pinky(pink)
  iris(-280+x, -30+y);//inky(blue)
  iris(-430+x, -30+y);//clyde(orange)
  mouth(0+x,20+y);//blinky
  mouth(-150+x, 20+y);//pinky
  mouth(-300+x, 20+y);//inky
  mouth(-450+x, 20+y);//clyde
  walls(40, 0);//walls
}

void body(int x, int y, color c){
  fill(c);
  rect(0+x, 60+y, 10, 90); //first bar(in order from left to right)
  rect(10+x, 30+y, 10, 130);//2 bar
  rect(20+x, 20+y, 10, 140);//3 bar
  rect(30+x, 10+y, 10, 140);//4 bar
  rect(40+x, 10+y, 10, 130);//5 bar
  rect(50+x, 0+y, 10, 150);//6 bar
  rect(60+x, 0+y, 10, 160);//7 bar
  rect(70+x, 0+y, 10, 160);//8 bar
  rect(80+x, 0+y, 10, 150);//9 bar
  rect(90+x, 10+y, 10, 130);//10 bar
  rect(100+x, 10+y, 10, 140);//11 bar
  rect(110+x, 20+y, 10, 140);//12 bar
  rect(120+x, 30+y, 10, 130);//13 bar
  rect(130+x, 60+y, 10, 90);//last bar(14)
}

void iris(int x, int y){
  fill(255);//color(blue)
  rect(35+x, 110+y, 25, 25);//left iris
  rect(85+x, 110+y, 25, 25);//right iris

}

void mouth(int x, int y){
  fill(255);//color white
  rect(30+x, 120+y, 10, 10);//first square on left(in order from left to right)
  rect(40+x, 110+y, 20, 10);//2 square
  rect(60+x, 120+y, 20, 10);//3 square
  rect(80+x, 110+y, 20, 10);//4 square
  rect(100+x, 120+y, 20, 10);//5 square
  rect(120+x, 110+y, 20, 10);//6 square
  rect(140+x, 120+y, 10, 10);//7 square(last one)
}


void pacman(int x, int y){
   fill(227, 217, 18);//color yellow
   rect(50+x, 10+y, 50, 10);//first bar on top(in order)
   rect(30+x, 20+y, 90, 10);//2 bar
   rect(20+x, 30+y, 110, 20);//3 bar
   rect(10+x, 50+y, 100, 10);//4 bar
   rect(10+x, 60+y, 70, 10);//5 bar
   rect(10+x, 70+y, 40, 10);//6 bar
   rect(10+x, 80+y, 70, 10);//7 bar
   rect(10+x, 90+y, 100, 10);//8 bar
   rect(20+x, 100+y, 110, 20);//9 bar
   rect(30+x, 120+y, 90, 10);//10 bar
   rect(50+x, 130+y, 50, 10);//11 bar(last one on bottom)
}

void walls(int x, int y){
   fill(27, 59, 227);//color blue
   rect(30+x, 0+y, 800, 20);//top
   rect(20+x, 0+y, 10, 10);
   rect(-40+x, 200+y, 300, 20);//bottom left
   rect(240+x, 210+y, 30, 20);
   rect(250+x, 220+y, 20, 80);
   rect(550+x, 200+y, 300, 20);//bottom right
   rect(540+x, 210+y, 30, 20);
   rect(540+x, 220+y, 20, 80);
 
}

