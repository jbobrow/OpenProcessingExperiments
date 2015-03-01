
PImage p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10;
PImage [] picArray = new PImage[11];

int counter=0;
float alpha1=0;
float alpha2=0; 
int who = 0; 


void setup() { 
  size(630, 480);
  p0 = loadImage("1.png");
  p1 = loadImage("2.png");
  p2 = loadImage("3.png");
  p3 = loadImage("4.png");
  p4 = loadImage("5.png");
  p5 = loadImage("6.png");
  p6 = loadImage("7.png");
  p7 = loadImage("8.png");
  p8 = loadImage("9.png");
  p9 = loadImage("10.png");

  picArray[0] = p0;
  picArray[1] = p1;
  picArray[2] = p2;
  picArray[3] = p3;
  picArray[4] = p4;
  picArray[5] = p5;
  picArray[6] = p6;
  picArray[7] = p7;
  picArray[8] = p8;
  picArray[9] = p9;
  picArray[10] = p10;

  smooth();
}

void draw () { 
  background(255);
  loadPixels();
  if (who == 0) {
    drawKaren(); 
  } else if (who == 9) {
    //draw somebody else
  }
 

  
}

void keyPressed() {
  if (who < 9) {
    who++; 
  } else {
    who = 0; 
  } 
  println(who);
} 

void drawKaren() {
  if (counter < 500) {   
    counter ++;
  } else {
    counter = 0; 
  }
  
  if (counter <= 50) {
    alpha1 = map(counter, 0, 50, 255, 0);
    alpha2 = map(counter, 0, 50, 0, 255);
    draw0(alpha1);
    draw1(alpha2);
  } else if (counter > 50 && counter <= 100) {
    alpha1 = map(counter, 50, 100, 255, 0);
    alpha2 = map(counter, 50, 100, 0, 255);
    draw1(alpha1);
    draw2(alpha2);
  } else if (counter > 100 && counter <= 150) {
    alpha1 = map(counter, 100, 150, 255, 0);
    alpha2 = map(counter, 100, 150, 0, 255);
    draw2(alpha1);
    draw3(alpha2);
  } else if (counter > 150 && counter <= 200) {
    alpha1 = map(counter, 150, 200, 255, 0);
    alpha2 = map(counter, 150, 200, 0, 255);
    draw3(alpha1);
    draw4(alpha2);
   } else if (counter > 100 && counter <= 150) {
    alpha1 = map(counter, 0, 50, 255, 0);
    alpha2 = map(counter, 0, 50, 0, 255);
    draw4(alpha1);
    draw5(alpha2);
   } else if (counter > 100 && counter <= 150) {
    alpha1 = map(counter, 100, 150, 255, 0);
    alpha2 = map(counter, 100, 150, 0, 255);
    draw5(alpha1);
    draw6(alpha2);
  } else if (counter > 50 && counter <= 100) {
    alpha1 = map(counter, 50, 100, 255, 0);
    alpha2 = map(counter, 50, 100, 0, 255);
    draw6(alpha1);
    draw7(alpha2);
   } else if (counter > 100 && counter <= 150) {
    alpha1 = map(counter, 100, 150, 255, 0);
    alpha2 = map(counter, 100, 150, 0, 255);
    draw7(alpha1);
    draw8(alpha2);
     } else if (counter > 150 && counter <= 200) {
    alpha1 = map(counter, 150, 200, 255, 0);
    alpha2 = map(counter, 150, 200, 0, 255);
    draw8(alpha1);
    draw9(alpha2);
   } else if (counter > 100 && counter <= 150) {
    alpha1 = map(counter, 100, 150, 255, 0);
    alpha2 = map(counter, 100, 150, 0, 255);
    draw8(alpha1);
    draw0(alpha2);
}
}



