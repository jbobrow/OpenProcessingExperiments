
//MG GARUZ
//CREATIVE COMP
//SECTION F
//MIDTERM (woe!)


void setup() {
  size (829, 600);
}


void draw () {
  background(200);
  smooth();
  


  //RHOMBOID ROTATION * 
  for (int i = 0; i < 30; i++) {
    for (int j = 0; j < 30; j++) {
      pushMatrix();
      translate(92 * i, 105 * j  );
      rotate(TWO_PI/3);
      if (i%3 == 0) {
        fill(125, 216, 253);
      } else if (i%3 == 1) {
        fill(126, 43, 138);
      } else if (i%3 == 2) {
        fill(230, 0, 110);
      }

      draw_rohmboid(22, -39);
      rotate(PI/1.5);

      if (i%3 == 1) {
        fill(230, 0, 110);
      } else if (i%3 == 0) {
        fill(126, 43, 138);
      } else if (i%3 == 2) {
        fill(125, 216, 253);
      }
      draw_rohmboid(114, -279);

      popMatrix();
    }
  }
  // }
  //Rhomboid Repetition
  //LINE 1
  for (int i = 0; i < 30; i++) {
    for (int j = 0; j < 30; j++) {
       if (i%3 == 0) {
        fill(230, 0, 110);
      } else if (i%3 == 1) {
        fill(125, 216, 253);
      } else if (i%3 == 2) {
        fill(126, 43, 138);
      }
      draw_rohmboid(i * 92, j * 105 );
       if (i%3 == 0) {
        fill(126, 43, 138);
      } else if (i%3 == 1) {
        fill(230, 0, 110);
      } else if (i%3 == 2) {
        fill(125, 216, 253);
      }
      draw_rohmboid(i * 92 + 46.5, j * 105 +78 );
    }
  }
}

// RHOMBOID PARAMETERS
void draw_rohmboid(float _x, float _y) {
  quad(_x-46, _y, _x, _y-26, _x + 46, _y, _x, _y+26);
}


// COLOR ARRAY
//colors[] myColors = colors [6]
//myColors[0] = color(230, 0, 110); //magenta
//myColors[1] = color(126, 43, 138); //purple
//myColors[2] = color(125, 216, 253); //sky blue
//myColors[3] = color(135, 187, 104); //green
//myColors[4] = color(242,255,1); //yellow
//myColors[5] = color(84, 114, 151); //dark blue


////1st row goes:
//magenta, blue, purple
////2nd row goes:
//purple,magenta, blue
////rotated rhoms go:
//blue, magenta, purple

//2nd color scheme




//      
//    quad(x-46, y, x, y-26, x+46, y, x, y+26);
//    rotate(radians(25));
//    quad (x,34,800,0,800,67,x,100);


