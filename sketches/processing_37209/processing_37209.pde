
//quiz 1
// 10 points.
// A series of lines are drawn on the canvas. 
// Their endpoints are equally spaced. 
// Using an iteration structure: 9 points
// Aesthetics / attention to detail: 1 point
//cmuems.com/2011/resources/golan-quiz-2011-09-14/quiz-2011-09-14-a.jpg 



size (400, 400); 
background(255);
fill(255, 0, 0); 

for (int x=0; x<400; x=x+40) {
  for (int y=0; y<400; y=y+40) {
    line (x, 0, 0, y);  
    line (0, y, width, y);
  }
}

