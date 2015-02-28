

PImage photo;
float a = 0;

void setup() {
  background(#FBFBFB);
  size (960, 600);
  String url= "http://media-cache-ak0.pinimg.com/originals/57/ab/c7/57abc71fd5c8ca4096068efaf29702a0.jpg";
  photo = loadImage(url,"jpg"); //500x400
}

void draw() {
  noStroke();
  fill(255, 5);
  rect(0,0, width-26, 34);
  //fast moving animation
  //copy(photo, x, y, w, height, CopyLocx, CopyLocy, CopyW, CopyH) 
  copy(photo, 50, int(random(50, 200)), 13, 17, 0, 50, 13, 17); //center row


  int sy = int(map(noise(a), 0, 1, 0, height));
  int sx = int(map(noise(a), 0, 1, 0, width));
  int sw = int(map(noise(a+150), 0, 1, 50, 400));
  int sh = int(map(noise(a-40), 0, 1, 50, 300));
  int sx1 = int(map(noise(a-10), 0, 1, 0, photo.width));
  int sy1 = int(map(noise(a+50), 0, 1, 0, photo.height));



  copy(photo, width/5+5, sy, 13, 17, (width/2)+50, 160, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/5+5, sy, 13, 17, (width/2)-150, 260, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/2+5, sy, 13, 17, width/2-50, 200, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, sx, height/2+13, 13, 17, width/2-100, 200, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, sx, height/3+4, 13, 17, width/2, 200, 26, 34); //source
  a = a + 0.01; //animate
  if (key=='a'){
    a=0;
  }else if (key=='s'){
    a=.1;
     }else if (key=='d'){
    a=.2;
     }else if (key=='f'){
    a=.3;
       }else if (key=='g'){
    a=.6;
  }else if (key=='h'){
    a=1;
  }else if (key=='j'){
    a=-3;
  }else if (key=='l'){
    a=10;
  }else if (key=='q'){
    a=-10;
  }else if (key=='w'){
    a=-20;
  }
  else if (key=='e'){
    a*=50;
  }else if (key=='k'){
    a*=-100;
  }
  else if (key=='r'){
    a=-50;
  }else if (key=='t'){
    a/=-1;
  }
    else if (key=='y'){
    a/=-1.2;
  }
  
    else if (key=='u'){
    a/=-.5;
  }
    else if (key=='i'){
    a/=-1.9;
  }
  else if (key=='o'){
    a=-50;
  }



  copy(photo, width/5+5, sx1, 13, 17, int (random(100)), height-34, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/5+5, sy1, 13, 17, int (random(120, 250)), height-34, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/5+5, sh, 13, 17, int (random(270, 380)), height-34, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/3+5, sw, 13, 17, int (random(400, 600)), height-34, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/5+5, sh, 13, 17, int (random(620, 950)), height-34, 26, 34); //source
  a = a + 0.01; //animate

  copy(photo, width/5+5, sx1+sy1, 13, 17, int (random(100)), 0, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/5+5, sy1+sx1, 13, 17, int (random(120, 250)), 0, 26, 34); //source
  a = a + 0.01; //animate  
  copy(photo, width/5+5, sh+sx1, 13, 17, int (random(270, 380)), 0, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/3+5, sw+sy1, 13, 17, int (random(400, 600)), 0, 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/5+5, sh+sw, 13, 17, int (random(620, 950)), 0, 26, 34); //source
  a = a + 0.01; //animate




  copy(photo, sx1, height/2, 13, 17, 0, int (random(100)), 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, sy1, height/2, 13, 17, 0, int (random(120, 250)), 26, 34); //source
  a = a + 0.01; //animate  
  copy(photo, width/5+5, sh, 13, 17, 0, int (random(270, 380)), 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/3+5, sw+sy1, 13, 17, 0, int (random(400, 600)), 26, 34); //source
  a = a + 0.01; //animate


  copy(photo, width/2, sx, 13, 17, width-26, int (random(100)), 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, width/2, sx, 13, 17, width-26, int (random(120, 250)), 26, 34); //source
  a = a + 0.01; //animate  
  copy(photo, sh, height/3, 13, 17, width-26, int (random(270, 380)), 26, 34); //source
  a = a + 0.01; //animate
  copy(photo, sh, height/3, 13, 17, width-26, int (random(400, 600)), 26, 34); //source
  a = a + 0.1; //animate
}

void keyPressed() {

  if (key=='p' || key=='P') { // press p to pause movement 
    noLoop();
  }
}


void keyReleased() {
  loop();
}

