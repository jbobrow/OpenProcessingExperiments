
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;

void setup() {
  size(640,480);
  smooth();
  
  one = loadImage("one.png");
  two = loadImage("two.png");
  three = loadImage("three.png");
  four = loadImage("four.png");
  five = loadImage("five.png");
  six = loadImage("six.png");
}

void draw() {
  pushMatrix();
  if((mouseX >= 0) && (mouseX <= 64)){
    background(108, 255, 188);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX >= 64) && (mouseX <= 128)){
    background(110, 255, 110);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX >= 128) && (mouseX <= 192)){
    background(199, 255, 110);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX >= 192) && (mouseX <= 256)){
    background(252, 252, 112);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX >= 256) && (mouseX <= 320)){
    background(249, 223, 112);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX >= 320) && (mouseX <= 384)){
    background(249, 193, 112);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX >= 384) && (mouseX <= 448)){
    background(249, 145, 112);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX >= 448) && (mouseX <= 512)){
    background(255, 164, 199);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX >= 512) && (mouseX <= 576)){
    background(231, 134, 252);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX >= 576) && (mouseX <= 640)){
    background(119, 196, 247);
  }
  popMatrix();


//ROOTS////////////////////////////////////////////////////////////////
  pushMatrix();
  if((mouseX >= 0) && (mouseX <= 53)){
    scale(0.4);
    image(one, 205, 560);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX > 53) && (mouseX <= 106)){
    scale(0.5);
    image(two, 144, 375);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX > 106) && (mouseX <= 159)){
    scale(0.4);
    image(three, 238, 542);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX > 159) && (mouseX <= 212)){
    scale(0.4);
    image(four, 255, 553);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX > 212) && (mouseX <= 265)){
    scale(0.4);
    image(five, 300, 550);
  }
  popMatrix();
  
  pushMatrix();
  if((mouseX > 265) && (mouseX <= 320)){
    scale(0.4);
    image(six, 400, 550);
  }
  popMatrix();




