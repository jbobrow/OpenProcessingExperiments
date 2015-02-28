
import ddf.minim.*;
int mode=1;
PImage animal;
  
  
Minim minim;
AudioSnippet clip1;
AudioSnippet clip2;
AudioSnippet clip3;
AudioSnippet clip4;
AudioSnippet clip5;
AudioSnippet clip6;
AudioSnippet clip7;
AudioSnippet clip8;
AudioSnippet clip9;
 
void setup() {
  animal = loadImage("animal.jpg");
  size(500, 500);
   
    minim = new Minim(this);
  clip1 = minim.loadSnippet("clip1.wav");
    minim = new Minim(this);
  clip2 = minim.loadSnippet("clip2.wav");
   minim = new Minim(this);
  clip3 = minim.loadSnippet("clip3.wav");
   minim = new Minim(this);
  clip4 = minim.loadSnippet("clip4.wav");
   minim = new Minim(this);
  clip5 = minim.loadSnippet("clip5.wav");
   minim = new Minim(this);
  clip6 = minim.loadSnippet("clip6.wav");
   minim = new Minim(this);
  clip7 = minim.loadSnippet("clip7.wav");
   minim = new Minim(this);
  clip8 = minim.loadSnippet("clip8.wav");
   minim = new Minim(this);
  clip9 = minim.loadSnippet("clip9.wav");
 
}
  
  
  
