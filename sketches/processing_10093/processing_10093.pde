
PFont font;

int mouseclick = 0;

void setup(){
  size(600,600); 
  background(255);
  noStroke();
  ellipseMode(RADIUS);
  smooth();
  font = loadFont("HelveticaLTStd-BlkCond-48.vlw");
  textFont(font);
}

void draw(){
 if (mouseclick == 0){
    fill(255);
    rect(0,0,width,height);
    textAlign(CENTER);
    fill(0);
    text("1-10", width/2,height/2);
    fill(100,50);
    text("click left mouse button", width/2,height/2);
  }

  if (mouseclick == 1){
    fill(255);
    rect(0,0,width,height);
    fill(0);
    circle(width/2, height/2, 50);
    fill(255,150);
    text("1", width/2,(height/2)+16);
  }

  if (mouseclick == 2){
    fill(255);
    rect(0,0,width,height);
    fill(0);
    circle(width/2, height/2, 50);
    circle(width/4, height/2, 50);
    circle((width/4)*3, height/2, 50);
    fill(200,150);
    text("2", width/2,(height/2)+16);
  }

  if (mouseclick == 3){
    fill(255);
    rect(0,0,width,height);
    fill(0);
    for (int i = 0; i <= 600; i+= 150){
      for (int j = 0; j <= 600; j+= 150){
        circle(i, j, 50);
      }
    }   
    fill(175,150);
    text("3", width/2,(height/2)+16);
  }

  if (mouseclick ==4){
    fill(255);
    rect(0,0,width,height);
    fill(0);
    for (int i = 0; i <= 600; i+= 150){
      for (int j = 0; j <= 600; j+= 150){
        circle(i, j, int(random(100)));
        noLoop();
      }
    }   
    fill(150,150);
    text("4", width/2,(height/2)+16);
  }

  if (mouseclick == 5){
    loop();
    fill(255);
    rect(0,0,width,height);
    fill(0);
    for (int i = 0; i <= 600; i+= 150){
      for (int j = 0; j <= 600; j+= 150){
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        noLoop();
      }
    }
    fill(125,150);
    text("5", width/2,(height/2)+16);
  }

  if (mouseclick == 6){
    loop();
    fill(175);
    rect(0,0,width,height);
    for (int i = 0; i <= 600; i+= 150){
      for (int j = 0; j <= 600; j+= 150){
        fill(random(255),200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(random(255),200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(random(255),200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(random(255),200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        noLoop();
      }
    }
    fill(100,150);
    text("6", width/2,(height/2)+16);
  }


  if (mouseclick == 7){
    loop();
    fill(125);
    rect(0,0,width,height);
    for (int i = 0; i <= 600; i+= 150){
      for (int j = 0; j <= 600; j+= 150){
        fill(255,random(255),100,150);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(255,random(255),100,150);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(255,random(255),100,150);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(255,random(255),100,150);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(255,random(255),100,150);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(255,random(255),100,150);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(255,random(255),100,150);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        noLoop();
      }
    }
    fill(75,150);
    text("7", width/2,(height/2)+16);
  }


  if (mouseclick == 8){
    loop();
    fill(75);
    rect(0,0,width,height);
    for (int i = 0; i <= 600; i+= 150){
      for (int j = 0; j <= 600; j+= 150){
        fill(225,56,119,200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(43,141,140,200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(70,94,146,200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(246,209,40,200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(70,130,11,200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(255,84,61,200);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        noLoop();
      }
    }
    fill(50,150);
    text("8", width/2,(height/2)+16);
  }

  if (mouseclick == 9){
    frameRate(5);
    loop();
    fill(0,10);
    rect(0,0,width,height);
    for (int i = 0; i <= 600; i+= 150){
      for (int j = 0; j <= 600; j+= 150){
        fill(225,56,119,random(100));
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(43,141,140,random(100));
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(70,94,146,random(100));
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(246,209,40,random(100));
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(70,130,11,random(100));
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(255,84,61,random(100));
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
      }
    }
    fill(25,150);
    text("9", width/2,(height/2)+16);
  }

  if (mouseclick == 10){
    frameRate(5);
    loop();
    fill(255,30);
    rect(0,0,width,height);
    for (int i = 0; i <= 600; i+= 150){
      for (int j = 0; j <= 600; j+= 150){
        fill(225,56,119,10);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(43,141,140,10);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(70,94,146,10);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(246,209,40,10);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(70,130,11,10);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
        fill(255,84,61,10);
        circle(i+int(random(100)), j+int(random(100)), int(random(100)));
      }
    }
    fill(255,25);
    text("the end", width/2,(height/2)+16);
    fill(0,150);
    text("10", width/2,(height/2)+16);
  }
}

void mousePressed(){
  mouseclick += 1;
if (mouseclick ==0){
    loop();
  }
if (mouseclick ==1){
    loop();
  }
if (mouseclick ==2){
    loop();
  }
if (mouseclick ==3){
    loop();
  }
if (mouseclick ==4){
    loop();
  }
if (mouseclick ==5){
    loop();
  }
  if (mouseclick ==5){
    loop();
  }
  if (mouseclick ==6){
    loop();
  }
  if (mouseclick ==7){
    loop();
  }
  if (mouseclick ==8){
    loop();
  }
  if (mouseclick ==9){
    loop();
  }
  if (mouseclick ==10){
    loop();
  }
  if (mouseclick ==11){
    loop();
    mouseclick = 0;
  }
}

void circle(int x,int y,int rad){
  ellipse(x,y,rad,rad);
}

