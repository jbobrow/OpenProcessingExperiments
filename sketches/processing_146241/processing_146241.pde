
int lineAmount = 5;
    int speed = 1;
void setup() {
    
    size(600, 600);
    stroke(255);
    noCursor();    textSize(10);
    fill(#FFAABB);
    
    }
    
float y = 0;

void keyPressed() {

  if (keyCode == UP) {

    speed = speed + 1;

  }
    if (keyCode == SHIFT) {

    lineAmount = lineAmount + 1;

  }
    
      if (keyCode == DOWN) {

    speed = speed - 1;

  }
    
     if ( (keyCode == DOWN) && (speed == -1) ) {

    speed = speed + 1;

  }
    

}
    
void mousePressed()
    {
        speed = speed + 1;
    }
    
void draw(){
    
    background(0);
    fill(#fd8989);
    text("Speed: ",10,21);
    text("Click to increase speed. The up & down arrow keys can also be used.",10,10);
    fill(#1abc9c);
    text(speed,45,21);
    y = y-0.9;
    
    
    
    for (int i = 0; i < 80; i = i+lineAmount) {
    y = y- speed;
line(0,y - i,width,y - i);    
}    
       
    if (y < 0)
    {
    y = height + 80;
    }
    }
    if (keyPressed){
    if (key == "r" || key == "R") {

    speed = 0;
  }
    
    }
