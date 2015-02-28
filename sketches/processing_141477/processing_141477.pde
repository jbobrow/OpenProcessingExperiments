
///////
// "Missing" HW #8
// March 25, 2014
// Patrick J. O'Donnel
//////

///////
// image source: 'http://farm3.static.flickr.com/2085/2266613433_b2fbc97c4e.jpg'
///////

///////
// need more work with pixels to achieve commented part at end of code
///////

PImage photo;

void setup() {
  size(1000,600);
  photo = loadImage("family.jpg");
  noStroke();
  smooth();
}

void draw() {
  image(photo, 0, 0, 1000,600);
  fill(0);
  rectMode(CENTER);
  rect(192, 207, 58, 11); 

  
  //////////////
  //pixel manipulation (whiteout)
  loadPixels();
  
  //for loop to call out all pixels
  for (int i = 0; i < width*height; i++) {
    
    //if statement based on 2185 missing children/day
    if (random(72709632) < 797525.00) {
      
      pixels[i] = color(255);
      
    } //--end of if(random)
  }//--end of for
      
  updatePixels();
  noLoop();
  
  /*
  /////////////
  //pixel manipulation (smear)
  loadPixels();
  
  //for loop to call out all pixels
  for (int i = 0; i < width*height; i++) {
    
    //if statement based on 2185 missing children/day
    if (random(72709632) < 718.40) {
      
      color c = get(i/width
      getpixels[i] = color(255);
      
    } //--end of if(random)
  }//--end of for
      
  updatePixels();
  noLoop();
  */
  
}//--end of draw