//SNOWFLAKE////////////////////////////////////////////////////////////
//  if ((mouseX >= 320) && (mouseX <= 360)) {
//    translate(width/2, ((height/2)-5));
//    rotate(radians(180));
//    snow(0,0,0);
//  }
if((mouseX >= 360) && (mouseX <= 400)){
  pushMatrix();
    translate(width/2, ((height/2)-5));
    rotate(radians(180));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);
    popMatrix();
  }
  else if((mouseX >= 400) && (mouseX <= 440)){
    pushMatrix();
    translate(width/2, ((height/2)-5));
    rotate(radians(180));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);
    popMatrix();
  }
  else if((mouseX >= 440) && (mouseX <= 480)){
    pushMatrix();
    translate(width/2, ((height/2)-5));
    rotate(radians(180));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);
    popMatrix();
  }
  else if((mouseX >= 480) && (mouseX <= 520)){
    pushMatrix();
    translate(width/2, ((height/2)-5));
    rotate(radians(180));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);
    popMatrix();
  }
  else if((mouseX >= 520) && (mouseX <= 560)){
    pushMatrix();
    translate(width/2, ((height/2)-5));
    rotate(radians(180));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);
    popMatrix();
  }
  else if((mouseX >= 560) && (mouseX <= 600)){
    pushMatrix();
    translate(width/2, ((height/2)-5));
    rotate(radians(180));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);
    popMatrix();
  }
  else if((mouseX >= 600) && (mouseX <= 640)){
    pushMatrix();
    translate(width/2, ((height/2)-5));
    rotate(radians(180));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);

    rotate(radians(45));
    snow(0,0,0);
    popMatrix();
  }
  //TREE/////////////////////////////////////////////////////////////////
    pushMatrix();
    
    translate(width/2, ((height/2)-5));
      rotate(radians(180));
      snow(0, 0, 0);
    
    if ((mouseX >= 0) && (mouseX <= 29)){
    leaf(0, 110, 50, 50, 60, 200);
    leaf(40, 110, 60, 60, 60, 200);
    leaf(40, 140, 50, 50, 60, 200);
    leaf(30, 180, 40, 40, 60, 200);
    leaf(-30, 180, 60, 60, 60, 200);
    leaf(-40, 140, 60, 60, 60, 200);
    leaf(0, 140, 50, 50, 60, 200);
    leaf(-35, 100, 48, 48, 60, 200);
    leaf(10, 180, 40, 40, 60, 200);
    leaf(5, 210, 50, 50, 60, 200);
    }
    else if ((mouseX >= 29) && (mouseX <= 58)){
    leaf(0, 110, 50, 50, 60, 200);
    leaf(40, 110, 60, 60, 60, 200);
    leaf(40, 140, 50, 50, 60, 200);
    leaf(30, 180, 40, 40, 60, 200);
    leaf(-30, 180, 60, 60, 60, 200);
    leaf(0, 140, 50, 50, 60, 200);
    leaf(-35, 100, 48, 48, 60, 200);
    leaf(10, 180, 40, 40, 60, 200);
    leaf(5, 210, 50, 50, 60, 200);
    }
    else if ((mouseX >= 58) && (mouseX <= 87)){
    leaf(0, 110, 50, 50, 60, 200);
    leaf(40, 110, 60, 60, 60, 200);
    leaf(40, 140, 50, 50, 60, 200);
    leaf(-30, 180, 60, 60, 60, 200);
    leaf(0, 140, 50, 50, 60, 200);
    leaf(-35, 100, 48, 48, 60, 200);
    leaf(10, 180, 40, 40, 60, 200);
    leaf(5, 210, 50, 50, 60, 200);
    }
    else if ((mouseX >= 87) && (mouseX <= 116)){
    leaf(0, 110, 50, 50, 60, 200);
    leaf(40, 110, 60, 60, 60, 200);
    leaf(40, 140, 50, 50, 60, 200);
    leaf(-30, 180, 60, 60, 60, 200);
    leaf(0, 140, 50, 50, 60, 200);
    leaf(-35, 100, 48, 48, 60, 200);
    leaf(10, 180, 40, 40, 60, 200);
    }
    else if ((mouseX >= 116) && (mouseX <= 145)){
    leaf(0, 110, 50, 50, 60, 200);
    leaf(40, 140, 50, 50, 60, 200);
    leaf(-30, 180, 60, 60, 60, 200);
    leaf(0, 140, 50, 50, 60, 200);
    leaf(-35, 100, 48, 48, 60, 200);
    leaf(10, 180, 40, 40, 60, 200);
    }
    else if ((mouseX >= 145) && (mouseX <= 174)){
    leaf(0, 110, 50, 50, 60, 200);
    leaf(40, 140, 50, 50, 60, 200);
    leaf(-30, 180, 60, 60, 60, 200);
    leaf(0, 140, 50, 50, 60, 200);
    leaf(10, 180, 40, 40, 60, 200);
    }
    else if ((mouseX >= 174) && (mouseX <= 203)){
    leaf(0, 110, 50, 50, 60, 200);
    leaf(40, 140, 50, 50, 60, 200);
    leaf(0, 140, 50, 50, 60, 200);
    leaf(10, 180, 40, 40, 60, 200);
    }
    else if ((mouseX >= 203) && (mouseX <= 232)){
    leaf(0, 110, 50, 50, 60, 200);
    leaf(40, 140, 50, 50, 60, 200);
    leaf(10, 180, 40, 40, 60, 200);
    }
    else if ((mouseX >= 232) && (mouseX <= 261)){
    leaf(0, 110, 50, 50, 60, 200);
    leaf(40, 140, 50, 50, 60, 200);
    }
    else if ((mouseX >= 261) && (mouseX <= 290)){
    leaf(40, 140, 50, 50, 60, 200);
    }
    else if ((mouseX >= 290) && (mouseX <= 320)){
    leaf(40, 140, 50, 50, 60, 200);
    }
  popMatrix();
}


void snow(int x, int y, int f) {
  strokeWeight(15);
  strokeCap(SQUARE);
  fill(f);
  line(x, y-10, x, 215);
  line(x, y+140, x-40, y+180);
  line(x, y+140, x+40, y+180);
  strokeWeight(13);
  line(x, y+100, x+30, y+125);
  line(x, y+100, x-30, y+125);
}

void leaf(int x, int y, int xsize, int ysize, int c, int t){
  fill(c, t);
  noStroke();
  ellipse(x, y, xsize, ysize);
  stroke(0);
}

