
// MODIFICATION + ADAPTATION TO
// http://www.openprocessing.org/sketch/4879  BY  KYLE MCDONALD
// WITH HELP FROM MICHAEL KONTOPOULOS


int[] values;
//int levels =5;
float noiseScale = .01;
float t;

void setup() {
  size(500, 500, P3D);
  values = new int[width * height];
  background(0);
  noiseDetail(7,0.32); //line fluidity 6, .3
}

void draw() {
  fill(0);
  rect(0, 0, width, height);

  float offset = frameCount * .008; //speed of lines generating

  // first pass: compute values
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int i = y * width + x; //location of pixels
      float d = dist(x, y, mouseX, mouseY);
      float levels = map(d, 0, 160, 0, 20); //lines
      float t1=x*noiseScale;
      float t2=y*noiseScale;
      values[i] = (int) (levels * noise(t1,t2, offset)); //line distances between each other
      t1+=50;
      t2+=50;
      
       if (mousePressed == true) {
        
      values[i] = (int) (levels * noise(x*noiseScale/-1.1,y*noiseScale/1.1)); //offset value creates motion, no offset=static
//        t+=mouseX/10.0;
//          t+=0.000001;
//    t+=5; //sort of radiates but not at mouse x*noiseScale/t
          
         
    }
//            stroke(values[i]*25.5); //scale from 0-10 to 0-255
//            point(x,y);

      
    }
  }

  // second pass: check neighborhood

  //Try commenting out this whole chunk (before load() and after update() and uncommenting
  //the two lines above (stroke,point) to see what you're actually "tracing"
  loadPixels();
  for (int y = 1; y < height; y++) {
    for (int x = 1; x < width; x++) {
//      float bright = map(x,0,255,mouseX,mouseY);
      int i = y * width + x;
      int center = values[i];
      if ( center != values[i -1] || center != values[i - width]) {  // i-(value) - > thickness of lines
        pixels[i] = color(255);
      }
     
    
      
    }
  }
  updatePixels();
}


