
// Global variables

PShape s;  // Vectorial image (check data file)
PImage photo;  // ".png" file picture used for emulating the herb/grass

int width = 800;  //  Canvas width
int height = width * 3/4;  //  Canvas height (3/4 of width)


// Canvas setup

void setup() {
  //background(162, 208, 255);        // ***Uncomment this one and comment the lower background (different painting)
  size(width, height);
  photo = loadImage("square.png");   // Photo load (.png fil)
  s = loadShape("curva.svg");        // Vector load (.svg file)
}

void draw() {

  int spread = 20;                  // Local variable for separation distance between objects
  int i;                            // Local variable for "x" distances between objects
  int j;                            // Local variables for "y" distances between objects
  int lx=50;                        // Local variable for separation distance between objects
  int r= int(random(10, 20));       // Local variable for the radius of the flower/fruits ellipses
  int pic;                          // Local  variable for establishing the "pic" file loop

  color [] palette = {              // Color array earthly colors
    #FFEF15, #E8BE13, #FFB621, #8D5518, #FF6A23
  };
  color [] palette2 = {             // Color array red/pink palette
    #FF85AA, #E80B6D, #FF1CA3, #8D156E, #FF1DE7
  };
  color [] palette3 = {             // Green palette
    #91FFC3, #16E83C, #40FF28, #4F8D1D, #C8FF08
  };


  frameRate(5);                      // Slow framerate for allowing correct animation
  background(162, 208, 255);        //*** Comment this one and uncomment the lower background (different painting)


  // Plant (Dark green colored triangles)
  for (lx=110;lx<650;lx+=40) {
    stroke(#59F52F);
    strokeWeight(3); 
    fill(#135501);
    triangle(random(lx+(mouseX/10), lx+(mouseX/10)+10), 50, lx, (width * 3/4)-50, lx+20, (width * 3/4)-50 );
  }

  // Leaves (Earthly colored triangles)
  for (lx=110;lx<650;lx+=40) {

    stroke(#8D5B18, random(150));  // Short top lines
    strokeWeight(random(3)); 
    fill(palette[int(random(6)-1)], random(100, 150));
    line(lx+random(50), height/2-random(mouseY/10), lx+20, height/2); 

    stroke(255, 150);             // Middle white lines
    line(lx+20, height/2, lx-random((mouseX/10)), ((width * 3/4)-50-mouseY/4-random(10))/1.2); 

    stroke(255, 150);             // Lower white lines
    line(lx+20, height/2, lx-random((mouseX/10)), ((width * 3/4)-50+mouseY/4-random(10))/1.2); 

    noStroke();                  // Inverted earthy color triangles
    fill(palette[int(random(6)-1)], random(100, 150));
    triangle(lx-random(5), height/2-random(mouseY/10), lx+20, height/2, lx+(mouseX/10), (width * 3/4)-50-mouseY/4-random(10));
  }


  // Flowers/Fruits
  for (lx=110;lx<650;lx+=40) {
    noStroke();                                                                    // Big lower ellipses
    fill(palette2[int(random(6)-1)], 150);
    ellipseMode(CENTER);
    ellipse(lx+(mouseX/10)-random(5), height/3.2-random(mouseY/10), r, r);  
    fill(palette[int(random(6)-1)], 150);                                          // Small lower ellipses
    ellipse(lx+(mouseX/10)-random(5, 15), height/3-random(mouseY/10), r/2, r/2);   
    fill(palette2[int(random(6)-1)], 150);                                         // Higher small ellipses
    ellipse(lx+(mouseX/10)-random(10, 20), height/4-random(mouseY/10), r/2, r/2);
  }

  // Herb
  tint(255, width-mouseX);                    // Fading of the pic as the mouse moves to the right
  for (pic=50;pic<700;pic+=random(20)) {
    image(photo, pic, random(470-mouseX/8.5, 500), random(7), 60);
  }


  // Rain vs. No Rain
  for (lx=50;lx<750;lx+=10) {
    stroke(100-mouseX/10, 100-mouseX/10, mouseX/2, 255-mouseX/5);    // Change into blue as the mouse moves to the right
    strokeWeight(random(3, mouseX/100));                              // Random distribution of strokeWeight as the mouse moves to the right
    line(lx, 50, lx, (width * 3/4)-50);
  }


  // Soil
  for (i=40; i<730; i+=random(spread)) {        // Iteration of vector shapes for recreating the soil
    for (j=540; j<560; j+=random(spread)) {
      shape(s, i, j, 30, 50);
    }
  }

  // Grass 
  for (i=40; i<730; i+=random(spread)) {        // Iteration of rectangles for recreating grass
    for (j=520; j<560; j+=random(spread)) {
      noStroke();
      fill(palette3[int(random(6)-1)], random(100));
      triangle(i, j, i+5, j, i+2.5, j-30);
    }
  }
}

void keyReleased() {                            // Pressing 's' will save a frame from the current animation on the project folder
 if(key=='s') saveFrame ("field-####.jpg");
}


