
PImage [] cupcakes = new PImage [8];
int w = 75;

void setup (){
  size(450,600);
  smooth();
  background (0);
  cupcakes [0] = loadImage("orange.png");
  cupcakes [1] = loadImage("blue.png");
  cupcakes [2] = loadImage("purple.png");
  cupcakes [3] = loadImage("red.png");
  cupcakes [4] = loadImage("magenta.png");
  cupcakes [5] = loadImage("green.png");
  cupcakes [6] = loadImage("teal.png");
  cupcakes [7] = loadImage("yellow.png");
  for (int x = 0; x < 450; x+=75) {
    for (int y = 0; y < 600; y+=75) {
      image(cupcakes [(int)random(0,8)], x, y);
    }
  }
  
}

void draw (){
  //row 1
if ((mouseX < 2*w) && (mouseX >w) &&(mouseY <w) && (mouseY >0))
  if (mousePressed==true) {
           image(cupcakes [(int)random(0,8)], w,0);
      }
      
if ( (mousePressed==true) && (mouseX <w) && (mouseX >0) &&
            (mouseY <w) && (mouseY >0)) {
           image(cupcakes [(int)random(0,8)], 0,0);
      }
if ( (mousePressed==true) && (mouseX < 3*w) && (mouseX >2*w) &&
            (mouseY <w) && (mouseY >0)) {
           image(cupcakes [(int)random(0,8)], 2*w,0);
      }
if ( (mousePressed==true) && (mouseX <4*w) && (mouseX >3*w) &&
            (mouseY <w) && (mouseY >0)) {
           image(cupcakes [(int)random(0,8)], 3*w,0);
      }   
if ( (mousePressed==true) && (mouseX <5*w) && (mouseX >4*w) &&
            (mouseY <w) && (mouseY >0)) {
           image(cupcakes [(int)random(0,8)], 4*w,0);
      }
if ( (mousePressed==true) && (mouseX <6*w) && (mouseX >5*w) &&
            (mouseY <w) && (mouseY >0)) {
           image(cupcakes [(int)random(0,8)], 5*w,0);
      }
//row 2
if ( (mousePressed==true) && (mouseX <2*w) && (mouseX >w) &&
            (mouseY <2*w) && (mouseY >w)) {
           image(cupcakes [(int)random(0,8)], w,w);
      }  
if ( (mousePressed==true) && (mouseX <w) && (mouseX >0) &&
            (mouseY <2*w) && (mouseY >w)) {
           image(cupcakes [(int)random(0,8)], 0,w);
      }
if ( (mousePressed==true) && (mouseX < 3*w) && (mouseX >2*w) &&
            (mouseY <2*w) && (mouseY >w)) {
           image(cupcakes [(int)random(0,8)], 2*w,w);
      }
if ( (mousePressed==true) && (mouseX <4*w) && (mouseX >3*w) &&
            (mouseY <2*w) && (mouseY >w)) {
           image(cupcakes [(int)random(0,8)], 3*w,w);
      }   
if ( (mousePressed==true) && (mouseX <5*w) && (mouseX >4*w) &&
            (mouseY <2*w) && (mouseY >w)) {
           image(cupcakes [(int)random(0,8)], 4*w,w);
      }
if ( (mousePressed==true) && (mouseX <6*w) && (mouseX >5*w) &&
            (mouseY <2*w) && (mouseY >w)) {
           image(cupcakes [(int)random(0,8)], 5*w,w);
      }
//row3
if ( (mousePressed==true) && (mouseX <2*w) && (mouseX >w) &&
            (mouseY <3*w) && (mouseY >2*w)) {
           image(cupcakes [(int)random(0,8)], w,2*w);
      }  
if ( (mousePressed==true) && (mouseX <w) && (mouseX >0) &&
            (mouseY <3*w) && (mouseY >2*w)) {
           image(cupcakes [(int)random(0,8)], 0,2*w);
      }
if ( (mousePressed==true) && (mouseX < 3*w) && (mouseX >2*w) &&
            (mouseY <3*w) && (mouseY >2*w)) {
           image(cupcakes [(int)random(0,8)], 2*w,2*w);
      }
if ( (mousePressed==true) && (mouseX <4*w) && (mouseX >3*w) &&
            (mouseY <3*w) && (mouseY >2*w)) {
           image(cupcakes [(int)random(0,8)], 3*w,2*w);
      }   
if ( (mousePressed==true) && (mouseX <5*w) && (mouseX >4*w) &&
            (mouseY <3*w) && (mouseY >2*w)) {
           image(cupcakes [(int)random(0,8)], 4*w,2*w);
      }
if ( (mousePressed==true) && (mouseX <6*w) && (mouseX >5*w) &&
            (mouseY <3*w) && (mouseY >2*w)) {
           image(cupcakes [(int)random(0,8)], 5*w,2*w);
      }
//row 4

if ( (mousePressed==true) && (mouseX <2*w) && (mouseX >w) &&
            (mouseY <4*w) && (mouseY >3*w)) {
           image(cupcakes [(int)random(0,8)], w,3*w);
      }  
if ( (mousePressed==true) && (mouseX <w) && (mouseX >0) &&
            (mouseY <4*w) && (mouseY >3*w)) {
           image(cupcakes [(int)random(0,8)], 0,3*w);
      }
if ( (mousePressed==true) && (mouseX < 3*w) && (mouseX >2*w) &&
            (mouseY <4*w) && (mouseY >3*w)) {
           image(cupcakes [(int)random(0,8)], 2*w,3*w);
      }
if ( (mousePressed==true) && (mouseX <4*w) && (mouseX >3*w) &&
            (mouseY <4*w) && (mouseY >3*w)) {
           image(cupcakes [(int)random(0,8)], 3*w,3*w);
      }   
if ( (mousePressed==true) && (mouseX <5*w) && (mouseX >4*w) &&
            (mouseY <4*w) && (mouseY >3*w)) {
           image(cupcakes [(int)random(0,8)], 4*w,3*w);
      }
if ( (mousePressed==true) && (mouseX <6*w) && (mouseX >5*w) &&
           (mouseY <4*w) && (mouseY >3*w)) {
           image(cupcakes [(int)random(0,8)], 5*w,3*w);
}
//row 5
if ( (mousePressed==true) && (mouseX <2*w) && (mouseX >w) &&
            (mouseY <5*w) && (mouseY >4*w)) {
           image(cupcakes [(int)random(0,8)], w,4*w);
      }  
if ( (mousePressed==true) && (mouseX <w) && (mouseX >0) &&
            (mouseY <5*w) && (mouseY >4*w)) {
           image(cupcakes [(int)random(0,8)], 0,4*w);
      }
if ( (mousePressed==true) && (mouseX < 3*w) && (mouseX >2*w) &&
            (mouseY <5*w) && (mouseY >4*w)) {
           image(cupcakes [(int)random(0,8)], 2*w,4*w);
      }
if ( (mousePressed==true) && (mouseX <4*w) && (mouseX >3*w) &&
            (mouseY <5*w) && (mouseY >4*w)) {
           image(cupcakes [(int)random(0,8)], 3*w,4*w);
      }   
if ( (mousePressed==true) && (mouseX <5*w) && (mouseX >4*w) &&
            (mouseY <5*w) && (mouseY >4*w)) {
           image(cupcakes [(int)random(0,8)], 4*w,4*w);
      }
if ( (mousePressed==true) && (mouseX <6*w) && (mouseX >5*w) &&
           (mouseY <5*w) && (mouseY >4*w)) {
           image(cupcakes [(int)random(0,8)], 5*w,4*w);
}
//row 6
if ( (mousePressed==true) && (mouseX <2*w) && (mouseX >w) &&
            (mouseY <6*w) && (mouseY >5*w)) {
           image(cupcakes [(int)random(0,8)], w,5*w);
      }  
if ( (mousePressed==true) && (mouseX <w) && (mouseX >0) &&
            (mouseY <6*w) && (mouseY >5*w)) {
           image(cupcakes [(int)random(0,8)], 0,5*w);
      }
if ( (mousePressed==true) && (mouseX < 3*w) && (mouseX >2*w) &&
            (mouseY <6*w) && (mouseY >5*w)) {
           image(cupcakes [(int)random(0,8)], 2*w,5*w);
      }
if ( (mousePressed==true) && (mouseX <4*w) && (mouseX >3*w) &&
            (mouseY <6*w) && (mouseY >5*w)) {
           image(cupcakes [(int)random(0,8)], 3*w,5*w);
      }   
if ( (mousePressed==true) && (mouseX <5*w) && (mouseX >4*w) &&
            (mouseY <6*w) && (mouseY >5*w)) {
           image(cupcakes [(int)random(0,8)], 4*w,5*w);
      }
if ( (mousePressed==true) && (mouseX <6*w) && (mouseX >5*w) &&
            (mouseY <6*w) && (mouseY >5*w)) {
           image(cupcakes [(int)random(0,8)], 5*w,5*w);
}  
//row 7
if ( (mousePressed==true) && (mouseX <2*w) && (mouseX >w) &&
            (mouseY <7*w) && (mouseY >6*w)) {
           image(cupcakes [(int)random(0,8)], w,6*w);
      }  
if ( (mousePressed==true) && (mouseX <w) && (mouseX >0) &&
            (mouseY <7*w) && (mouseY >6*w)) {
           image(cupcakes [(int)random(0,8)], 0,6*w);
      }
if ( (mousePressed==true) && (mouseX < 3*w) && (mouseX >2*w) &&
            (mouseY <7*w) && (mouseY >6*w)) {
           image(cupcakes [(int)random(0,8)], 2*w,6*w);
      }
if ( (mousePressed==true) && (mouseX <4*w) && (mouseX >3*w) &&
            (mouseY <7*w) && (mouseY >6*w)) {
           image(cupcakes [(int)random(0,8)], 3*w,6*w);
      }   
if ( (mousePressed==true) && (mouseX <5*w) && (mouseX >4*w) &&
            (mouseY <7*w) && (mouseY >6*w)) {
           image(cupcakes [(int)random(0,8)], 4*w,6*w);
      }
if ( (mousePressed==true) && (mouseX <6*w) && (mouseX >5*w) &&
            (mouseY <7*w) && (mouseY >6*w)) {
           image(cupcakes [(int)random(0,8)], 5*w,6*w);
}
//row 8
if ( (mousePressed==true) && (mouseX <2*w) && (mouseX >w) &&
            (mouseY <8*w) && (mouseY >7*w)) {
           image(cupcakes [(int)random(0,8)], w,7*w);
      }  
if ( (mousePressed==true) && (mouseX <w) && (mouseX >0) &&
            (mouseY <8*w) && (mouseY >7*w)) {
           image(cupcakes [(int)random(0,8)], 0,7*w);
      }
if ( (mousePressed==true) && (mouseX < 3*w) && (mouseX >2*w) &&
            (mouseY <8*w) && (mouseY >7*w)) {
           image(cupcakes [(int)random(0,8)], 2*w,7*w);
      }
if ( (mousePressed==true) && (mouseX <4*w) && (mouseX >3*w) &&
            (mouseY <8*w) && (mouseY >7*w)) {
           image(cupcakes [(int)random(0,8)], 3*w,7*w);
      }   
if ( (mousePressed==true) && (mouseX <5*w) && (mouseX >4*w) &&
            (mouseY <8*w) && (mouseY >7*w)) {
           image(cupcakes [(int)random(0,8)], 4*w,7*w);
      }
if ( (mousePressed==true) && (mouseX <6*w) && (mouseX >5*w) &&
            (mouseY <8*w) && (mouseY >7*w)) {
           image(cupcakes [(int)random(0,8)], 5*w,7*w);
}
if (keyPressed){
  for (int x = 0; x < 450; x+=75) {
    for (int y = 0; y < 600; y+=75) {
      image(cupcakes [(int)random(0,8)], x, y);
    }
  }
  
}
}

