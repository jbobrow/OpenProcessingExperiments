
//this needs at least 60 image files named "screen-0001.tif" to "screen-0060.tif" to work with images

int i = 1;
int loop = 1;
float x = 0;
int a;
int b = 0;
PImage[] tree = new PImage[62]; //use .png

void setup () {
  size(800, 800);
  //for(int A = 1; A < tree.length; A++) {
    //String imageName = "screen-" + nf(A, 4) + ".tif";
    //tree[A - 1] = loadImage(imageName);
  //}
}

void draw () {
  b = 0;
  //image(tree[i], 0, 0);
  background(i * 4);
 rect(width/2 - 300, height - 45, 600, 15);
 for(a = width/2 -300; a < width/2 + 300; a = a + 10){
   
   fill(b);
   b = b + 4;
   rect(a, height - 45, 10, 15);
 }
 
  if(mouseX < width/2 + 300 && mouseX > width/2 - 300 && mouseY > height - 55 && mouseY < height - 20 && loop == 1) {
    rect(mouseX - 5, height - 55, 10, 35);
    if(mouseX > width/2 - 300 && mouseX < width/2 - 290) {
      i = 1;
    } else if(mouseX > width/2 - 290 && mouseX < width/2 - 280) {
      i = 2;
    } else if(mouseX > width/2 - 280 && mouseX < width/2 - 270) {
      i = 3;
    } else if(mouseX > width/2 - 270 && mouseX < width/2 - 260) {
      i = 4;
    } else if(mouseX > width/2 - 260 && mouseX < width/2 - 250) {
      i = 5;
    } else if(mouseX > width/2 - 250 && mouseX < width/2 - 240) {
      i = 6;
    } else if(mouseX > width/2 - 240 && mouseX < width/2 - 230) {
      i = 7;
    } else if(mouseX > width/2 - 230 && mouseX < width/2 - 220) {
      i = 8;
    } else if(mouseX > width/2 - 220 && mouseX < width/2 - 210) {
      i = 9;
    } else if(mouseX > width/2 - 210 && mouseX < width/2 - 200) {
      i = 10;
    } else if(mouseX > width/2 - 200 && mouseX < width/2 - 190) {
      i = 11;
    } else if(mouseX > width/2 - 190 && mouseX < width/2 - 180) {
      i = 12;
    } else if(mouseX > width/2 - 180 && mouseX < width/2 - 170) {
      i = 13;
    } else if(mouseX > width/2 - 170 && mouseX < width/2 - 160) {
      i = 14;
    } else if(mouseX > width/2 - 160 && mouseX < width/2 - 150) {
      i = 15;
    } else if(mouseX > width/2 - 150 && mouseX < width/2 - 140) {
      i = 16;
    } else if(mouseX > width/2 - 140 && mouseX < width/2 - 130) {
      i = 17;
    } else if(mouseX > width/2 - 130 && mouseX < width/2 - 120) {
      i = 18;
    } else if(mouseX > width/2 - 120 && mouseX < width/2 - 110) {
      i = 19;
    } else if(mouseX > width/2 - 110 && mouseX < width/2 - 100) {
      i = 20;
    } else if(mouseX > width/2 - 100 && mouseX < width/2 - 90) {
      i = 21;
    } else if(mouseX > width/2 - 90 && mouseX < width/2 - 80) {
      i = 22;
    } else if(mouseX > width/2 - 80 && mouseX < width/2 - 70) {
      i = 23;
    } else if(mouseX > width/2 - 70 && mouseX < width/2 - 60) {
      i = 24;
    } else if(mouseX > width/2 - 60 && mouseX < width/2 - 50) {
      i = 25;
    } else if(mouseX > width/2 - 50 && mouseX < width/2 - 40) {
      i = 26;
    } else if(mouseX > width/2 - 40 && mouseX < width/2 - 30) {
      i = 27;
    } else if(mouseX > width/2 - 30 && mouseX < width/2 - 20) {
      i = 28;
    } else if(mouseX > width/2 - 20 && mouseX < width/2 - 10) {
      i = 29;
    } else if(mouseX > width/2 - 10 && mouseX < width/2) {
      i = 30;
    } else if(mouseX > width/2 && mouseX < width/2 + 10) {
      i = 31;
    } else if(mouseX > width/2 + 10 && mouseX < width/2 + 20) {
      i = 32;
    } else if(mouseX > width/2 + 20 && mouseX < width/2 + 30) {
      i = 33;
    } else if(mouseX > width/2 + 30 && mouseX < width/2 + 40) {
      i = 34;
    } else if(mouseX > width/2 + 40 && mouseX < width/2 + 50) {
      i = 35;
    } else if(mouseX > width/2 + 50 && mouseX < width/2 + 60) {
      i = 36;
    } else if(mouseX > width/2 + 60 && mouseX < width/2 + 70) {
      i = 37;
    } else if(mouseX > width/2 + 70 && mouseX < width/2 + 80) {
      i = 38;
    } else if(mouseX > width/2 + 80 && mouseX < width/2 + 90) {
      i = 39;
    } else if(mouseX > width/2 + 90 && mouseX < width/2 + 100) {
      i = 40;
    } else if(mouseX > width/2 + 100 && mouseX < width/2 + 110) {
      i = 41;
    } else if(mouseX > width/2 + 110 && mouseX < width/2 + 120) {
      i = 42;
    } else if(mouseX > width/2 + 120 && mouseX < width/2 + 130) {
      i = 43;
    } else if(mouseX > width/2 + 130 && mouseX < width/2 + 140) {
      i = 44;
    } else if(mouseX > width/2 + 140 && mouseX < width/2 + 150) {
      i = 45;
    } else if(mouseX > width/2 + 150 && mouseX < width/2 + 160) {
      i = 46;
    } else if(mouseX > width/2 + 160 && mouseX < width/2 + 170) {
      i = 47;
    } else if(mouseX > width/2 + 170 && mouseX < width/2 + 180) {
      i = 48;
    } else if(mouseX > width/2 + 180 && mouseX < width/2 + 190) {
      i = 49;
    } else if(mouseX > width/2 + 190 && mouseX < width/2 + 200) {
      i = 50;
    } else if(mouseX > width/2 + 200 && mouseX < width/2 + 210) {
      i = 51;
    } else if(mouseX > width/2 + 210 && mouseX < width/2 + 220) {
      i = 52;
    } else if(mouseX > width/2 + 220 && mouseX < width/2 + 230) {
      i = 53;
    } else if(mouseX > width/2 + 230 && mouseX < width/2 + 240) {
      i = 54;
    } else if(mouseX > width/2 + 240 && mouseX < width/2 + 250) {
      i = 55;
    } else if(mouseX > width/2 + 250 && mouseX < width/2 + 260) {
      i = 56;
    } else if(mouseX > width/2 + 260 && mouseX < width/2 + 270) {
      i = 57;
    } else if(mouseX > width/2 + 270 && mouseX < width/2 + 280) {
      i = 58;
    } else if(mouseX > width/2 + 280 && mouseX < width/2 + 290) {
      i = 59;
    } else if(mouseX > width/2 + 290 && mouseX < width/2 + 300) {
      i = 60;
    }
  } else if(loop == -1) {
  rect(x - 15, height - 55, 30, 35);
  }
  
  
}

