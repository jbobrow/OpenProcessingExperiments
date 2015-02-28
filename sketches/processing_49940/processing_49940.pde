
Pown pown;
int numFrames = 5;  // The number of frames in the animation
int frame = 0;

PImage[] images = new PImage[numFrames];
int r;
int i=0;
int j;
int var_col = -50;
int var_col2 = -50;
int var_x = -50;
int var_y = -50;
int var_x2 = -50;

int maxconfetti = 30;
Pown[] confs=new Pown[maxconfetti]; //this makes an array of 50 confettis

int p=0;    // number of confettis that is created already
int windowsize=400;



void setup() {

  size(windowsize, windowsize);
  for ( int r = 0; r< 5; r++ ) {
    images[r] = loadImage( r + ".png" );   // make sure images "0.jpg" to "11.jpg" exist
  }
}

void draw() {

  frame = (frame) % numFrames;  // Use % to cycle through frames
  image(images[frame], 115, 30);
  for (i =0; i <9; i++)
  {
    var_col += 50 ;
    var_x += 100;
    line(var_col, 0, var_col, height);
    rect(0, var_x-50, 49, 49);
    rect(var_x-50, 0, 49, 49);
    rect(100, var_x-50, 49, 49);
    rect(200, var_x-50, 49, 49);
    rect(300, var_x-50, 49, 49);
    stroke(255);
    smooth();


    for (j =0; j <9; j++) {

      var_col2 += 50 ;
      var_x2 += 100;

      line(0, var_col2, width, var_col2);
      line(var_col, 0, var_col, height);


      rect(50, var_x2, 49, 49);
      rect(150, var_x2, 49, 49);
      rect(250, var_x2, 49, 49);
      rect(350, var_x2, 49, 49);
      rect(450, var_x2, 49, 49);
      stroke(255);
      smooth();
    }
  }








  for (int k=0; k<p; k++)         // i contains the number of confettis created so far

  { 
    confs[k].move_confetti();
    confs[k].collide();
    confs[k].draw_confetti();
  }
}


void changeImage() {
  if (frame<5)
  { 
    frame++;
  }
  else frame = 0;
}

void mousePressed() {  
  changeImage();  
  
  if (i<maxconfetti)
  { 
    confs[p] = new Pown();   // a new confetti is only created here!
    p++;
  };
}


