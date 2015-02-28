
// Quiz 2011-09-14-A
// 10 points total:
// A series of lines are drawn on the canvas.
// Their endpoints are equally spaced.
// 9 points: Using an iteration structure:
// 1 point: Aesthetics / veracity of copy / attention to detail.
// Image: http://cmuems.com/2011/resources/golan-quiz-2011-09-14/quiz-2011-09-14-a.jpg 

void setup(){
  size(400,400); 
}

void draw(){
  background(255,255,255); 
  stroke(0,0,0); 
  smooth();
  
  int spacing = 40; 
  for (int i=spacing; i<=(width-spacing); i=i+spacing){
    
    float x1 = width - i;
    float y1 = spacing; 
    
    float x2 = spacing; 
    float y2 = i;
    
    line(x1,y1, x2,y2);
  }
}
                
