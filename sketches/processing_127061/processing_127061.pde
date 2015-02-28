
/* @pjs preload = "a.png"; */
//画像の動く速さ
PImage sprite;
int r = 10;
int x = r;
int y = r;
int dx = 2;
int dy = 3;

//画像が動くアニメーション

void setup() {
 
  size(249,300);
   sprite = loadImage("a.png");
  
  
  size(450, 450);
  frameRate(20);
  background(255,100,255);
  
   size(450,450);
  ellipseMode(RADIUS);
  background(0,0,0);
  frameRate(50);
}

void draw() {
  
  image(sprite, x, 100);

  
  fadeToWhite();
  textSize(50);
  fill(255,0,255);
  text("Apple",mouseX, mouseY);　//textでApple表示
   
   stroke( 0, 0, 0, 10 );
  fill( 0, 0, 0, 10 );
  rect( 0, 0, width, height );

  stroke( 0, 0, 255, 100 );
  fill( 0, 255, 255, 100 );
  ellipse( x, y, r, r );
 
  x = x + dx;
  y = y + dy;

  if( y > height-r || y < r )  dy = -dy;
  if( x > width-r || x < r )  dx = -dx;
  
  
  
}

//Appleロゴの位置
void fadeToWhite() { 
  noStroke();
  fill(255, 50);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

//マウスクリックでランダムで色を表示する
void mouseClicked() {
  size(450, 450);
background(0);
noStroke();

for (int i = 0; i < 100; i ++) {
  fill(random(255), random(255), 255, 100);
  ellipse(random(450), random(450), 60, 60);
  
}
  
  
}

//"A"を押すと違う色の画像になる（ランダムで色を表示する）
void keyPressed() {
  if ( key == 'a' ) {
    size(450,450);
   sprite = loadImage("a.png");
    background( 255,100,255 );
    size(450, 450);
colorMode(HSB, 100);
background(99);

for(int x = 0; x < width; x++){
  float color1 = random(100); 
  stroke(color1, 60, 99);
  line(x, 0, x, height);
}
    
  }
}

