
int x = 0;
int y = 0;
int mx = 3;
int my = 3;
 int p2Y = 200;
 int p1score = 0;
 int p2score = 0;

void setup(){
  size (600,400);
  
}

void draw(){
  noCursor();
  background (255);
  stroke(0,0,100);
  strokeWeight(2);
  line (width/2,0,width/2,height);
  fill (0);
  noStroke();
  ellipse (x,y,20,20);
  stroke(255);
  fill (0);
  paddle(width-20,mouseY);
  paddle(20,mouseY);
  ellipse (x,y,10,10);
  x += mx;
  y += my;
  if (y> height || y < 0){
    my = my*-1;
}
 if (x > width) {
    mx *= -1;
    x=width/2;
    y=height/2;
    p1score += 1;
 }
    if (x < 0) {
      mx *= -1;
      x=width/2;
      y=height/2;
      p2score +=1;

    

}

  //hit test
  if (abs(x-50)<10 && abs(y-mouseY)<20) {
    mx = abs(mx);
  }
  if (abs(x-550)<10 && abs(y-p2Y)<20) {
    mx = abs(mx);
  }

fill(200,0,0);
textSize(20);
text(p1score, 150, 20);
    text(p2score, width-150, 20);
}

void keyPressed() {
  if (key=='w') {
    p2Y = p2Y - 10;
  }
   if (key=='s') {
    p2Y = p2Y + 10;
  }
}
void paddle(int x, int y) {
  //Paddle 
  fill(50,50,5);
  rectMode(CENTER);
  rect(x, y, 10, 80);
}

void drawBackground(){
  background (50);
  stroke(255);
  strokeWeight(2);
  fill(50);
  line(0,50,width,50);
  line(0,350,width,350);
  line(width/2,50,width/2,height-50);
  ellipse(width/2,height/2,100,100);
}
