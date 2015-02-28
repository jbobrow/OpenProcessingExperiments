
int loopno = 0;

void setup() {
  size(600, 600);
  background(random(256), random(256), random(256));
  colorMode(RGB, 256);
  PFont picfont;
  picfont = loadFont("MatisseITC-Regular-48.vlw");
  textFont(picfont, 40);
  }



  void draw () {
 
    //  for (int x=0;x<width;x++){
    //    stroke(random(256),random(256),random(256));
    //    line(x,0,x,width);
    //  }

    //for(int i=2; i<width-2; i+=2) {
    //  // If 'i' divides by 20 with no remainder 
    //  // draw the first line else draw the second line
    //  if(i%20 == 0) {
    //    stroke(random(256));
    //    line(40, i, width/2, i);
    //  } else if (i%10 == 0) {
    //    stroke(random (256));
    //    line(20, i, 180, i); 
    //  } else {
    //    stroke(random(256));
    //    line(width/2, i, width-40, i);
    //  }
    //}


    for (int a=0; a<width;a = a+40) {
      for (int b=0;b<width;b=b+40) {
        stroke(random(256), random(256), random(256), random(120));
        strokeWeight(random(50));
        float g = random(80);
        if  (g > 40) {
          point(a, b);
        }
      }
    }
    

    
    for (int n=0;n<random(300);n++) {

      float rand = random(1, 4);
      int rand2 = int(rand);

      if (rand2 == 1) {
        drawrectangle();
      }
      if (rand2==2) {  
        drawcircle();
      }
      if (rand2==3) {
        drawtri();
      }
      loopno = n;
    }  

    if (loopno<20) {
      fill(random(256));
      text("QUIET", width/2.3, 50);
    }
    else if (loopno>=20 && loopno<=150) {
      fill(random(256));
      text("AVERAGE", width/2.3, 50);
    }
    else if (loopno>150) {
      fill(random(256));
      text("BUSY", width/2.3, 50);
    }

    noLoop();
  }

void drawrectangle() {
  //strokeWeight(random(2));
  //stroke(random(256), random(256), random(256));
  fill (random(256), random(256), random(256), random(120));
  rect(random(601), random(601), random(20, 100), random(20, 100));
}

void drawcircle() {
  noStroke();
  fill (random(256), random(256), random(256), random(120));
  ellipse(random(300), random(300), random(20, 100), random(20, 100));
}

void drawtri() {
  noStroke();
  fill (random(256), random(256), random(256), random(120));
  triangle(random(500), random(500), random(500), random(500), random(500), random(500));
}


