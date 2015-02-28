
// Quiz 2011-09-14-C 
// 10 points total:
// 3 points: In a wide canvas, draw a sequence of 70 circles;
// they are spaced every 10 pixels across the screen.
// 7 points: Each circle's vertical position is randomly displaced from that of the previous one.
// Image: http://cmuems.com/2011/resources/golan-quiz-2011-09-14/quiz-2011-09-14-c.jpg 

void setup() {
  size(750, 200);
  doThatThing();
} 

void draw(){
}

void mousePressed(){
  doThatThing();
}

//----------------------------------
void doThatThing(){
  
  background(255);
  smooth();

  float y = height/2;
  for (int i=1; i<70; i++) {

    float x = i*10;
    y = y + random(-10, 10);
    
    ellipse (x,y, 8,8);
    
  }
}

                
