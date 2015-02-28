
int x = 0; //defines x
int y = 0; //defines y
int a = 0; //defines a
int b = 0; //defines b

void setup(){ //Void Setup
  size (950, 800); //Size
  background (0); //Background
  noStroke(); //noStroke
}

void draw(){ //Void Draw
  background (0); //background color
  y = (y+3)%1605; //how fast the ghosts are going
  x = (x+3)%1; //how fast the ghosts are going
  b = (b+3)%1605; //how fast pacman is going
  a = (a+0)%1605; //how fast pacman is going
  smooth();
  strokeWeight(2);
  fill(0, 0, 255); //color of the walls
  rect(303, 140, 120, 8); //boxwall 
  rect(295, 140, 8, 300); //boxwall
  rect(480, 140, 120, 8); //boxwall
  rect(300, 432, 300, 8); //boxwall
  rect(600, 140, 8, 300); //boxwall
  rect(295, 750, 8, 300); //wall
  rect(600, 750, 8, 300); //wall
  rect(300, 600, 300, 8); //wall
  ellipseMode(RADIUS);
  body(10+x, -200+y, color(234, 152, 69)); //clyde
  body(10+x, -400+y, color(0, 255, 255)); //inky
  body(10+x, -600+y, color(255, 196, 234)); //pinky
  body(10+x, -800+y, color(255, 0 ,0));//blinky
  eyes(0+x, -890+y, -1, 0); //clyde
  eyes(0+x, -290+y, -1, 0); //inky
  eyes(0+x, -490+y, -1, 0); //pinky
  eyes(0+x, -690+y, -1, 0); //blinky
  iris(0+x, -880+y, -1, 0); //clyde
  iris(0+x, -280+y, -1, 0); //inky
  iris(0+x, -480+y, -1, 0); //inky
  iris(0+x, -680+y, -1, 0); //pinky
  fill(246, 255, 0); //color
  rect(10+a, 50+b, 10, 50 ); //pacman bar #1
  rect(20+a, 30+b, 10, 90); //pacman bar #2
  rect(30+a, 20+b, 20, 110); //pacman bar #3
  rect(50+a, 10+b, 10, 100); //pacman bar #4
  rect(60+a, 10+b, 10, 70); //pacman bar #5
  rect(70+a, 10+b, 10, 40); //pacman bar #6
  rect(80+a, 10+b, 10, 70); //pacman bar #7
  rect(90+a, 10+b, 10, 100); //pacman bar #8
  rect(100+a, 20+b, 20, 110); //pacman bar #9
  rect(120+a, 30+b, 10, 90); //pacman bar #10
  rect(130+a, 50+b, 10, 50); //pacman bar #11
}

void body (int x, int y, color c){ //VOID BODY
  fill(c);// Color
  rect(x+0, y+60, 10, 90); //From left, bar 1
  rect(x+10, y+30, 10, 130); //From left, bar 2
  rect(x+20, y+20, 10, 140); //From left, bar 3
  rect(x+30, y+10, 10, 140); //From left, bar 4
  rect(x+40, y+10, 10, 130); //From left, bar 5
  rect(x+50, y+0, 10, 150); //From left, bar 6
  rect(x+60, y+0, 10, 160); //From left, bar 7
  rect(x+70, y+0, 10, 160); //From left, bar 8
  rect(x+80, y+0, 10, 150); //From left, bar 9
  rect(x+90, y+10, 10, 130); //From left, bar 10
  rect(x+100, y+10, 10, 140); //From left, bar 11
  rect(x+110, y+20, 10, 140); //From left, bar 12
  rect(x+120, y+30, 10, 130); //From left, bar 13
  rect(x+130, y+60, 10, 90); //From left, bar 14
}

void eyes (int x, int y, int lr, int ud){ //VOID EYES
  int u = x + 20; //EYES
  int v = y + 30; //EYES
  u = u + 10*lr; //EYES
  v = v + 10*ud; //EYES
  fill(255); //EYES COLOR
  rect(20+u, 100+v, 10, 30); //EYES
  rect(30+u, 90+v, 10, 50); //EYES
  rect(40+u, 90+v, 10, 50); //EYES
  rect(50+u, 100+v, 10, 30); //EYES
  rect(80+u, 100+v, 10, 30); //EYES
  rect(90+u, 90+v, 10, 50); //EYES
  rect(100+u, 90+v, 10, 50); //EYES
  rect(110+u, 100+v, 10, 30); //EYES
}

void iris(int x, int y, int lrb, int udb){ //VOID IRIS
  int u = x + 20; //IRIS
  int v = y + 30; //IRIS
  u = u + (10*lrb); //IRIS
  v = v + (10*udb); //IRIS
  fill(0, 0, 255); //IRIS COLOR
  rect(30+u, 110+v, 20, 20); //IRIS
  rect(90+u, 110+v, 20, 20); //IRIS
}

