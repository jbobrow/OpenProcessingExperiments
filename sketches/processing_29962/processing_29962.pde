
//Click anywhere on the screen to make the lines come out of that point
//Click the squares in the top left of the screen to interact with the program
//X = Stop
//Checkmark = Start
//Nuke = Clear Screen
//Black/White = Toggle between black and white background
//High Red = Mostly Red
//High Green = Mostly Green
//High Blue = Mostly Blue
//Second Last Button = Switch to Mode 2
//Last Button = Switch to Mode 1

int r;
int g;
int b;
int titleopacity = 38;
float clickX = 260;
float clickY = 330;
float X2 = 260;
float Y2 = 330;
boolean phase1 = true;
boolean phase2 = false;
boolean phase3 = false;
boolean phase4 = false;
boolean phase5 = false;
boolean phase6 = false;
boolean stop = false;
boolean clear = false;
boolean black = true;
boolean mode = false;
boolean displaytitle = true;
boolean opacitygoup = true;
PFont title;

void setup() {
  size(520, 590);
  background(0);
  frameRate(60);
  title = loadFont("Arial-Black-36.vlw");  
  println("Mouse over the top of the screen to play with many settings. The first button stops the animation, the second one starts it again, the third one clears the screen. The fourth and fifth ones toggle between a black or white background. The sixth, seventh, and eighth ones allow you to choose how much of RGB you want. Finally, the last two buttons allow you to switch between two different modes in the program. Enjoy; Zac Stevenson.");
}

