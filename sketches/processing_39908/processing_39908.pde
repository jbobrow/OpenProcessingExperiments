
PImage a; 
PImage b; 
PImage c; 
PImage d; 
PImage d2; 
PImage f; 
PImage d3; 
PImage d4; 
float t1 = 255; 
float w1 = 1; 
float w2 = 1; 
float i1 = random (0, 1); 
float r1 = random (0, 10); //randomizer for image 

void setup () { 
  size (900, 600);
  background (0); 
  smooth (); 
  a = loadImage ("kissmesunlightsfinal12.jpg"); 
  b = loadImage ("kissmesunlightsfinal2.jpg"); 
  c = loadImage ("kissmesunlightsfinal3.jpg"); 
  d = loadImage ("kissmesunlightsfinal4.jpg");
  d2 = loadImage ("kissmesunlightsfinal41.jpg");
  d3 = loadImage ("kissmesunlightsfinal42.jpg"); 
  d4 = loadImage ("kissmesunlightsfinal44.jpg"); 
  f = d;
} 

void draw () { 
  tint (t1, 1000); 
  image(a, 0, 0, width*w1, height*w1);
  tint (t1, mouseX*1.17); 
  image(b, 0, 0, width*w2, height*w2); 
  tint (t1, mouseX*1.17-300); 
  image (c, 0, 0, width*w1, height*w1); 
  tint (t1, mouseX*1.17-650); 
  image (f, 0, 0, width*w2, height*w2);
  if (mouseX > 555 && pmouseX < 555) { 
    if (random (0, 10) > 7.5 ) { 
      f = d2;
    } 
    else if (random (0, 10) > 6.66) {
      f = d3;
    } 
    else if (random (0, 10) > 5) {
      f = d4;
    } 
    else { 
      f = d;
    }
  }
  if (key == ' ') { 
    t1 = 0;
  }
  else if (key == '1') { 
    t1 = 255;
  }
  else if (key == '2') { 
    filter (BLUR, 40); 
    filter (POSTERIZE, 10);
  }
  else if (key == '3') { 
    filter (THRESHOLD, .35);
    filter (INVERT);
  }
  else if (key == '4') { 
    filter (GRAY);
  }
  else if (key == '5') { 
    filter (GRAY); 
    filter (INVERT);
  }
  else if (key == '7') { 
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
  }
  else if (key == '8') { 
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
    filter (DILATE);
  }
  else if (key == '9') { 
    w1 = 2;
  }
  else if (key == '0') { 
    w1 = 6; 
    w2 = 6;
  }
  else if (key == 'q') { 
    t1 = random (0, 255);
  }
  else if (key == 'w') { 
    w1 = random (1, 5); 
    w2 = random (1, 3);
  }
  else if (key == 'e') { 
    filter (POSTERIZE, random (2, 10));
  }
}


