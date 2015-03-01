
int x = 0;
int y = 0;
int my = 3;
int mx = 3;
int p2y = 200;
int p1Score = 0;
int p2Score = 0;
void setup(){
  size (600, 400);
  frameRate(60);
}
void draw(){
  drawbackground(0,0);
 fill (random(255));
  ellipse(x,y,10,10);
  x += mx;
  y += my;
  if (y > height || y < 0){
    my *= -1;
  }
  if (x > width){
    mx *= -1;   
    x = width/2;
    y = height/2;
    p1Score += 10;
  }
  if (x < 0){
    mx *= -1;   
    x = width/2;
    y = height/2;
    p2Score += 10;
  }
  fill (random(255),random(255),random(255));
  paddle (50,mouseY);
  paddle (550,p2y);
  if (abs(x-50)<10 && abs(y-mouseY)<25){
    
    mx = abs(mx);
}
  if (abs(x-550)<10 && abs(p2y - y)<25){
   
    mx = -abs(mx);
  }
  if (p2y > height-25){
    p2y = height-25;
  }
    if (p2y < 25){
    p2y = 25;
  }
  player2();
 if (p1Score > 90){
   textMode(CENTER);
   textSize(30);
    text("PLAYER ONE WINS",height/2-25,35);
    noLoop();
  }
   if (p2Score > 90){
   textMode(CENTER);
   textSize(30);
    text("PLAYER TWO WINS",height/2-25,height-15);
    noLoop();
  }
}
//player 2
 void player2(){
   if(keyPressed){
   if(keyCode == UP){
     p2y -= 7;
   }
   if(keyCode == DOWN){
     p2y += 7;
 }
   }
}

//paddle
void paddle(int x, int y){
  rectMode (CENTER);
  rect (x, y, 10, 50);
}
void drawbackground(int x,int y){
  background( 0 );
  stroke (255);
  ellipse (width/2, height/2, 100, 100);
  strokeWeight(5);
  line (width/2, 148, width/2, 50);
  line (width/2, 252, width/2, 350);
  line (0,50,600,50);
  line (0,350,600,350);
  line (253,height/2,347,height/2);
  strokeWeight(3);
  ellipse (width/2, height/2, 20, 20);
  fill ( 0 );
  ellipse (width/2, height/2, 10, 10);
  fill(255);
  textSize(20);
  text(p1Score, 150,20);
  text(p2Score, width-150,20);
}