void draw() {
  if (mousePressed){
    clickX = mouseX;
    clickY = mouseY;
   if (mouseX > 20 && mouseY > 20 && mouseX < 50 && mouseY < 50){
    stop = true;
    }
    if (mouseX > 70 && mouseY > 20 && mouseX < 100 && mouseY < 50){
      clickX = 260;
      clickY = 330;
      X2 = 260;
      Y2 = 330;
      stop = false;
    }
     if (mouseX > 120 && mouseY > 20 && mouseX < 150 && mouseY < 50){
      if (black){
      background(0);
      }else if (!black){
      background(255);
      }
      clickX = 260;
      clickY = 330;
      X2 = 260;
      Y2 = 330;
     }
      if (mouseX > 170 && mouseY > 20 && mouseX < 200 && mouseY < 50){
       if (black){
         black = false;
         background(255);
       }
       clickX = 260;
       clickY = 330;
       X2 = 260;
       Y2 = 330;
      }
       if (mouseX > 220 && mouseY > 20 && mouseX < 250 && mouseY < 50){
        if (!black){
         black = true;
         background(0);
        }
        clickX = 260;
        clickY = 330;
        X2 = 260;
        Y2 = 330;
       }
        if (mouseX > 270 && mouseY > 20 && mouseX < 300 && mouseY < 50){
          phase1 = true;
          phase2 = false;
          phase3 = false;
          phase4 = false;
          phase5 = false;
          phase6 = false;
          clickX = 260;
          clickY = 330;
          X2 = 260;
          Y2 = 330;
          r = 0;
          g = 0;
          b = 0;
        }
        if (mouseX > 320 && mouseY > 20 && mouseX < 350 && mouseY < 50){
          phase1 = false;
          phase2 = false;
          phase3 = true;
          phase4 = false;
          phase5 = false;
          phase6 = false;
          clickX = 260;
          clickY = 330;
          X2 = 260;
          Y2 = 330;
          r = 0;
          g = 0;
          b = 0;
        }
       if (mouseX > 370 && mouseY > 20 && mouseX < 400 && mouseY < 50){
          phase1 = false;
          phase2 = false;
          phase3 = false;
          phase4 = false;
          phase5 = true;
          phase6 = false;
          clickX = 260;
          clickY = 330;
          X2 = 260;
          Y2 = 330;
          r = 0;
          g = 0;
          b = 0;
       }
       if (mouseX > 420 && mouseY > 20 && mouseX < 450 && mouseY < 50){
         clickX = 260;
         clickY = 330;
         X2 = 260;
         Y2 = 330;
         mode = true;
       }
       if (mouseX > 470 && mouseY > 20 && mouseX < 500 && mouseY < 50){
         clickX = 260;
         clickY = 330;
         X2 = 260;
         Y2 = 330;
         mode = false;
       }
     }
  stroke(r, g, b);
  if (!stop){
  if (phase1){
    if (r < 255 && g < 255 && b < 255){
      r = r + 1;
    }else if (r >= 255 && g < 255 && b < 255){
      g = g + 1;
    }else if (r >= 255 && g >= 255 && b < 255){
      b = b + 1;
    }else if (r >= 255 && g >= 255 && b>= 255){
      phase1 = false;
      phase2 = true;
    }
  }else if (phase2){
    if (r >= 255 && g >= 255 && b >= 0){
      b = b - 1;
    }else if (r >= 255 && g >= 0 && b <= 0){
      g = g - 1;
    }else if (r >= 0 && g <= 0 && b <= 0){
      r = r - 1;
    }else if (r <= 0 && g <= 0 && b <= 0){
      phase2 = false;
      phase3 = true;
    }
   }else if (phase3){
     if (r < 255 && g < 255 && b < 255){
      g = g + 1;
    }else if (r < 255 && g >= 255 && b < 255){
      b = b + 1;
    }else if (r < 255 && g >= 255 && b >= 255){
      r = r + 1;
    }else if (r >= 255 && g >= 255 && b >= 255){
      phase3 = false;
      phase4 = true;
    }     
   }else if (phase4){
     if (r >= 0 && g >= 255 && b >= 255){
      r = r - 1;
    }else if (r <= 0 && g >= 255 && b >= 0){
      b = b - 1;
    }else if (r <= 0 && g >= 0 && b <= 0){
      g = g - 1;
    }else if (r <= 0 && g <= 0 && b <= 0){
      phase4 = false;
      phase5 = true;
    } 
   }else if (phase5){
     if (r < 255 && g < 255 && b < 255){
      b = b + 1;
    }else if (r < 255 && g < 255 && b >= 255){
      r = r + 1;
    }else if (r >= 255 && g < 255 && b >= 255){
      g = g + 1;
    }else if (r >= 255 && g >= 255 && b>= 255){
      phase5 = false;
      phase6 = true;
    }    
   }else if (phase6){
     if (r >= 255 && g >= 0 && b >= 255){
      g = g - 1;
    }else if (r >= 0 && g <= 0 && b >= 255){
      r = r - 1;
    }else if (r <= 0 && g <= 0 && b >= 0){
      b = b - 1;
    }else if (r <= 0 && g <= 0 && b <= 0){
      phase6 = false;
      phase1 = true;
    }
   }
   
   
   
   
   
   
   if (mode){
     frameRate(60);
     X2 = X2 + random(-20, 20);
     Y2 = Y2 + random(-20, 20);
     if (X2 > 520){
     X2 = 520;
     }else if (X2 < 0){
     X2 = 0;
     }
     if (Y2 > 590){
     Y2 = 590;
     }else if (Y2 < 70){
     Y2 = 70;
     }
     line(clickX, clickY, X2, Y2);
     clickX = X2;
     clickY = Y2;
     
     
     
   }else if (!mode){
     frameRate(60);
     line(clickX, clickY, random(0, 521), random(70, 591));
   }
}
      
      
      
      
      
      
      
      
      
      
      
      
      if (mouseX > 0 && mouseY > 0 && mouseX < 520 && mouseY < 70){
      displaytitle = false;
    }else{
      displaytitle = true;
    }
      
      if (opacitygoup){
        titleopacity = titleopacity + 1;
      }else if(!opacitygoup){
        titleopacity = titleopacity - 1;
      }
      
      if (titleopacity > 255){
        opacitygoup = false;
      }else if(titleopacity < 38){
       opacitygoup = true;
      }   
      
      
      if (black){
      fill(0);
    }else{
      fill(255);
    }
      rect(0, 0, 519, 70);
      
    textFont (title);
    if (black){
      fill(255, 255, 255, titleopacity);
    }else{
      fill(0, 0, 0, titleopacity);
    }
    if (displaytitle){
    text("PROCESSING", 130, 49);
    }else if (!displaytitle){
      
      
      
      
      
      
      
      
      
      
      
      
    
    stroke(255);   
    fill(0);
    rect(20, 20, 30, 30);
    rect(70, 20, 30, 30);
    rect(120, 20, 30, 30);
    fill(255, 255, 0);
    stroke(0);
    ellipse(135, 35, 25, 25);
    noStroke();
    fill(0);
    triangle(125, 21, 145, 21, 135, 35);
    triangle(135, 35, 150, 40, 143, 50);
    triangle(135, 35, 120, 40, 127, 50);
    fill(255, 255, 0);
    stroke(0);
    ellipse(135, 35, 5, 5);
    stroke(255, 0, 0);
    line(25, 25, 45, 45);
    line(45, 25, 25, 45);
    stroke(0, 255, 0);
    line(75, 35, 85, 45);
    line(95, 25, 85, 45);
    stroke(0);
    fill(255);
    rect(170, 20, 30, 30);
    noFill();
    ellipse(185, 38, 8, 8);
    line(181, 28, 181, 38);
    stroke(255);
    fill(0);
    rect(220, 20, 30, 30);
    noFill();
    ellipse(235, 38, 8, 8);
    line(231, 28, 231, 38);
    fill(0);
    rect(270, 20, 30, 30);
    rect(320, 20, 30, 30);
    rect(370, 20, 30, 30);
    noStroke();
    fill(255, 0, 0);
    rect(272, 28, 8, 22);
    fill(0, 255, 0);
    rect(282, 35, 8, 15);
    fill(0, 0, 255);
    rect(292, 44, 8, 6);
    fill(255, 0, 0);
    rect(322, 44, 8, 6);
    fill(0, 255, 0);
    rect(332, 28, 8, 22);
    fill(0, 0, 255);
    rect(342, 35, 8, 15);
    fill(255, 0, 0);
    rect(372, 35, 8, 15);
    fill(0, 255, 0);
    rect(382, 44, 8, 6);
    fill(0, 0, 255);
    rect(392, 28, 8, 22);
    
    
    stroke(255);
    fill(0);
    rect(420, 20, 30, 30);
    line(423, 44, 430, 35);
    line(430, 35, 445, 44);
    line(445, 44, 437, 25);
    ellipse(430, 35, 4, 4);
    ellipse(445, 44, 4, 4);
    
    
    rect(470, 20, 30, 30);
    line(485, 35, 498, 22);
    line(485, 35, 488, 46);
    line(485, 35, 476, 28);
    ellipse(485, 35, 4, 4);
    
    
    
    
    
    
    fill(103, 97, 97, 120);
    if (mouseX > 20 && mouseY > 20 && mouseX < 50 && mouseY < 50){
    }else{
    rect(20, 20, 30, 30);
    }
    
    if (mouseX > 70 && mouseY > 20 && mouseX < 100 && mouseY < 50){
    }else{
    rect(70, 20, 30, 30);
    }
    
    if (mouseX > 120 && mouseY > 20 && mouseX < 150 && mouseY < 50){
    }else{
    rect(120, 20, 30, 30);
    }
    
    if (mouseX > 170 && mouseY > 20 && mouseX < 200 && mouseY < 50){
    }else{
    rect(170, 20, 30, 30);
    }
    
    if (mouseX > 220 && mouseY > 20 && mouseX < 250 && mouseY < 50){
    }else{
    rect(220, 20, 30, 30);
    }
    
    if (mouseX > 270 && mouseY > 20 && mouseX < 300 && mouseY < 50){
    }else{
    rect(270, 20, 30, 30);
    }
    
    if (mouseX > 320 && mouseY > 20 && mouseX < 350 && mouseY < 50){
    }else{
    rect(320, 20, 30, 30);
    }
    
    if (mouseX > 370 && mouseY > 20 && mouseX < 400 && mouseY < 50){
    }else{
    rect(370, 20, 30, 30);
    }
    
    if (mouseX > 420 && mouseY > 20 && mouseX < 450 && mouseY < 50 || mode){
    }else{
    rect(420, 20, 30, 30);
    }
    
    if (mouseX > 470 && mouseY > 20 && mouseX < 500 && mouseY < 50 || !mode){
    }else{
    rect(470, 20, 30, 30);
    }
    }
}

