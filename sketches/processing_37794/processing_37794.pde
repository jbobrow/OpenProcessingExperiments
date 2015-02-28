
// Ben Light
// ben@bl1236@nyu.edu
// ICM Week 1
// September 18, 2011

// Colors used
// #ffffff - white background
// #333f17 - stripe, large squares
// #bb9300 - small tirangles
// #677784 - small squares

// Universal
  size(550, 350);
  smooth();
  background(#ffffff);

// diagnol stripe
  fill(#333f17);
    quad(0,62, 62,0, 412,350, 288,350);

//square 1, left
    rect(45,45,124,124);
  
  fill(#bb9300);
    triangle(45,45, 107,45, 76,14);
    triangle(107,45, 169,45, 138,14);

    triangle(45,45, 45, 107, 14,76);
    triangle(45,107, 45,169, 14,138);

  fill(#ffffff);
    triangle(169,107, 200,138, 169,169);
    triangle(107,169, 169,169, 138,200);

  fill(#677784);
    quad(107,169, 138,200, 107,231, 76,200);
    quad(169,107, 200,138, 231,107, 200,76);

  fill(#333f17);
    quad(107,231, 231,107, 245,121, 121,245);
  
  fill(#677784);
    quad(107,231, 121,245, 107,259, 93,245);
    quad(231,107, 245,93, 259,107, 245,121);

// square 2, right
  fill(#333f17);
    rect(405,109,132,132);
  
  fill(#bb9300);
    triangle(405,109, 471,109, 438,76);
    triangle(471,109, 537,109, 504,76);
  
  fill(#677784);
    quad(438,76, 471,43, 504,76, 471,109);
  
  fill(#bb9300);
    triangle(405,241, 471,241, 438,274);
    triangle(471,241, 537,241, 504,274);

  fill(#677784);
    quad(438,274, 471,241, 504,274, 471,307);

  fill(#bb9300);
    triangle(537,109, 570,142, 537, 175);
    triangle(537,175, 570,208, 537,241);

  fill(#677784);
    quad(537,175, 570,142, 603,175, 570,208);

  fill(#bb9300);
    triangle(405,109, 405,175, 372,142);
    triangle(405,175, 405,241, 372,208);

  fill(#677784);
    quad(339,175, 372,142, 405,175, 372,208);

//border around square 2
  fill(#333f17);
    quad(603,175, 618,190, 471,337, 456,322);
    quad(471,43, 486,28, 618,160, 603,175);
    quad(486,28, 471,13, 324,160, 339,175);
    quad(324,190, 339,175, 471,307, 456,322);
  
// triangle top right
    triangle(525,350, 550,350, 550,325);
// triangle bottom left
    triangle(525,0, 550,0, 550,25);
  
// trim off of square 2
// trimming off diamond with white rectangle
  stroke (#ffffff);
  fill(#ffffff);
  quad(362,122, 362,228, 312,228, 312,122);
  stroke (#000000);
  line(362,122, 362,228);

// Panel Lines
// un-comment thses if you want to see the panel seams
//  stroke(#cccccc);
//  line(110,0,110,350);
//  line(220,0,220,350);
//  line(330,0,330,350);
//  line(440,0,440,350);
 
//guid lines
//line(0,0,350,350); // quide
//line(471,0,471,350);
//line(0,175,550,175);