void mousePressed(){
  if(mouseX < width/2 + 300 && mouseX > width/2 - 300 && mouseY > height - 55 && mouseY < height - 20 && loop == 1) {
  loop = loop * -1;
  x = mouseX;
  } else if(mouseX < width/2 + 300 && mouseX > width/2 - 300 && mouseY > height - 55 && mouseY < height - 20 && loop == -1) {
      x = mouseX;
        if(mouseX > width/2 - 300 && mouseX < width/2 - 290) {
      i = 1;
    } else if(mouseX > width/2 - 290 && mouseX < width/2 - 280) {
      i = 2;
    } else if(mouseX > width/2 - 280 && mouseX < width/2 - 270) {
      i = 3;
    } else if(mouseX > width/2 - 270 && mouseX < width/2 - 260) {
      i = 4;
    } else if(mouseX > width/2 - 260 && mouseX < width/2 - 250) {
      i = 5;
    } else if(mouseX > width/2 - 250 && mouseX < width/2 - 240) {
      i = 6;
    } else if(mouseX > width/2 - 240 && mouseX < width/2 - 230) {
      i = 7;
    } else if(mouseX > width/2 - 230 && mouseX < width/2 - 220) {
      i = 8;
    } else if(mouseX > width/2 - 220 && mouseX < width/2 - 210) {
      i = 9;
    } else if(mouseX > width/2 - 210 && mouseX < width/2 - 200) {
      i = 10;
    } else if(mouseX > width/2 - 200 && mouseX < width/2 - 190) {
      i = 11;
    } else if(mouseX > width/2 - 190 && mouseX < width/2 - 180) {
      i = 12;
    } else if(mouseX > width/2 - 180 && mouseX < width/2 - 170) {
      i = 13;
    } else if(mouseX > width/2 - 170 && mouseX < width/2 - 160) {
      i = 14;
    } else if(mouseX > width/2 - 160 && mouseX < width/2 - 150) {
      i = 15;
    } else if(mouseX > width/2 - 150 && mouseX < width/2 - 140) {
      i = 16;
    } else if(mouseX > width/2 - 140 && mouseX < width/2 - 130) {
      i = 17;
    } else if(mouseX > width/2 - 130 && mouseX < width/2 - 120) {
      i = 18;
    } else if(mouseX > width/2 - 120 && mouseX < width/2 - 110) {
      i = 19;
    } else if(mouseX > width/2 - 110 && mouseX < width/2 - 100) {
      i = 20;
    } else if(mouseX > width/2 - 100 && mouseX < width/2 - 90) {
      i = 21;
    } else if(mouseX > width/2 - 90 && mouseX < width/2 - 80) {
      i = 22;
    } else if(mouseX > width/2 - 80 && mouseX < width/2 - 70) {
      i = 23;
    } else if(mouseX > width/2 - 70 && mouseX < width/2 - 60) {
      i = 24;
    } else if(mouseX > width/2 - 60 && mouseX < width/2 - 50) {
      i = 25;
    } else if(mouseX > width/2 - 50 && mouseX < width/2 - 40) {
      i = 26;
    } else if(mouseX > width/2 - 40 && mouseX < width/2 - 30) {
      i = 27;
    } else if(mouseX > width/2 - 30 && mouseX < width/2 - 20) {
      i = 28;
    } else if(mouseX > width/2 - 20 && mouseX < width/2 - 10) {
      i = 29;
    } else if(mouseX > width/2 - 10 && mouseX < width/2) {
      i = 30;
    } else if(mouseX > width/2 && mouseX < width/2 + 10) {
      i = 31;
    } else if(mouseX > width/2 + 10 && mouseX < width/2 + 20) {
      i = 32;
    } else if(mouseX > width/2 + 20 && mouseX < width/2 + 30) {
      i = 33;
    } else if(mouseX > width/2 + 30 && mouseX < width/2 + 40) {
      i = 34;
    } else if(mouseX > width/2 + 40 && mouseX < width/2 + 50) {
      i = 35;
    } else if(mouseX > width/2 + 50 && mouseX < width/2 + 60) {
      i = 36;
    } else if(mouseX > width/2 + 60 && mouseX < width/2 + 70) {
      i = 37;
    } else if(mouseX > width/2 + 70 && mouseX < width/2 + 80) {
      i = 38;
    } else if(mouseX > width/2 + 80 && mouseX < width/2 + 90) {
      i = 39;
    } else if(mouseX > width/2 + 90 && mouseX < width/2 + 100) {
      i = 40;
    } else if(mouseX > width/2 + 100 && mouseX < width/2 + 110) {
      i = 41;
    } else if(mouseX > width/2 + 110 && mouseX < width/2 + 120) {
      i = 42;
    } else if(mouseX > width/2 + 120 && mouseX < width/2 + 130) {
      i = 43;
    } else if(mouseX > width/2 + 130 && mouseX < width/2 + 140) {
      i = 44;
    } else if(mouseX > width/2 + 140 && mouseX < width/2 + 150) {
      i = 45;
    } else if(mouseX > width/2 + 150 && mouseX < width/2 + 160) {
      i = 46;
    } else if(mouseX > width/2 + 160 && mouseX < width/2 + 170) {
      i = 47;
    } else if(mouseX > width/2 + 170 && mouseX < width/2 + 180) {
      i = 48;
    } else if(mouseX > width/2 + 180 && mouseX < width/2 + 190) {
      i = 49;
    } else if(mouseX > width/2 + 190 && mouseX < width/2 + 200) {
      i = 50;
    } else if(mouseX > width/2 + 200 && mouseX < width/2 + 210) {
      i = 51;
    } else if(mouseX > width/2 + 210 && mouseX < width/2 + 220) {
      i = 52;
    } else if(mouseX > width/2 + 220 && mouseX < width/2 + 230) {
      i = 53;
    } else if(mouseX > width/2 + 230 && mouseX < width/2 + 240) {
      i = 54;
    } else if(mouseX > width/2 + 240 && mouseX < width/2 + 250) {
      i = 55;
    } else if(mouseX > width/2 + 250 && mouseX < width/2 + 260) {
      i = 56;
    } else if(mouseX > width/2 + 260 && mouseX < width/2 + 270) {
      i = 57;
    } else if(mouseX > width/2 + 270 && mouseX < width/2 + 280) {
      i = 58;
    } else if(mouseX > width/2 + 280 && mouseX < width/2 + 290) {
      i = 59;
    } else if(mouseX > width/2 + 290 && mouseX < width/2 + 300) {
      i = 60;
    }
  } else if(loop == -1) {
    loop = loop * -1;
  }
}

void keyPressed() {
loop = 1;
}
