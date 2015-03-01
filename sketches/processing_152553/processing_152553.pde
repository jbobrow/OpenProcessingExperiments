
/* @pjs preload="rainybackground.jpg"; 
 */

// declare globals
ArrayList <Rain> raindrops;

int numberOfRaindrops = 200;
int max_rainFlow = 2000;
int min_rainLength = 20;
int max_rainLength = 100;

boolean backdrop = true;
boolean fast_fps = true;
boolean real_drops = true;

boolean OSD = false;
int osd_x = -190;

PImage bg;



void setup() {
  size( 600, 600 );
  colorMode( HSB );
  raindrops = new ArrayList<Rain>();
  bg = loadImage("rainybackground.jpg");
  // populate raindrops array  
  for (int i=0; i<max_rainFlow; i++) {
    raindrops.add(new Rain(i) );
  } // end for(i)
} // end setup()



void draw() {
  if (backdrop) { background( bg ); } else { background ( 255 ); }
  for (int i=0; i<numberOfRaindrops; i++) {
    raindrops.get(i).MakeRain();
  } // end for(i)
  // display OSD
  if (OSD) { Display_OSD(); } else { Hide_OSD(); } // end if(OSD)
} // end draw()



class Rain {
  int index;
  float x, y, speed, x_offset, alpha, rainLength;

  // set initial variables for an element
  Rain ( int index ) {
    this.index = index;
    x = random( width );
    y = random( height );
    rainLength = random( min_rainLength, max_rainLength );
    alpha = random( min_rainLength, rainLength );
    speed = random( min_rainLength, rainLength );
    x_offset = random ( -2, 2 );
  } // end setup Rain()


  void MakeRain() {
    float middle_tail = this.rainLength*0.5;
    float end_tail = this.rainLength*0.8;
    // update y position by speed
    this.y += speed;
    this.x += x_offset;
    // check if fallen off bottom of screen and reset
    if ( this.y > height+this.rainLength ) { 
      this.y = random( -200, 0 );
      this.x = random( width );
      this.rainLength = random( min_rainLength, max_rainLength );
      this.alpha = random( min_rainLength, this.rainLength );
      this.speed = random( min_rainLength, this.rainLength );
      this.x_offset = random( -2, 2 );
    }
    // draw the raindrops on screen
    // if real_drops is false then colour the rain drops red with no transparency
    if (!real_drops) { 
      stroke ( 0, 255, 255 );
    }
    if (real_drops) { 
      stroke( 0, 0, 128, this.alpha);
    }
    line( this.x, this.y, this.x, this.y-middle_tail );
    if (real_drops) { 
      stroke( 0, 0, 128, this.alpha*0.5);
    }
    line( this.x, this.y-middle_tail, this.x, this.y-end_tail );
    if (real_drops) { 
      stroke( 0, 0, 128, this.alpha*0.2);
    }
    line( this.x, this.y-end_tail, this.x, this.y-this.rainLength );
  } // end MakeRain()

} // end class Rain()



void Display_OSD() {
  Show_OSD();
  if (osd_x < 0) { osd_x+=5; }
}

void Hide_OSD() {
  Show_OSD();
  if (osd_x > -190) { osd_x-=5; }
}

void Show_OSD() {
  fill(0, 0, 0, 50);
  rect(osd_x, 0, 185, 85);
  fill(0, 0, 255);
  text("key b toggles background image", osd_x+5, 15);
  text("key f toggles frame rate", osd_x+5, 30);
  text("key r toggles rain drop style", osd_x+5, 45);
  text("key UP increases rain flow", osd_x+5, 60);
  text("key DOWN decreases rain flow", osd_x+5, 75);
  text("Rain Flow="+numberOfRaindrops, osd_x+5, 595);
}


void keyPressed() {

  // toggle background picture
  if (key == 'b') { if (backdrop) { backdrop=false; } else { backdrop=true; } }
  // toggle frame rate
  if (key == 'f') { if (fast_fps) { fast_fps=false; frameRate(2); } else { fast_fps=true; frameRate(60); } }
  // toggle raindrop style
  if (key == 'r') { if (real_drops) { real_drops=false; } else { real_drops=true; } }
  // toggle OSD
  if (key == ' ') { if (OSD) { OSD=false; } else { OSD=true; } }

  if (key == CODED ) {
    // increase rain flow
    if (keyCode == UP) { numberOfRaindrops += 20; if (numberOfRaindrops > max_rainFlow) { numberOfRaindrops = max_rainFlow; } }
    // decrease rain flow
    if (keyCode == DOWN) { numberOfRaindrops -= 20; if (numberOfRaindrops < 0) { numberOfRaindrops = 0; } }
  } // end if key(CODED)
} // end keyPressed()


