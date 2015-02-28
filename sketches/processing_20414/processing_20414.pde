
int y = 13;
int y2= 86;
int x = 49;
int o = 74;



void setup() {
  background (0);
  size (640, 480);
  smooth();
 colorMode(HSB, 360, 100, 100);

}

void draw () {

  float s = second();
  float sMapped = map (s%4 , 0, 4,  0, 100);
 
  float m = minute ();
  float mMapped = map (m%4, 0, 4, 0, 100);
  float mMapped2 = map (m%4, 0, 4, 0, 100);
  
  

  
  //Row 1
  pushMatrix();
  fill (335, 0, sMapped);
  quad (23, y, x, 50, 23, y2, 0, x); // 1x1
  quad (222, y,  245, x, 222, y2, 198, x); //1x5
  quad (568, y, 591, x, 568, y2, 544, x); //1x12
  
    //Row 1 Minute
  fill (mMapped, 45, 90);
  quad (123, y,  147, x, 123, y2, 98, x); //1x3
  quad (519, y, 543, x, 519, y2, 494, x); //1x11
  fill(mMapped2, 70, 90);
  quad (370, y, 394, x, 370, y2, 346, x); //1x8
  
  fill(335, 0, 100);
  quad (74, y, 97, x, 74, y2, 49, x); //1x2 
  quad (172, y, 196, x, 172, y2, 147, x); //1x4
  quad (272, y, 295, x,  272, y2, 246, x); //1x6
  quad (320, y, 344, x, 320, y2, 296, x); //1x7
  quad (419, y, 444, x, 419, y2, 394, x); //1x9
  quad (469, y, 493, x, 469, y2, 445, x ); //1x10
  quad (619, y, 640, x, 619, y2, 593, x); //1x13
  
  popMatrix();
  
  
  
  //Row 2
  pushMatrix();
  translate (0, o);
  fill (335, 0, sMapped);
  quad (74, y, 97, x, 74, y2, 49, x); //2x2 
  quad (320, y, 344, x, 320, y2, 296, x); //2x7
  quad (419, y, 444, x, 419, y2, 394, x); //2x9
  quad (519, y, 543, x, 519, y2, 494, x); //2x11
  
  
      //Row 2 Minute
  fill (mMapped, 45, 90);
  quad (222, y,  245, x, 222, y2, 198, x); //2x5
  quad (519, y, 543, x, 519, y2, 494, x); //2x11
  fill(mMapped2, 70, 90);
  quad (172, y, 196, x, 172, y2, 147, x); //2x4

  fill (355, 0, 100);
  quad (23, y, x, 50, 23, y2, 0, x); // 2x1
  quad (123, y,  147, x, 123, y2, 98, x); //2x3
  quad (272, y, 295, x,  272, y2, 246, x); //2x6
  quad (370, y, 394, x, 370, y2, 346, x); //2x8
  quad (469, y, 493, x, 469, y2, 445, x ); //2x10
  quad (568, y, 591, x, 568, y2, 544, x); //2x12
  quad (619, y, 640, x, 619, y2, 593, x); //2x13
  popMatrix();
  
  //Row 3
  pushMatrix();
  translate (0, o*2);
  fill (335, 0, sMapped);
  quad (123, y,  147, x, 123, y2, 98, x); //3x3
  quad (222, y,  245, x, 222, y2, 198, x); //3x5
  quad (370, y, 394, x, 370, y2, 346, x); //3x8
  quad (469, y, 493, x, 469, y2, 445, x ); //3x10
  quad (619, y, 640, x, 619, y2, 593, x); //3x13
  
     //Row 3 Minute
  fill (mMapped, 45, 90);
  quad (23, y, x, 50, 23, y2, 0, x); // 3x1
  quad (320, y, 344, x, 320, y2, 296, x); //3x7
  fill(mMapped2, 70, 90);
  quad (568, y, 591, x, 568, y2, 544, x); //3x12
  
  fill (355, 0, 100);
  quad (74, y, 97, x, 74, y2, 49, x); //3x2 
  quad (172, y, 196, x, 172, y2, 147, x); //3x4
  quad (272, y, 295, x,  272, y2, 246, x); //3x6
  quad (419, y, 444, x, 419, y2, 394, x); //3x9
  quad (519, y, 543, x, 519, y2, 494, x); //3x11
 

  popMatrix();
  
  //Row 4
  pushMatrix();
  translate (0, o*3);
  fill (335, 0, sMapped);
  
  quad (23, y, x, 50, 23, y2, 0, x); // 4x1
  quad (370, y, 394, x, 370, y2, 346, x); //4x8
  quad (568, y, 591, x, 568, y2, 544, x); //4x12
  quad (519, y, 543, x, 519, y2, 494, x); //4x11
  
  
  
      //Row 4 Minute
  fill (mMapped, 45, 90);
  quad (123, y,  147, x, 123, y2, 98, x); //4x3
  fill(mMapped2, 70, 90);
  quad (222, y,  245, x, 222, y2, 198, x); //4x5
  quad (320, y, 344, x, 320, y2, 296, x); //4x7
  
  fill (355, 0, 100);
  quad (74, y, 97, x, 74, y2, 49, x); //4x2 
  quad (172, y, 196, x, 172, y2, 147, x); //4x4
  quad (272, y, 295, x,  272, y2, 246, x); //4x6
  quad (419, y, 444, x, 419, y2, 394, x); //4x9
  quad (469, y, 493, x, 469, y2, 445, x ); //4x10
  quad (619, y, 640, x, 619, y2, 593, x); //4x13
  popMatrix();
  
  //Row 5
  pushMatrix();
  translate (0, o*4);
  fill (335, 0, sMapped);
  quad (123, y,  147, x, 123, y2, 98, x); //5x3
  quad (320, y, 344, x, 320, y2, 296, x); //5x7
  quad (419, y, 444, x, 419, y2, 394, x); //5x9
  quad (568, y, 591, x, 568, y2, 544, x); //5x12
  quad (619, y, 640, x, 619, y2, 593, x); //5x13
  
      //Row 5 Minute
  fill (mMapped, 45, 90);
   quad (23, y, x, 50, 23, y2, 0, x); // 5x1
   quad (222, y,  245, x, 222, y2, 198, x); //5x5
  fill(mMapped2, 70, 90);
  quad (469, y, 493, x, 469, y2, 445, x ); //5x10
  
  fill (355, 0, 100);
  quad (74, y, 97, x, 74, y2, 49, x); //5x2 
  quad (172, y, 196, x, 172, y2, 147, x); //5x4
  quad (272, y, 295, x,  272, y2, 246, x); //5x6
  quad (370, y, 394, x, 370, y2, 346, x); //5x8
  quad (519, y, 543, x, 519, y2, 494, x); //5x11
  
  
  popMatrix();
  
  //Row 6;
  pushMatrix();
  translate (0, o*5);
  fill(335, 0, sMapped);
   quad (23, y, x, 50, 23, y2, 0, x); // 6x1
    quad (172, y, 196, x, 172, y2, 147, x); //6x4
    quad (272, y, 295, x,  272, y2, 246, x); //6x6
    quad (519, y, 543, x, 519, y2, 494, x); //6x11
    
    //Row 6 Minute
    fill (mMapped, 45, 100);
    quad (419, y, 444, x, 419, y2, 394, x); //6x9
   quad (619, y, 640, x, 619, y2, 593, x); //6x13

  fill(mMapped2, 70, 100);
  quad (370, y, 394, x, 370, y2, 346, x); //6x8
  
  fill (355, 0, 100);
  quad (74, y, 97, x, 74, y2, 49, x); //6x2 
  quad (123, y,  147, x, 123, y2, 98, x); //6x3
  quad (222, y,  245, x, 222, y2, 198, x); //6x5
  quad (320, y, 344, x, 320, y2, 296, x); //6x7
  quad (469, y, 493, x, 469, y2, 445, x ); //6x10
  quad (568, y, 591, x, 568, y2, 544, x); //6x12
  popMatrix();
  
  
  // HOURS
   float h = hour ();
  
  if (h == 1) {
    fill (354, 86, 96);
    quad (74, y, 97, x, 74, y2, 49, x); //1x2
  }
  if (h == 13) {
    fill (354, 86, 96);
    quad (74, y, 97, x, 74, y2, 49, x); //1x2
}
  if (h == 2) {
    pushMatrix ();
    translate (0, o);
    fill (319, 67, 100);
    quad (519, y, 543, x, 519, y2, 494, x); //2x11
    quad (74, y, 97, x, 74, y2, 49, x); //2x2 
    popMatrix();
  } if( h == 14) {
     pushMatrix ();
    translate (0, o);
    fill (319, 67, 100);
    quad (519, y, 543, x, 519, y2, 494, x); //2x11
    quad (74, y, 97, x, 74, y2, 49, x); //2x2 
    popMatrix();
    
  }
  if (h == 3) {
    pushMatrix ();
    translate (0, o*2);
    fill (291, 61, 90);
    quad (370, y, 394, x, 370, y2, 346, x); //3x8
    quad (619, y, 640, x, 619, y2, 593, x); //3x13
    popMatrix();
    pushMatrix();
    translate (0, o*4);
    quad (222, y,  245, x, 222, y2, 198, x); //5x5
    popMatrix();
  } if (h == 15) {
    pushMatrix ();
    translate (0, o*2);
    fill (291, 61, 90);
    quad (370, y, 394, x, 370, y2, 346, x); //3x8
    quad (619, y, 640, x, 619, y2, 593, x); //3x13
    popMatrix();
    pushMatrix();
    translate (0, o*4);
    quad (222, y,  245, x, 222, y2, 198, x); //5x5
    popMatrix();
    
  }
  if (h == 4) {
    pushMatrix ();
    translate (0, o*3);
    fill (265, 61, 90);
    quad (123, y,  147, x, 123, y2, 98, x); //4x3
    quad (370, y, 394, x, 370, y2, 346, x); //4x8
    popMatrix ();
    pushMatrix();
    translate (0, o);
     quad (320, y, 344, x, 320, y2, 296, x); //2x7
     quad (619, y, 640, x, 619, y2, 593, x); //2x13
    popMatrix ();
  } if (h == 16) {
    pushMatrix ();
    translate (0, o*3);
    fill (265, 61, 90);
    quad (123, y,  147, x, 123, y2, 98, x); //4x3
    quad (370, y, 394, x, 370, y2, 346, x); //4x8
    popMatrix ();
    pushMatrix();
    translate (0, o);
     quad (320, y, 344, x, 320, y2, 296, x); //2x7
     quad (619, y, 640, x, 619, y2, 593, x); //2x13
    popMatrix ();
   
  }
  if (h == 5) {
    pushMatrix ();
    fill (234, 61, 90);
    translate (0, o*4);
     quad (419, y, 444, x, 419, y2, 394, x); //5x9
      quad (123, y,  147, x, 123, y2, 98, x); //5x3
    popMatrix ();
    pushMatrix();
   translate (0, o*3);
     quad (23, y, x, 50, 23, y2, 0, x); // 4x1
     quad (519, y, 543, x, 519, y2, 494, x); //4x11
    popMatrix ();
    pushMatrix ();
    translate(0, o*5);
     quad (469, y, 493, x, 469, y2, 445, x ); //6x10
    popMatrix ();
  } if(h == 17) {
    pushMatrix ();
    fill (234, 61, 90);
    translate (0, o*4);
     quad (419, y, 444, x, 419, y2, 394, x); //5x9
      quad (123, y,  147, x, 123, y2, 98, x); //5x3
    popMatrix ();
    pushMatrix();
   translate (0, o*3);
     quad (23, y, x, 50, 23, y2, 0, x); // 4x1
     quad (519, y, 543, x, 519, y2, 494, x); //4x11
    popMatrix ();
    pushMatrix ();
    translate(0, o*5);
     quad (469, y, 493, x, 469, y2, 445, x ); //6x10
    popMatrix ();
    
  }
  if (h == 6) {
    pushMatrix();
    fill (200, 70, 92);
    translate (0, o*5);
    quad (272, y, 295, x,  272, y2, 246, x); //6x6
    quad (519, y, 543, x, 519, y2, 494, x); //6x11
    popMatrix();
    pushMatrix ();
translate (0, o*4);
  quad (320, y, 344, x, 320, y2, 296, x); //5x7
  quad (419, y, 444, x, 419, y2, 394, x); //5x9
  popMatrix();
  pushMatrix();
  translate (0, o*2);
  quad (74, y, 97, x, 74, y2, 49, x); //2x2 
   quad (172, y, 196, x, 172, y2, 147, x); //2x4
  popMatrix();
  }
  if (h == 18) {
    pushMatrix();
    fill (200, 70, 92);
    translate (0, o*5);
    quad (272, y, 295, x,  272, y2, 246, x); //6x6
    quad (519, y, 543, x, 519, y2, 494, x); //6x11
    popMatrix();
    pushMatrix ();
translate (0, o*4);
  quad (320, y, 344, x, 320, y2, 296, x); //5x7
  quad (419, y, 444, x, 419, y2, 394, x); //5x9
  popMatrix();
  pushMatrix();
  translate (0, o*2);
  quad (74, y, 97, x, 74, y2, 49, x); //2x2 
   quad (172, y, 196, x, 172, y2, 147, x); //2x4
  popMatrix();
  }
  if (h == 7) {
  pushMatrix();
  fill (157, 70, 92);
  translate (0,0);
  quad (320, y, 344, x, 320, y2, 296, x); //1x7
  quad (419, y, 444, x, 419, y2, 394, x); //1x9
  quad (619, y, 640, x, 619, y2, 593, x); //1x13
  popMatrix();
  pushMatrix();
  translate (0, o*3);
  quad (272, y, 295, x,  272, y2, 246, x); //4x6
  quad (419, y, 444, x, 419, y2, 394, x); //4x9
  popMatrix();
  pushMatrix();
  translate (0, o*5);
  quad (123, y,  147, x, 123, y2, 98, x); //6x3
  quad (222, y,  245, x, 222, y2, 198, x); //6x5
  popMatrix();
  }
  if (h == 19) {
  pushMatrix();
  fill (157, 70, 92);
  translate (0,0);
  quad (320, y, 344, x, 320, y2, 296, x); //1x7
  quad (419, y, 444, x, 419, y2, 394, x); //1x9
  quad (619, y, 640, x, 619, y2, 593, x); //1x13
  popMatrix();
  pushMatrix();
  translate (0, o*3);
  quad (272, y, 295, x,  272, y2, 246, x); //4x6
  quad (419, y, 444, x, 419, y2, 394, x); //4x9
  popMatrix();
  pushMatrix();
  translate (0, o*5);
  quad (123, y,  147, x, 123, y2, 98, x); //6x3
  quad (222, y,  245, x, 222, y2, 198, x); //6x5
  popMatrix();
}
  
  if (h == 8) {
    pushMatrix();
    fill (119, 70, 92);
    translate (0, o);
   quad (123, y,  147, x, 123, y2, 98, x); //2x3
  quad (272, y, 295, x,  272, y2, 246, x); //2x6
  quad (370, y, 394, x, 370, y2, 346, x); //2x8
  popMatrix();
  pushMatrix();
  translate (0,o*4);
  quad (172, y, 196, x, 172, y2, 147, x); //5x4
  quad (272, y, 295, x,  272, y2, 246, x); //5x6
  quad (370, y, 394, x, 370, y2, 346, x); //5x8
  popMatrix();
  pushMatrix();
  translate (0, o*5);
  quad (222, y,  245, x, 222, y2, 198, x); //6x5
  quad (320, y, 344, x, 320, y2, 296, x); //6x7
  popMatrix();
  
}if (h == 20) {
    pushMatrix();
    fill (119, 70, 92);
    translate (0, o);
   quad (123, y,  147, x, 123, y2, 98, x); //2x3
  quad (272, y, 295, x,  272, y2, 246, x); //2x6
  quad (370, y, 394, x, 370, y2, 346, x); //2x8
  popMatrix();
  pushMatrix();
  translate (0,o*4);
  quad (172, y, 196, x, 172, y2, 147, x); //5x4
  quad (272, y, 295, x,  272, y2, 246, x); //5x6
  quad (370, y, 394, x, 370, y2, 346, x); //5x8
  popMatrix();
  pushMatrix();
  translate (0, o*5);
  quad (222, y,  245, x, 222, y2, 198, x); //6x5
  quad (320, y, 344, x, 320, y2, 296, x); //6x7
  popMatrix();

}
  if (h == 9) {
    pushMatrix();
     fill (80, 100, 100);
     translate (0, o*2);
     quad (74, y, 97, x, 74, y2, 49, x); //3x2 
     quad (172, y, 196, x, 172, y2, 147, x); //3x4
     popMatrix();
     pushMatrix();
     translate (0, o*3);
       quad (419, y, 444, x, 419, y2, 394, x); //4x9
  quad (469, y, 493, x, 469, y2, 445, x ); //4x10
  quad (619, y, 640, x, 619, y2, 593, x); //4x13
    popMatrix();
    pushMatrix();
    translate (0, o*4);
     quad (172, y, 196, x, 172, y2, 147, x); //5x4
  quad (272, y, 295, x,  272, y2, 246, x); //5x6
  quad (370, y, 394, x, 370, y2, 346, x); //5x8
  quad (519, y, 543, x, 519, y2, 494, x); //5x11
  popMatrix();
  }if (h == 20) {
    pushMatrix();
     fill (80, 100, 100);
     translate (0, o*2);
     quad (74, y, 97, x, 74, y2, 49, x); //3x2 
     quad (172, y, 196, x, 172, y2, 147, x); //3x4
     popMatrix();
     pushMatrix();
     translate (0, o*3);
       quad (419, y, 444, x, 419, y2, 394, x); //4x9
  quad (469, y, 493, x, 469, y2, 445, x ); //4x10
  quad (619, y, 640, x, 619, y2, 593, x); //4x13
    popMatrix();
    pushMatrix();
    translate (0, o*4);
     quad (172, y, 196, x, 172, y2, 147, x); //5x4
  quad (272, y, 295, x,  272, y2, 246, x); //5x6
  quad (370, y, 394, x, 370, y2, 346, x); //5x8
  quad (519, y, 543, x, 519, y2, 494, x); //5x11
  popMatrix();
}
   if (h == 10) {
     pushMatrix();
     translate (0, 0);
  fill (58, 100, 100);
   quad (172, y, 196, x, 172, y2, 147, x); //1x4
  quad (272, y, 295, x,  272, y2, 246, x); //1x6
  popMatrix();
  pushMatrix ();
    translate (0, o);
    quad (222, y,  245, x, 222, y2, 198, x); //2x5
    quad (519, y, 543, x, 519, y2, 494, x); //2x11
    popMatrix();
    pushMatrix();
    translate (0, o*3);
     quad (222, y,  245, x, 222, y2, 198, x); //4x5
    quad (320, y, 344, x, 320, y2, 296, x); //4x7
  popMatrix();
  pushMatrix();
  translate (0, o*4);
  quad (320, y, 344, x, 320, y2, 296, x); //5x7
  quad (419, y, 444, x, 419, y2, 394, x); //5x9
  quad (568, y, 591, x, 568, y2, 544, x); //5x12
  popMatrix();
  pushMatrix();
  translate (0, o*5);
  quad (370, y, 394, x, 370, y2, 346, x); //5x8
  popMatrix();

   }
   if ( h == 11) {
   pushMatrix ();
     translate (0, o);
     fill (25, 100, 100);
     quad (370, y, 394, x, 370, y2, 346, x); //2x8
  quad (469, y, 493, x, 469, y2, 445, x ); //2x10
  quad (568, y, 591, x, 568, y2, 544, x); //2x12
  quad (619, y, 640, x, 619, y2, 593, x); //2x13
  popMatrix();
  pushMatrix ();
   translate (0, o*3);
    quad (272, y, 295, x,  272, y2, 246, x); //4x6
  quad (419, y, 444, x, 419, y2, 394, x); //4x9
  quad (469, y, 493, x, 469, y2, 445, x ); //4x10
  quad (619, y, 640, x, 619, y2, 593, x); //4x13
  popMatrix();
  pushMatrix ();
    translate (0, o*5);
    quad (74, y, 97, x, 74, y2, 49, x); //5x2 
  quad (172, y, 196, x, 172, y2, 147, x); //5x4
  quad (272, y, 295, x,  272, y2, 246, x); //5x6
  popMatrix();
   }
    if (h == 10) {
     pushMatrix();
     translate (0, 0);
  fill (58, 100, 100);
   quad (172, y, 196, x, 172, y2, 147, x); //1x4
  quad (272, y, 295, x,  272, y2, 246, x); //1x6
  popMatrix();
  pushMatrix ();
    translate (0, o);
    quad (222, y,  245, x, 222, y2, 198, x); //2x5
    quad (519, y, 543, x, 519, y2, 494, x); //2x11
    popMatrix();
    pushMatrix();
    translate (0, o*3);
     quad (222, y,  245, x, 222, y2, 198, x); //4x5
    quad (320, y, 344, x, 320, y2, 296, x); //4x7
  popMatrix();
  pushMatrix();
  translate (0, o*4);
  quad (320, y, 344, x, 320, y2, 296, x); //5x7
  quad (419, y, 444, x, 419, y2, 394, x); //5x9
  quad (568, y, 591, x, 568, y2, 544, x); //5x12
  popMatrix();
  pushMatrix();
  translate (0, o*5);
  quad (370, y, 394, x, 370, y2, 346, x); //5x8
  popMatrix();

   }
   if ( h == 21) {
   pushMatrix ();
     translate (0, o);
     fill (25, 100, 100);
     quad (370, y, 394, x, 370, y2, 346, x); //2x8
  quad (469, y, 493, x, 469, y2, 445, x ); //2x10
  quad (568, y, 591, x, 568, y2, 544, x); //2x12
  quad (619, y, 640, x, 619, y2, 593, x); //2x13
  popMatrix();
  pushMatrix ();
   translate (0, o*3);
    quad (272, y, 295, x,  272, y2, 246, x); //4x6
  quad (419, y, 444, x, 419, y2, 394, x); //4x9
  quad (469, y, 493, x, 469, y2, 445, x ); //4x10
  quad (619, y, 640, x, 619, y2, 593, x); //4x13
  popMatrix();
  pushMatrix ();
    translate (0, o*5);
    quad (74, y, 97, x, 74, y2, 49, x); //5x2 
  quad (172, y, 196, x, 172, y2, 147, x); //5x4
  quad (272, y, 295, x,  272, y2, 246, x); //5x6
  popMatrix();
   }
 
 if (h == 0) {
   
   pushMatrix();
   translate (0, 0);
    fill (10,  100, 100);
    quad (272, y, 295, x,  272, y2, 246, x); //1x6
    quad (320, y, 344, x, 320, y2, 296, x); //1x7
    quad (419, y, 444, x, 419, y2, 394, x); //1x9
  quad (469, y, 493, x, 469, y2, 445, x ); //1x10
  popMatrix();
  pushMatrix();
  translate (0, o*2);
  quad (74, y, 97, x, 74, y2, 49, x); //3x2 
  quad (172, y, 196, x, 172, y2, 147, x); //3x4
  quad (272, y, 295, x,  272, y2, 246, x); //3x6
  quad (419, y, 444, x, 419, y2, 394, x); //3x9
  popMatrix();
  pushMatrix();
  translate (0, o*3);
  quad (272, y, 295, x,  272, y2, 246, x); //4x6
  quad (419, y, 444, x, 419, y2, 394, x); //4x9
  quad (469, y, 493, x, 469, y2, 445, x ); //4x10
  quad (619, y, 640, x, 619, y2, 593, x); //4x13
  popMatrix();
}
if (h == 22) {
   
   pushMatrix();
   translate (0, 0);
    fill (10,  100, 100);
    quad (272, y, 295, x,  272, y2, 246, x); //1x6
    quad (320, y, 344, x, 320, y2, 296, x); //1x7
    quad (419, y, 444, x, 419, y2, 394, x); //1x9
  quad (469, y, 493, x, 469, y2, 445, x ); //1x10
  popMatrix();
  pushMatrix();
  translate (0, o*2);
  quad (74, y, 97, x, 74, y2, 49, x); //3x2 
  quad (172, y, 196, x, 172, y2, 147, x); //3x4
  quad (272, y, 295, x,  272, y2, 246, x); //3x6
  quad (419, y, 444, x, 419, y2, 394, x); //3x9
  popMatrix();
  pushMatrix();
  translate (0, o*3);
  quad (272, y, 295, x,  272, y2, 246, x); //4x6
  quad (419, y, 444, x, 419, y2, 394, x); //4x9
  quad (469, y, 493, x, 469, y2, 445, x ); //4x10
  quad (619, y, 640, x, 619, y2, 593, x); //4x13
  popMatrix();
}
}

