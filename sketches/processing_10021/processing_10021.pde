
// Number of recursions
int max_r = 3;

// Canvas width and height
int canvas_size = 500;

// precomputation (do not change)
float sqrt2 = sqrt(2);

// usual program wide initializations
void setup() {
  size(canvas_size,canvas_size);
  background(0,0,0);
  smooth();
  frameRate(60);
  rectMode(CENTER);
}

// looping
void draw() {
  fade_out_screen();
  move_to_screen_center();
  draw_square(
    0,  // iterations
    width*sqrt2/2, // half the diagonale size
    radians( frameCount % 360 ) // fancy rotation
    );
}

// recursive functions drawing a square with four rotated squares inside
void draw_square( int step, float my_size, float angle ) {
  // diagonale length
  float my_diag     = my_size * sqrt2;
  // childs size and diagonale length :
  float childs_size = my_diag / 4;
  float childs_diag = childs_size * sqrt2;

  // colorize squares (FIXME)
  stroke(255); fill( 126 + 126 * step / max_r, 127 );
  
  // rotate and draw square
  rotate( angle );
  rect( 0, 0, my_size, my_size );

  // a new iteration step begin
  step++;
  if( step >= max_r ) { return; /* exit recursion */ }
  
  pushMatrix();
  
    // The following array is made of (x,y) translations vectors
    // used to draw the four squares from the parent square center
    float [][] xy = {
      {  my_size/4 ,  my_size/4  },
      { -my_size/2 ,          0  },
      {          0 , -my_size/2  },
      {  my_size/2 ,          0  },
    };
    
    // apply above translations
    for( int tr_num=0; tr_num<4; tr_num++ ) {
      translate( xy[tr_num][0], xy[tr_num][1] );

      pushMatrix();
        draw_square(step,childs_size, angle);
      popMatrix();
    }

  popMatrix();
}


// Draw a transparent black rectangle to fade out smoothly
void fade_out_screen() {
  fill(0,10);
  stroke(0);
  rect(width/2,height/2,width,height);
}

void move_to_screen_center() { translate(width/2,height/2); }