void draw() {
  smooth();
  image(animal, 0, 0);
 
 
  
  if (mode==1) {
    fill(239, 132, 247);
    ellipse(45, 40, 14, 26);
    ellipse(372,66,14,26);
    ellipse(145,294,14,26);
    ellipse(272,345,26,14);
    ellipse(298, 294, 14, 26);
    ellipse(449, 142, 14, 26);
    ellipse(320, 396, 26, 14);
    ellipse(21,319,14,26);
    ellipse(272,119,14,26);
      ellipse(147, 144, 14, 26);
    ellipse(70, 370, 14, 26);
    ellipse(323, 15, 14, 26);
    ellipse(172,320,14,26);
    ellipse(423,118,14,26);
    ellipse(298, 294, 14, 26);
    ellipse(449, 142, 14, 26);
    ellipse(320, 396, 26, 14);
    ellipse(21,319,14,26);
    ellipse(272,119,14,26);
        ellipse(197, 194, 14, 26);
  }
  else if (mode== 2) {
    fill(239, 240, 60);
    ellipse(122, 118, 14, 26);
    ellipse(471,395,26,14);
    ellipse(423,195,26,14);
    ellipse(247,243,14,26);
    ellipse(195,41,14,26);
    ellipse(298, 294, 14, 26);
    ellipse(449, 142, 14, 26);
    ellipse(320, 396, 26, 14);
    ellipse(21,319,14,26);
    ellipse(272,119,14,26);
     ellipse(173, 168, 14, 26);
    ellipse(97, 94, 14, 26);
    ellipse(446, 294, 14, 26);
    ellipse(472,470,14,26);
    ellipse(372,293,26,14);
    ellipse(421,267,14,26);
      ellipse(421,343,26,14);
    ellipse(173, 168, 14, 26);
    ellipse(97, 94, 14, 26);
    ellipse(446, 294, 14, 26);
    ellipse(472,470,14,26); 
  }
  else if (mode== 3) {
    fill(247,75,12);
    ellipse(173, 168, 14, 26);
    ellipse(97, 94, 14, 26);
    ellipse(446, 294, 14, 26);
    ellipse(472,470,14,26);
    ellipse(372,293,26,14);
    ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
    ellipse(193,40,14,26);
    ellipse(421,267,14,26);
     ellipse(71, 143, 26, 14);
    ellipse(322, 243, 26, 14);
    ellipse(46, 344, 14, 26);
    ellipse(96,317,26,14);
    ellipse(221,444,26,14);
    ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
    ellipse(298, 294, 14, 26);
    ellipse(449, 142, 14, 26);
    ellipse(320, 396, 26, 14);
    ellipse(21,319,14,26);
    ellipse(272,119,14,26);
     ellipse(173, 168, 14, 26);
  }
  else if (mode== 4) {
    fill(250,33,33);
    ellipse(272, 268, 14, 26);
    ellipse(96, 396, 14, 26);
    ellipse(20, 15, 14, 26);
    ellipse(147,220,26,14);
    ellipse(421,343,26,14);
      ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
    ellipse(193,40,14,26);
    ellipse(421,267,14,26);
        ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
    ellipse(193,40,14,26);
    ellipse(421,267,14,26);
    ellipse(272, 268, 14, 26);
    ellipse(96, 396, 14, 26);
    ellipse(20, 15, 14, 26);
    ellipse(423,118,14,26);
    ellipse(298, 294, 14, 26);
    ellipse(449, 142, 14, 26);
    ellipse(320, 396, 26, 14);
    ellipse(21,319,14,26);
    ellipse(272,119,14,26);
        ellipse(197, 194, 14, 26);
  }
  else if (mode== 5) {
    fill(188,33,250);
    ellipse(71, 143, 26, 14);
    ellipse(322, 243, 26, 14);
    ellipse(46, 344, 14, 26);
    ellipse(96,317,26,14);
    ellipse(221,444,26,14);
    ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
    ellipse(193,40,14,26);
    ellipse(421,267,14,26);
    ellipse(397, 396, 14, 26);
    ellipse(222, 219, 14, 26);
    ellipse(348, 40, 14, 26);
    ellipse(19,471,14,26);
    ellipse(121,422,14,26);
     ellipse(147, 144, 14, 26);
    ellipse(70, 370, 14, 26);
    ellipse(323, 15, 14, 26);
    ellipse(172,320,14,26);
    ellipse(423,118,14,26);
     ellipse(71, 143, 26, 14);
    ellipse(322, 243, 26, 14);
    ellipse(46, 344, 14, 26);
     
  }
  else if (mode== 6) {
    fill(250,33,203);
    ellipse(397, 396, 14, 26);
    ellipse(222, 219, 14, 26);
    ellipse(348, 40, 14, 26);
    ellipse(19,471,14,26);
    ellipse(121,422,14,26);
     ellipse(147, 144, 14, 26);
    ellipse(70, 370, 14, 26);
    ellipse(323, 15, 14, 26);
    ellipse(172,320,14,26);
    ellipse(423,118,14,26);
     ellipse(71, 143, 26, 14);
    ellipse(322, 243, 26, 14);
    ellipse(46, 344, 14, 26);
    ellipse(96,317,26,14);
    ellipse(221,444,26,14);
    ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
    ellipse(193,40,14,26);
    ellipse(421,267,14,26);
      ellipse(122, 118, 14, 26);
    ellipse(471,395,26,14);
    ellipse(21,319,14,26);
    ellipse(272,119,14,26);
     ellipse(173, 168, 14, 26);
  }
  else if (mode== 7) {
    fill(33,52,250);
    ellipse(298, 294, 14, 26);
    ellipse(449, 142, 14, 26);
    ellipse(320, 396, 26, 14);
    ellipse(21,319,14,26);
    ellipse(272,119,14,26);
    ellipse(272, 268, 14, 26);
    ellipse(96, 396, 14, 26);
    ellipse(20, 15, 14, 26);
    ellipse(147,220,26,14);
    ellipse(421,343,26,14);
    ellipse(173, 168, 14, 26);
    ellipse(97, 94, 14, 26);
    ellipse(446, 294, 14, 26);
    ellipse(472,470,14,26);
    ellipse(372,293,26,14);
    ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
    ellipse(193,40,14,26);
    ellipse(195, 420, 26, 14);
    ellipse(193,40,14,26);
    ellipse(421,267,14,26);
  }
  else if (mode== 8) {
    fill(250,126,30);
    ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
    ellipse(193,40,14,26);
    ellipse(421,267,14,26);
    ellipse(272, 268, 14, 26);
    ellipse(96, 396, 14, 26);
    ellipse(20, 15, 14, 26);
    ellipse(147,220,26,14);
    ellipse(421,343,26,14);
      ellipse(147, 144, 14, 26);
    ellipse(70, 370, 14, 26);
    ellipse(323, 15, 14, 26);
    ellipse(172,320,14,26);
    ellipse(21,319,14,26);
    ellipse(272,119,14,26);
        ellipse(197, 194, 14, 26);
  }
 else if (mode== 9) {
    fill(6,85,20);
    ellipse(147, 144, 14, 26);
    ellipse(70, 370, 14, 26);
    ellipse(323, 15, 14, 26);
    ellipse(172,320,14,26);
    ellipse(423,118,14,26);
    ellipse(298, 294, 14, 26);
    ellipse(449, 142, 14, 26);
    ellipse(320, 396, 26, 14);
    ellipse(21,319,14,26);
    ellipse(272,119,14,26);
        ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
    ellipse(193,40,14,26);
    ellipse(421,267,14,26);
    ellipse(272, 268, 14, 26);
    ellipse(96, 396, 14, 26);
    ellipse(20, 15, 14, 26);
    ellipse(147,220,26,14);
    ellipse(421,343,26,14);
      ellipse(421,343,26,14);
    ellipse(173, 168, 14, 26);
    ellipse(97, 94, 14, 26);
    ellipse(446, 294, 14, 26);
    ellipse(193,40,14,26);
    ellipse(421,267,14,26);
  }
}
  
void keyPressed() {
  if (key=='1') {
    mode=1;
    clip1.play(0);
  }
  else if (key=='2') {
    mode=2;
    clip2.play(0);
  }
  else if (key=='3') {
    mode=3;
    clip3.play(0);
  }
  else if (key=='4') {
    mode=4;
    clip4.play(0);
  }
  else if (key=='5') {
    mode=5;
    clip5.play(0);
  }
  else if (key=='6') {
    mode=6;
    clip6.play(0);
  }
  else if (key=='7') {
    mode=7;
    clip7.play(0);
  }
   else if (key=='8') {
    mode=8;
    clip8.play(0);
  }
   else if (key=='9') {
    mode=9;
    clip9.play(0);
  }
}
 
 
void stop()
{
 
  clip1.close();
  clip2.close();
  clip3.close();
  clip4.close();
  clip5.close();
  clip6.close();
  clip7.close();
  clip8.close();
  clip9.close();
   
 
  minim.stop();
 
  super.stop();
}

