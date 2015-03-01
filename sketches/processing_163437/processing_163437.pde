
int x=0;
int y=0;
int my=3;
int mx=3;
int Playa2 = 200;

int p1Score = 0;
int p2Score = 0;

void setup() {
  size(600, 400);
}

void draw() {
  drawBackground();
  ellipse(x, y, 10, 10);
  x+=mx;
  y+=my; 
  if (y>height||y<0) {
    my = my * -1;
  }
  if (x > width) {
    mx *= -1;
    x=width/2;
    y=height/2; 
    p1Score += 100;
  }
  if (x < 0) {
    mx *= -1;
    x=width/2;
    y=height/2;  
    p2Score += 100;
  }
paddle(50, mouseY);
paddle(550, Playa2);

} 
//hit test!
  if(abs(x-50)<15 && abs(y-mouseY)<20){
    mx= abs(mx);
}
  if (abs(x-550)<15 && abs(y- Playa2)<40) {
    mx = -abs(mx);
}
}
textSize(25);
text(p1Score, 150, 20);
text(p2Score, width-150, 20);
} 

//Keyboard input For player 2

void keyPressed() {
  if (key == 'w') {
    Playa2 = Playa2 - 30;
  }
  if (key == 's') {
    Playa2 = Playa2 + 30;
  }
}







void paddle(int x, int y) {
  //paddle
  rectMode(CENTER); 
  rect(x, y, 10, 40);
}
void drawBackground() {
  background(50);
  stroke(0);
  line(175, 200, 425, 200); 
  fill(255, 0, 0);
  ellipse(300, 200, 250, 250);
  line(175, 200, 425, 200);
  ellipse(width/2, height/2, 100, 100);
}

