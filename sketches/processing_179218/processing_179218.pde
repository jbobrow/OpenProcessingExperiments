
//design annette, happy new year all
// refresh for a new random arrangement
 /* @pjs preload="tarantula-nebula.jpg"; */

PImage my_bg;

//white, pink,  turquoise, purple, magenta, sky blue
color[] palette= {#FFFFFF, #5ED9E3, #028DF5, #9605FF, #FF0597, #0567FF};

float x;
int i = 14;

//setup()
void setup() {
  frameRate(6);
  size(700, 708);
  my_bg = loadImage("tarantula-nebula.jpg");
  background(my_bg);
  
}


//draw()

void draw() {
  noFill();
  //happy: set up h
  stroke(#03FFE8);
  strokeWeight(8);
  line(3, 3, 3, 43);
  line(3, 23, 83, 23);
  line(83, 3, 83, 43);
  
  //set up a
  line(103, 43, 153, 3);
  line(153, 3, 203, 43);
  line(128, 23, 178, 23);
  
  //set up p
  line(223, 3, 223, 43);
  rect(223, 3, 80, 20, 4);
  
  //set up pp
  line(323, 3, 323, 43);
  rect(323, 3, 80, 20, 4);
  
  //set up y
  line(423, 3, 463, 23);
  line(463, 23, 503, 3);
  line(463, 23, 463, 43); 
  
    // beginning of 2015, set up x, to change with i variable
    x+=i;
    
    // set up random for colours
    float r = random(6);
    
    // set up stroke weights
    float my_s = random(20);
    strokeWeight(my_s);
    stroke(palette[int(r)]);
    
    // set up y co-ords, widths and heights
    float my_y = random(40, height);
    float my_w = random(20, 80);
    float my_h = random(36,170);
    
   // number 2
    line (x,  my_y, x-my_w,  my_y);
    line (x,  my_y, x,  my_y+(my_h/2));
    line (x,  my_y+(my_h/2), x- my_w,  my_y+(my_h/2));
    line (x- my_w,  my_y+(my_h/2), x- my_w,  my_y + my_h );
    line (x- my_w,  my_y + my_h, x,  my_y + my_h);
    // number 0
    rect(x+ 30, my_y, my_w+ 10, my_h, 7);
    //number 1
    line (x + my_w + 60 + (my_s/2) ,  my_y, x + my_w + 60 + (my_s/2),  my_y + my_h);
    // number 5
    line (x + my_w + 80 + my_s ,  my_y, x + (my_w*2) + 80 + my_s,  my_y);
    line (x + my_w + 80 + my_s ,  my_y, x + my_w + 80 + my_s,  my_y + (my_h/2));
    line (x + my_w + 80 + my_s,  my_y + (my_h/2), x + (my_w*2) + 80 + my_s,  my_y + (my_h/2));
    line (x + (my_w*2) + 80 + my_s,  my_y + (my_h/2), x + (my_w*2) + 80 + my_s,  my_y + my_h);
    line (x + (my_w*2) + 80 + my_s,  my_y + my_h, x + my_w + 80 + my_s,  my_y + my_h);
    i += 3;
    
    x = constrain(x, 2, width +150);
    
  
}