//Click to Blink!
void mousePressed() {
fill (0, 0, 0);
pushMatrix();
quad (74, y, 97, x, 74, y2, 49, x); //1x2 
  quad (172, y, 196, x, 172, y2, 147, x); //1x4
  quad (272, y, 295, x,  272, y2, 246, x); //1x6
  quad (320, y, 344, x, 320, y2, 296, x); //1x7
  quad (419, y, 444, x, 419, y2, 394, x); //1x9
  quad (469, y, 493, x, 469, y2, 445, x ); //1x10
  quad (619, y, 640, x, 619, y2, 593, x); //1x13
  popMatrix();
  
  pushMatrix();
  translate (0, o);
  quad (23, y, x, 50, 23, y2, 0, x); // 2x1
  quad (123, y,  147, x, 123, y2, 98, x); //2x3
  quad (272, y, 295, x,  272, y2, 246, x); //2x6
  quad (370, y, 394, x, 370, y2, 346, x); //2x8
  quad (469, y, 493, x, 469, y2, 445, x ); //2x10
  quad (568, y, 591, x, 568, y2, 544, x); //2x12
  quad (619, y, 640, x, 619, y2, 593, x); //2x13
  popMatrix();
  
  pushMatrix();
  translate (0, o*2);
  quad (74, y, 97, x, 74, y2, 49, x); //3x2 
  quad (172, y, 196, x, 172, y2, 147, x); //3x4
  quad (272, y, 295, x,  272, y2, 246, x); //3x6
  quad (419, y, 444, x, 419, y2, 394, x); //3x9
  quad (519, y, 543, x, 519, y2, 494, x); //3x11
  popMatrix();
  
   pushMatrix();
  translate (0, o*3);
   quad (74, y, 97, x, 74, y2, 49, x); //4x2 
  quad (172, y, 196, x, 172, y2, 147, x); //4x4
  quad (272, y, 295, x,  272, y2, 246, x); //4x6
  quad (419, y, 444, x, 419, y2, 394, x); //4x9
  quad (469, y, 493, x, 469, y2, 445, x ); //4x10
  quad (619, y, 640, x, 619, y2, 593, x); //4x13
  popMatrix();
  
   pushMatrix();
  translate (0, o*4);
  quad (74, y, 97, x, 74, y2, 49, x); //5x2 
  quad (172, y, 196, x, 172, y2, 147, x); //5x4
  quad (272, y, 295, x,  272, y2, 246, x); //5x6
  quad (370, y, 394, x, 370, y2, 346, x); //5x8
  quad (519, y, 543, x, 519, y2, 494, x); //5x11
  popMatrix();

 pushMatrix();
  translate (0, o*5);
  quad (74, y, 97, x, 74, y2, 49, x); //5x2 
  quad (172, y, 196, x, 172, y2, 147, x); //5x4
  quad (272, y, 295, x,  272, y2, 246, x); //5x6
  quad (370, y, 394, x, 370, y2, 346, x); //5x8
  quad (519, y, 543, x, 519, y2, 494, x); //5x11
  popMatrix();

}



