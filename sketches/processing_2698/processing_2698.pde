
// Sand Ripples
//
// Copyright (c) Alasdair Turner 2009
//
// Licensed under the Creative Commons GNU General Public License
//
// Just trying to make sand ripples with a CA-type approach...

void setup()
{
  size(400,400);
  colorMode(HSB);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      // initialise sand as random brightness
      set(i,j,color(32,96,random(256)));
    }
  }
}

void draw()
{
  for (int interlace = 0; interlace < 2; interlace++) {
    // scan from left to right, line by line
    for (int j = interlace; j < height; j += 2) {
      // a notional "wind" brightness (or "height")
      float b = random(256); 
      for (int i = 0; i < width; i++) {
        // drop the wind slightly
        b -= 2.0;
        float bj = brightness(get(i,j));
        // get brightness above and below
        float ba = brightness(get(i,(j+height-1)%height));
        float bb = brightness(get(i,(j+height+1)%height));
        // get brightness of particle ahead of this one
        float bja = brightness(get((i+width+1)%width,j));
        if (b < bj) {
          // if the wind is the same height as the sand, drop some sand, or pick some sand up
          b = bj + 2.0;
          if (bja >= bj || (ba >= bj && bb >= bj)) {
            // drop sand if there is sand either side of the current location,
            // or ahead of it (i.e., is there some "blocking" by nearby sand)
            bj += 2.0;
          }
          else {
            // otherwise take sand away if there is nothing to prevent it 
            // being taken up by the wind
            bj -= 2.0;
          }
        }
        else {
          // otherwise collapse existing sand ripples by merging them together
          bj = (ba + bb + bja) / 3.0;
        }
        set(i,j,color(32,96,constrain(bj,0,255)));
      }
    }
  }
}


