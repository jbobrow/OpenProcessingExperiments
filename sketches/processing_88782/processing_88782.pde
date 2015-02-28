
int WIDTH = 960;
int HEIGHT = 600;
void setup(){;
  size(960, 600);
}
int seconds = 0;
int minutes = 0;
int hours = 0;

void draw(){
  background(20, 135, 196);
  
  //draw update rectangles per second, minute and hour
  fill((seconds*4)%255, 50, 50);
  rect(WIDTH/60*seconds, 3*HEIGHT/4, WIDTH/60, HEIGHT/4);
  fill((minutes*4)%4, 87, 100);
  rect(WIDTH/60*minutes, HEIGHT/3, WIDTH/60, 5*HEIGHT/12);
  fill(56, 16, 178);
  rect(WIDTH/24*hours, 0, WIDTH/24, HEIGHT/3);
   
   //draw grid
  for(int i=0; i<WIDTH; i+=WIDTH/24){
    line(i, 0, i, HEIGHT/3);
    fill(196, 251, 252);
    text(i/40,i+6, HEIGHT/6);
  }
  line(0, HEIGHT/3, WIDTH, HEIGHT/3);
  for(int i=0; i<WIDTH; i+= WIDTH/60){
    line(i, HEIGHT/3, i, 3*HEIGHT/4);
    fill(196, 251, 252);
    text(i/16, i+2, 3*HEIGHT/5);
  }
  line(0, 3*HEIGHT/4, WIDTH, 3*HEIGHT/4);
  for(int i=0; i<WIDTH; i += WIDTH/60){
    line(i, 3*HEIGHT/4, i, HEIGHT);
    fill(216, 251, 255);
    text(i/16, i+2, 9*HEIGHT/10);
  }
  
  seconds = second();
  minutes = minute();
  hours = hour();
}


