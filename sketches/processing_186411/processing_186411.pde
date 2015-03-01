
//http://www.learningprocessing.com/examples/chapter-5/example-5-6/
//Modified code from Daniel Shiffman's Bouncing Ball 
float x = 0;
float y = 0;
float xspeed = 1;
float yspeed = 1;
float d =0;
int score = 0;
int time= 300;
color c =0;

void setup() {
  size(500,500);
  smooth();

   x = random(width);
    y = random(height);
    xspeed = random( -5,5);
    yspeed = random( -5,5);
    frameRate(30);
}

void draw() {
  time --;
  background(255);
    noStroke();
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    if (x > width || x < 0) {
      xspeed *= - 1;
    }

    if (y > height || y < 0) {
      yspeed *= - 1;
    }

  d = dist(x,y, mouseX,mouseY);
  if(d < 25){
    c = color(random(255),random(255),random(255));
    x = random(width);
    y = random(height);
    xspeed = random( -3,3);
    yspeed = random( - 3,3);
    score ++;
  }
  fill(c,50);
  ellipse(x,y,50,50);
  fill(0);
  ellipse(x,y,2,2);
  
  text("SCORE : " + score, 20,20);
  text("TIME : " + int(time/30), 20,40);
  
  if (time <0){
    rect(0,0,width, height);
    fill(255);
    text("GAME OVER", width/2-30,height/2-20);
    text("YOUR SCORE is " + score, width/2-50,height/2);
    fill(125);
    text("Press R key to restart", width/2-60,height/2 +30);
      if (keyPressed) {
        if (key == 'r' || key == 'R') {
          time = 300;
          score =0;
      }
    }
  }
}
