
   float origin,R,G,B,A;               //declare colors

void setup() {
  size(600,600);
  background(255);                    //white
  smooth();
  noStroke();
  origin = dist(8, 8, width, height);  //origin of shape
}

    void draw() {
  stroke(255);
  for(float x = 10; x < 600; x+=5){  //iteration.  Style where one value is incremented repeatedly
                                     //start at 0 and count down from 5 in a cycle
  }
      for(int y = 0; y <=height; y += 100){           //draws each sq in a loop 
                                                      //y=y+100
      for(int x = 0; x <= width; x += 10){            //draws each sq in a loop
                                                      //x=x+10
                      
   float mouseDist = dist(mouseX, mouseY, x, y);          //flex
   float width = (mouseDist / origin) * 120.0;       //size of boxes
   float height = (mouseDist / origin) * 220.0;           //size of boxes
   
      frameRate(8);                                        //speed of boxes
      R=random(120);                                       //random color
      G=random(130, 0);                                      //color value
      B=random(120,0);                                   //color value
      A=random(60);                                        //transparent
      fill(R,G,B,A);                                         //color value
      rect(x, y, width, height);                            //shape
     }
       }
    }

