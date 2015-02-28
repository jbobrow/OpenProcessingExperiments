
float x=25;
float y=25;
float xspeed=0;
float yspeed=0;
float rectpos=width/2;
int counter=0;

void setup() {
  size(400, 500);
  fill(51);
}

void draw() {
  background(240);
  


//------Rectangle------//

  rect(rectpos, 480, 60, 5);

  if (keyPressed) {   
    if (key == 'a') {
      rectpos=rectpos - 6.5;
    }
    if (key == 'd') {
      rectpos=rectpos +6.5;
    }
  }



//------Ellipse------//

  ellipse(x, y, 15, 15);

  if (keyPressed) {
    if (key == ' ') {
      xspeed=5;
      yspeed=7;
    }
  }

  if (x > width-15/2  || x < 15/2) {
    xspeed=-xspeed;
  }

  if (y < 15/2) {
    yspeed=-yspeed;
  }



//------Collison&Score------//

  if (x > rectpos && x < rectpos + 60 && y > 475 && y < 485) {
    yspeed=-yspeed;
    xspeed=xspeed;
    counter=counter+2;
  }
 
  textSize(18);
  text("score: ", 300, 25);
  text(counter, 370, 25);
  


//------GameOver------//

  if (y > 520) {
    xspeed=0;
    yspeed=0;
    textSize(60);
    fill(250, 80, 50);
    text("Game Over", width/2-160, height/2-100);
    textSize(18);
    fill(0);
    text("Press 'space' to restart", width/2-95, height/2-50 );
    if (keyPressed) {
      if (key == ' ') {
        counter=0;
        x=25;
        y=25;
      }
    }
  }
  
  

  x +=xspeed;
  y +=yspeed;

}




