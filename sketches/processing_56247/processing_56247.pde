
int gap,sections;
color[] hues;


void setup() {
  size(600, 500);
  gap = 5;
  sections = 6;
  hues =   new color[4];
  hues[0] =  color( 255, 255, 255);
  hues[1] =  color( 255, 0, 0);
  hues[2] = color(0, 255, 0);
  hues[3] =  color(0, 0, 255);
  noStroke();
}

void draw() {
  background(0);

  for ( int c = 0; c<sections; c++ ) {
    for ( int d = 0; d<sections; d++ ) {
      if ( floor(random(2)) == 0 ) {
        fill( hues[0] );
      } else {
        fill( hues[ floor(random(3))+1 ] );
      }
      int gaps = sections +1;
      float boxWidth = (width - (gap*gaps)) / sections;
      float boxHeight = (height - (gap*gaps)) / sections;
     // rect ( ( ((*sections)/sections) *c ) + (gap*c) + gap, ( ((width-gap*sections)%(width/sections)) *d ) + (((gap*sections)%(width/sections))*d) +gap, ((width-gap*sections)/sections), ((width-gap*sections)/sections)  );
       // rect ( ( ((width-gap*sections)/sections) *c ) + (gap*c) +gap, ( ((height-gap*sections)%(height/sections)) *d ) +gap, boxWidth, boxHeight  );
        //rect ( ( boxWidth *c ) + (gap*c) +gap, ( ((d*boxWidth) % ( boxWidth*sections )) * boxHeight ) +gap, boxWidth, boxHeight  );
        rect ( ( boxWidth *c ) + (gap*c) +gap, ( boxHeight *d ) + (gap*d) +gap , boxWidth, boxHeight  );
    }
  }
}

