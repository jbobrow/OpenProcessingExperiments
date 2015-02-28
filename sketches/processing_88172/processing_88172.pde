
/* @pgs preload="hat.png, personWalk1.png, personWalk2.png, personWalk3.png, personWalk4.png, personWalk5.png, bunnyStart1.png, bunnyStart2.png, bunnyStart3.png, bunnyStart4.png, reveal1.png, reveal2.png, reveal3.png, reveal4.png, end.png";*/

//PImage hatPic;
int numFrames = 16;
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(600, 400);
  //hatPic = loadImage("hat.png");
  //personWalk1Pic = loadImage("personWalk1.png");
  
  frameRate(1);
  images[1] = loadImage("hat.png");
  images[2] = loadImage("personWalk1.png");
  images[3] = loadImage("personWalk2.png");
  images[4] = loadImage("personWalk3.png");
  images[5] = loadImage("personWalk4.png");
  images[6] = loadImage("personWalk5.png");
  images[7] = loadImage("bunnyStart1.png");
  images[8] = loadImage("bunnyStart2.png");
  images[9] = loadImage("bunnyStart3.png");
  images[10] = loadImage("bunnyStart4.png");
  images[11] = loadImage("reveal1.png");
  images[12] = loadImage("reveal2.png");
  images[13] = loadImage("reveal3.png");
  images[14] = loadImage("reveal4.png");
  images[15] = loadImage("end.png");
 
}

