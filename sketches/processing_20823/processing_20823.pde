

void setup() {
  size(300,300);
  background(235,246,247);
  frameRate(50);
  smooth();
  noStroke();
  fill(129,117,103);
  rect(0,150,width,height);

}


int x = 0;
void draw () {
  println("x =" + frame);
  if (x < 301) {
    x++;

    if (x > 0) {
      if (x < 100) {
        fill(255,253,250,80);
        stroke(250,244,232,50);
        strokeWeight(8);
        ellipse(85,100,50,70);
      }
      else {

        if(x > 101) {
          if(x < 200) {
            ellipse(85,100,55,70);
            fill(252,231,19,100);
            stroke(242,204,127,100);
            strokeWeight(8);
          }
          else {
            if (x > 201) {
              if(x < 300) {
                strokeWeight(1);
                stroke(0);
                line(100,70,90,80);
                line(90,80,100,90);
                line(100,90,90,110);
              }
              else {
                background(255);
                 fill(0);
                  rect(0,150,width,height);
                for(int x=100; x < width; x+=50) {
                 
                noStroke();
                    ellipse(x,80,30,20);
                  ellipse(x,100,60,40);
                 
                  fill(247,216,55,100);
                  stroke(245,111,7);
                    line(x+5,120,x,150);
                  line(x+5,150,x,150);
                  line(x+10, 120,x,150);
                
                  line(x+10,80,x,85);
                  
                line(x,85,x-10, 80);
              
               stroke(0);
                ellipse(x-4, 75, 4,4);
               ellipse(x+6, 75, 4,4);  
                
                rect(0,150,width,height);
              x++; 
                }
              
               } 
              }
            }
          }
        }
      }
    }
  }