void draw0(float a) {
  for (int y = 0; y < p0.height; y+=10 ) {
    //jump 10px from x
    for (int x = 0; x < p0.width+5; x+=10) {
      // calculate location
      int loc = x + y*p0.width;
      stroke(p0.pixels[loc], a);
      fill(200, 150, 200, a);
      if (x %20 == 0) triangle(x-5, y, x, y+10, x+5, y);
      else triangle(x-5, y+10, x, y, x+5, y+10);
    }
  }
} 
void draw1(float a) {
  //picArray1
  //jump 10px from y
  for (int y = 0; y < p1.height; y+=5 ) {
    //jump 10px from x
    for (int x = 0; x < p1.width+5; x+=10) {
      // calculat location
      int loc = x + y*p1.width;
      stroke(100, 100, 200, a);
      fill(p1.pixels[loc], a);
      if (x %25 == 0) triangle(x-10, y, x, y+5, x+10, y);
      else triangle(x-10, y+5, x, y, x+10, y+5);
    }
  }
} 
void draw2(float a) {
  //picArray2
  //jump 10px from y
  for (int y = 0; y < p2.height; y+=10 ) {
    //jump 10px from x
    for (int x = 0; x < p2.width+5; x+=10) {
      // calculat location
      int loc = x + y*p2.width;
      stroke(p2.pixels[loc], a);
      fill(120, 150, 200, a);
      if (x %10 == 0) triangle(x-10, y, x, y+10, x+10, y);
      else triangle(x-10, y+10, x, y, x+10, y+10);
    }
  }
} 
void draw3(float a) {
  //picArray3
  //jump 10px from y
  for (int y = 0; y < p3.height; y+=12) {
    //jump 10px from x
    for (int x = 0; x < p3.width+5; x+=5) {
      // calculat location
      int loc = x + y*p3.width;
      stroke(p3.pixels[loc], a);
      fill(90, 150, 200, a);
      if (x %30 == 0) triangle(x-5, y, x, y+12, x+5, y);
      else triangle(x-5, y+12, x, y, x+5, y+12);
    }
  }
} 
void draw4(float a) {
  //picArray4
  //jump 10px from y
  for (int y = 0; y < p4.height; y+=5 ) {
    //jump 10px from x
    for (int x = 0; x < p4.width+5; x+=12) {
      // calculat location
      int loc = x + y*p4.width;
      stroke(p4.pixels[loc], a);
      fill(200, 100, 200, a);
      if (x %10 == 0) triangle(x-12, y, x, y+10, x+12, y);
      else triangle(x-12, y+10, x, y, x+12, y+10);
    }
  }
} 
void draw5(float a) {
  //picArray5
  //jump 10px from y
  for (int y = 0; y < p5.height; y+=10 ) {
    //jump 10px from x
    for (int x = 0; x < p5.width+5; x+=9) {
      // calculat location
      int loc = x + y*p5.width;
      stroke(200, 40, 160, a);
      fill(p5.pixels[loc], a);
      if (x %10 == 0) triangle(x-9, y, x, y+10, x+9, y);
      else triangle(x-9, y+10, x, y, x+9, y+10);
    }
  }
} 
void draw6(float a) {
  //picArray6
  //jump 10px from y
  for (int y = 0; y < p6.height; y+=3) {
    //jump 10px from x
    for (int x = 0; x < p6.width+5; x+=15) {
      // calculat location
      int loc = x + y*p6.width;
      stroke(p6.pixels[loc], a);
      fill(255, 200, 200, a);
      if (x %10 == 0) triangle(x-5, y, x, y+10, x+5, y);
      else triangle(x-5, y+10, x, y, x+5, y+10);
    }
  }
} 
void draw7(float a) {
  //picArray7
  for (int y = 0; y < p7.height; y+=8 ) {
    //jump 10px from x
    for (int x = 0; x < p7.width+5; x+=10) {
      // calculat location
      int loc = x + y*p7.width;
      stroke(p7.pixels[loc], a);
      fill(255, 255, 150, a);
      if (x %20 == 0) triangle(x-5, y, x, y+8, x+5, y);
      else triangle(x-5, y+8, x, y, x+5, y+8);
    }
  }
} 
void draw8(float a) {
  //picArray8
  //jump 10px from y
  for (int y = 0; y < p8.height; y+=13 ) {
    //jump 10px from x
    for (int x = 0; x < p8.width+5; x+=4) {
      // calculat location
      int loc = x + y*p8.width;
      stroke(200, 255, 110, a);
      fill(p8.pixels[loc], a);
      if (x %10 == 0) triangle(x-4, y, x, y+13, x+4, y);
      else triangle(x-4, y+13, x, y, x+4, y+13);
    }
  }
} 
void draw9(float a) {
  //picArray9
  //jump 10px from y
  for (int y = 0; y < p9.height; y+=11 ) {
    //jump 10px from x
    for (int x = 0; x < p9.width+5; x+=7) {
      // calculat location
      int loc = x + y*p9.width;
      stroke(p9.pixels[loc], a);
      fill(255, 200, 50, a);
      if (x %15 == 0) triangle(x-7, y, x, y+10, x+7, y);
      else triangle(x-7, y+10, x, y, x+7, y+10);
    }
  }
} 