void draw() {
  frame = frame + 1;
  
  
  
  background(#20A517);
  
  // for finding the coordinates of the spaces
  print("x: ");
  println(mouseX);
  print("y: ");
  println(mouseY);
  
    pictureFrame(27, 28);
    pictureFrame(212, 147);
    pictureFrame(410, 28);
  
  
  for(float x = 0; x < 600 ; x +=20) {
    fill(162, 90, 31);
    rect(x, 270, 20, 140); 
  }

if (frame == 1) {
  frameRate(1);
  image(images[1], 0, 0);
 
       //loop 1 (lines)
       pushStyle();
       stroke(#DE0985);
      for (int x = 37; x < 100; x += 10) {
        line(x, 42, x+15, 92);
        }
        popStyle();
        
      //loop 2 (whirls)
      pushStyle();
      stroke(#13ED52);
      for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(264, 189, d, d);
      }
      popStyle();
        
        //loop 3 (dots)
        pushStyle();
        stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 50; y < 100; y += 10) {
          for (int x = 430; x < 500; x += 10) {
              point( x, y);
              }
         }
    popStyle();
 
    }


  if (frame == 2) {
    frameRate(2);
    image(images[1], 0, 0);
    image(images[2], 0, 0);
    
    //loop 1 (whirls)
    pushStyle();
    stroke(#13ED52);
    for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(78, 67, d, d);}
       popStyle();
        
    //loop 2 (dots)
    pushStyle();
    stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 170; y < 220; y += 10) {
          for (int x = 235; x < 300; x += 10) {
              point( x, y);
              }
         }
    popStyle();
        
    //loop 3 (lines)
    pushStyle();
    stroke(#DE0985);
    for (int x = 421; x < 500; x += 10) {
        line(x, 42, x+15, 88);}
        popStyle();

  }
  
  if (frame == 3) {
    frameRate(2);
    image(images[1], 0, 0);
    image(images[3], 0, 0);
  
  // loop 1 (dots)   
  pushStyle();
  stroke(#F5EA16);
     strokeWeight(3);
     for (int y = 44; y < 100; y += 10) {
        for (int x = 44; x < 130; x += 10) {
        point( x, y);
    }
  }
  popStyle();
        
    //loop 2 (lines)
    pushStyle();
    stroke(#DE0985);
    for (int x = 226; x < 300; x += 10) {
        line(x, 163, x+15, 211);}
        popStyle();
    
    //loop 3 (whirls)
    pushStyle();
    stroke(#13ED52);
    for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(467, 67, d, d);}
        popStyle();
  }
  
  if (frame == 4) {
    frameRate(2);
    image(images[1], 0, 0);
    image(images[4], 0, 0);
    
     //loop 1 (lines)
     pushStyle();
     stroke(#9B0E60);
      for (int x = 37; x < 100; x += 10) {
        line(x, 42, x+15, 92);
        }
        popStyle();
        
      //loop 2 (whirls)
      pushStyle();
      stroke(#13ED52);
      for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(264, 189, d, d);
      }
      popStyle();
        
        //loop 3 (dots)
        pushStyle();
        stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 50; y < 100; y += 10) {
          for (int x = 430; x < 500; x += 10) {
              point( x, y);
              }
         }
    popStyle();
  }
  
    if (frame == 5) {
    frameRate(2);
    image(images[1], 0, 0);
    image(images[5], 0, 0);
    
    //loop 1 (whirls)
    pushStyle();
    stroke(#13ED52);
    for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(78, 67, d, d);}
        popStyle();
        
    //loop 2 (dots)
    pushStyle();
    stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 170; y < 220; y += 10) {
          for (int x = 235; x < 300; x += 10) {
              point( x, y);
              }
         }
    popStyle();
        
    //loop 3 (lines)
    pushStyle();
    stroke(#9B0E60);
    for (int x = 421; x < 500; x += 10) {
        line(x, 42, x+15, 88);}
        popStyle();
        
  }
  
    if (frame == 6) {
    frameRate(2);
    image(images[1], 0, 0);
    image(images[6], 0, 0);
    
    // loop 1 (dots)   
  pushStyle();
  stroke(#F5EA16);
     strokeWeight(3);
     for (int y = 44; y < 100; y += 10) {
        for (int x = 44; x < 130; x += 10) {
        point( x, y);
    }
  }
  popStyle();
        
    //loop 2 (lines)
    pushStyle();
    stroke(#9B0E60);
    for (int x = 226; x < 300; x += 10) {
        line(x, 163, x+15, 211);}
        popStyle();
    
    //loop 3 (whirls)
    pushStyle();
    stroke(#13ED52);
    for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(467, 67, d, d);}
        popStyle();
  }
  
    if (frame == 7) {
    frameRate(2);
    image(images[7], 0, 0);
    
     //loop 1 (lines)
     pushStyle();
     stroke(#9B0E60);
      for (int x = 37; x < 100; x += 10) {
        line(x, 42, x+15, 92);
        }
        popStyle();
        
      //loop 2 (whirls)
      pushStyle();
      stroke(#13ED52);
      for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(264, 189, d, d);
      }
      popStyle();
        
        //loop 3 (dots)
        pushStyle();
        stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 50; y < 100; y += 10) {
          for (int x = 430; x < 500; x += 10) {
              point( x, y);
              }
         }
    popStyle();
  }
  
    if (frame == 8) {
    frameRate(2);
    image(images[8], 0, 0);
    
    //loop 1 (whirls)
    pushStyle();
    stroke(#13ED52);
    for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(78, 67, d, d);}
        popStyle();
        
    //loop 2 (dots)
    pushStyle();
    stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 170; y < 220; y += 10) {
          for (int x = 235; x < 300; x += 10) {
              point( x, y);
              }
         }
    popStyle();
        
    //loop 3 (lines)
    pushStyle();
    stroke(#9B0E60);
    for (int x = 421; x < 500; x += 10) {
        line(x, 42, x+15, 88);}
        popStyle();
        
  }
  
  if (frame == 9) {
    frameRate(2);
    image(images[9], 0, 0);
    
     // loop 1 (dots)   
  pushStyle();
  stroke(#F5EA16);
     strokeWeight(3);
     for (int y = 44; y < 100; y += 10) {
        for (int x = 44; x < 130; x += 10) {
        point( x, y);
    }
  }
  popStyle();
        
    //loop 2 (lines)
    pushStyle();
    stroke(#9B0E60);
    for (int x = 226; x < 300; x += 10) {
        line(x, 163, x+15, 211);}
        popStyle();
    
    //loop 3 (whirls)
    pushStyle();
    stroke(#13ED52);
    for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(467, 67, d, d);}
        popStyle();
        
  }
  
  if (frame == 10) {
    frameRate(2);
    image(images[10], 0, 0);
    
     //loop 1 (lines)
     pushStyle();
     stroke(#9B0E60);
      for (int x = 37; x < 100; x += 10) {
        line(x, 42, x+15, 92);
        }
        popStyle();
        
      //loop 2 (whirls)
      pushStyle();
      stroke(#13ED52);
      for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(264, 189, d, d);
      }
      popStyle();
        
        //loop 3 (dots)
        pushStyle();
        stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 50; y < 100; y += 10) {
          for (int x = 430; x < 500; x += 10) {
              point( x, y);
              }
         }
    popStyle();
    
  }
  
  if (frame == 11) {
    frameRate(2);
    image(images[11], 0, 0);
    
  // loop 1 (dots)   
  pushStyle();
  stroke(#F5EA16);
     strokeWeight(3);
     for (int y = 44; y < 100; y += 10) {
        for (int x = 44; x < 130; x += 10) {
        point( x, y);
    }
  }
  popStyle();
        
    //loop 2 (lines)
    pushStyle();
    stroke(#9B0E60);
    for (int x = 226; x < 300; x += 10) {
        line(x, 163, x+15, 211);}
        popStyle();
    
    //loop 3 (whirls)
    pushStyle();
    stroke(#13ED52);
    for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(467, 67, d, d);}
        popStyle();
        
  }
  
  if (frame == 12) {
    frameRate(2);
    image(images[12], 0, 0);
    
     //loop 1 (lines)
     pushStyle();
     stroke(#9B0E60);
      for (int x = 37; x < 100; x += 10) {
        line(x, 42, x+15, 92);
        }
        popStyle();
        
      //loop 2 (whirls)
      pushStyle();
      stroke(#13ED52);
      for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(264, 189, d, d);
      }
      popStyle();
        
        //loop 3 (dots)
        pushStyle();
        stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 50; y < 100; y += 10) {
          for (int x = 430; x < 500; x += 10) {
              point( x, y);
              }
         }
    popStyle();
 
  }
  
  if (frame == 13) {
    frameRate(2);
    image(images[13], 0, 0);
    
    //loop 1 (whirls)
    pushStyle();
    stroke(#13ED52);
    for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(78, 67, d, d);}
        popStyle();
        
    //loop 2 (dots)
    pushStyle();
    stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 170; y < 220; y += 10) {
          for (int x = 235; x < 300; x += 10) {
              point( x, y);
              }
         }
    popStyle();
        
    //loop 3 (lines)
    pushStyle();
    stroke(#9B0E60);
    for (int x = 421; x < 500; x += 10) {
        line(x, 42, x+15, 88);}
        popStyle();
        
  }
  
  if (frame == 14) {
    frameRate(2);
    image(images[14], 0, 0);
    
     // loop 1 (dots)   
  pushStyle();
  stroke(#F5EA16);
     strokeWeight(3);
     for (int y = 44; y < 100; y += 10) {
        for (int x = 44; x < 130; x += 10) {
        point( x, y);
    }
  }
  popStyle();
        
    //loop 2 (lines)
    pushStyle();
    stroke(#9B0E60);
    for (int x = 226; x < 300; x += 10) {
        line(x, 163, x+15, 211);}
        popStyle();
    
    //loop 3 (whirls)
    pushStyle();
    stroke(#13ED52);
    for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(467, 67, d, d);}
        popStyle();
  }
  
  if (frame == 15) {
    frameRate(.0001);
    image(images[15], 0, 0);
    
     //loop 1 (lines)
     pushStyle();
     stroke(#9B0E60);
      for (int x = 37; x < 100; x += 10) {
        line(x, 42, x+15, 92);
        }
        popStyle();
        
      //loop 2 (whirls)
      pushStyle();
      stroke(#13ED52);
      for(int d = 50; d > 0; d -= 10) {
        noFill();
        ellipse(264, 189, d, d);
      }
      popStyle();
        
        //loop 3 (dots)
        pushStyle();
        stroke(#F5EA16);
        strokeWeight(3);
        for (int y = 50; y < 100; y += 10) {
          for (int x = 430; x < 500; x += 10) {
              point( x, y);
              }
         }
    popStyle();
  }
  
  
  
  //image(hatPic, 0, 0);

  
  
}


/*for (int i = 20; i < 150; i += 10) {
  line(i, 20, i, 190);
}*/

void pictureFrame(int x, int y) {
  //rotate(
  fill(#FF7A15);
  rect(x, y, 110, 80);
  fill(#14B6E0);
  rect(x+7, y+10, 95, 60);
}




