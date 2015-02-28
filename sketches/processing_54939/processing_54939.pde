
void setup()
{
 //size of window
  size(300,300);
  //smoothes the jagged edges, no stroke
  noStroke();
  smooth();
}
//initial position variable
float y =0.0;
float i=0.0;

void draw () {
  //bg color
  background (#DAE823);
 //moves the circles
  translate(width/4, height/4);
  //variable statement for integer i
  for (float i = 0; i < 200; i++);
//circles
    fill(#C11D23);
    ellipse (i+100,100,40,40);
    fill(#C11D23,50);
    ellipse (i+100,100,80,80);
      fill(#C11D23,70);
      ellipse (75,y+45,i+30,50);
      fill(#09287C,250);
      ellipse (75,y+45,i+10,30);
      
           fill(#9D03FF,70);
           ellipse (100,y+45,i+30,50);
           fill(#FFC903,100);
           ellipse (100,y+45,i+10,30);
 //makes the big blue circle "loop"
 if (y>300){
    y=0;
  }
 //makes the big blue circle stretch
  if (i>300){
    i=0;
  }else{
    i+=0.8;
  }
 
}

