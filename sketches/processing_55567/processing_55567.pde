

void setup()
{
 //size of window
  size(300,300);
  //smoothes the jagged edges, no stroke
  noStroke();
  smooth();
}
//initial position variable
float angle = 0;
float speed = 0.8;
float y0 = 100;
float w = random(5,30);
float y =mouseY;
float i= 0.0;
float x=mouseX;
 
void draw () {
  //bg color
  background (#A0E6FF);
 //moves the circles
  translate(width/4, height/4);
  //variable statement for integer i
  for (float i = 0; i < 200; i++);
//clouds
    fill(255);
    ellipse (i+100,mouseY,40,40);
    fill(255);
    ellipse (i+70,mouseY,65,65);
    fill(255);
    ellipse (i+35,mouseY,65,65);
    fill(255);
    ellipse (i+10,mouseY,40,40);
     fill(255);
     ellipse (i+200,mouseY-100,40,40);
     fill(255);
     ellipse (i+170,mouseY-100,65,65);
     fill(255);
     ellipse (i+135,mouseY-100,65,65);
     fill(255);
     ellipse (i+110,mouseY-100,40,40);
           
           fill(255,20);
           ellipse (0,mouseY,i,50);
           fill(255,20);
           ellipse (0,mouseY,i,30);
           fill(255,20);
      ellipse (mouseX,10,i+10,50);
      fill(255,20);
      ellipse (mouseX,10,i+10,100);
           fill(#FFEC1A);
    
    angle += speed;
   if (x<width) {
       x ++;
   }else{
     x = 0;
   }
    y= y0 + 10 * sin(angle/w);
     ellipse(x,y,70,70);
    if (mousePressed == true) {
      fill(10,10);
      ellipse (x,y,200,200);
    }
    
  ellipse(x,y,20,20);
 if (mouseY>300){
    mouseY=0;
  }
 //makes the big blue circle stretch
  if (i>100){
    i=0;
  }else{
    i+=0.8;



  }
}


void mouseClicked() {
  ellipse(x,y,200,200);
    if (mouseY>100){
    y=0;
  }else{
    y+=0.8;
  }

}

