
void setup()
{
  //size of window
  size(300,300);
  //smoothes the jagged edges, no stroke
  noStroke();
  smooth();
}
//defines initial position 
float y =0.0;
float i=0.0;
 
void draw () {
  loop();
  //bg color
  background (#B3F2EE);
  //moves the circles
  translate(width/4, height/4);
  //variable statement for integer i
  for (float i = 0; i < 200; i++);
  //circles
    fill(#C11D23);
    ellipse (i+50,0,30,30);
    fill(#C11D23,50);
    ellipse (i+50,0,60,60);
      fill(#C11D23,70);
      ellipse (75,y,i+30,50);
      fill(#09287C,200);
      ellipse (75,y,i+10,30);
  //makes the big blue circle "loop" & keep on stretching
  if (y>300){
    y=0;
  }else{
    y+=0.9;
  }
  if (i>300){
    i=0;
  }else{
    i-=0.7;
  }
  
}


