
// Edinburgh's One o' clock gun
//
// Visualising the speed of sound on a map in real time
//
// Every day in Edinburgh, at 1300 hours a gun is fired from the Castle.
// This is done to scare tourists, but in centuries past it was an important way for people
// to synchronize their clocks.
//
// Because the speed of sound is surprisingly slow, there can be a noticable gap between
// seeing the smoke and hearing the bang. This map attempts to visualise the movement
// of the sound wave in real time, superimposed on an OpenStreetMap.
//
// You can see an earlier historical map here, which I used for inspiration (and calibration)
// http://www.edinphoto.org.uk/1_map_2/1_map_edinburgh_1861_time-gun_-_whole_map.htm#map
//
// The settings are currently set to match the historical map. Uncomment/comment out the
// appropriate code to change to use the current gun location!
//
// Props:-
// map : openstreetmap.org
// steven kay, sept 2010

PImage embra; //631x631 mercator export from openstreetmap.org
int fc=0;

float[][] dd; //euclidian distance from centre

// current gun location
//float xcentre=316;
//float ycentre=316;

// old location. Use this to compare to the historical gun map :)
float xcentre=329;
float ycentre=321;


float FRAMERATE=15.0; // frames per second
float pixelspersec=30.1*1.2; // pixels per second
float travelled=0.0; // distance sound wave has travelled, in pixels

void setup() {
  size(631,631,P2D);
  embra=loadImage("edinburgh.png");
  fc=0;
  // pre-compute the distance of each pixel from the gun's location
  dd=new float[632][632]; // y then x
  for (int y=0;y<632;y++) {
    for (int x=0;x<632;x++) {
      dd[y][x]=mag(y-ycentre,x-xcentre);
    }
  }
  frameRate(FRAMERATE);
}

void mousePressed() {
  travelled=0.0;
}

void draw() {
  // aiming for a constant-time rendering, i.e. frames don't take any longer to render
  // as the shockwave grows in size. This would probably happen if I used ellipse(), for
  // example. Hence using pixel blitting.
  loadPixels();
  for (int ix=0;ix<398161;ix++) {
    int y=ix/631;
    int x=ix%631;
    // istrip is true if distance is close to a whole number of seconds.
    // used to display red rings for each second
    boolean istrip=((dd[y][x]%pixelspersec)<2);
    if (dd[y][x]<=travelled) {
      // the 'and' in the next line seems pointless, but was done to make sure that
      // each frame takes the same amount of time. It's possible that the compiler
      // optimises it out, but i thought i'd put it in anyway :)
      // Inside shockwave, show map pixel
      pixels[ix]=embra.pixels[ix]&0xFFFFFFFF;
      if (istrip) pixels[ix]=0x55FF0000;
    } else {
      // outside shockwave, show a greyed out pixel.
      pixels[ix]=embra.pixels[ix]&0x663F3F3F;
      if (istrip) pixels[ix]=0x55FF0000;
    }
  }
  updatePixels();
  travelled+=(pixelspersec/FRAMERATE);
  //if (frameCount%50==0) print(frameRate+"fps\n");
}

