
float boxSize =90;
float margin = boxSize*2;
float depth = 600;
color boxFill;
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
PImage logo;  // Declare variable "a" of type PImage

void setup() {
  size(500, 300, P3D);
  noStroke();
  noiseDetail(13,5);
  frameRate(13);
  hint(ENABLE_DEPTH_SORT);
//  logo = loadImage("KRDlogo-01.jpg");
  logo = loadImage("logo02.jpg");
  smooth();
}

void draw() {
//  background(#CC9966 4A4242);CEB9A4
  background(#4A4242);
  
  // Displays the image
//  image(logo, 15, 250, logo.width/3, logo.height/3);  
//  image(logo, 10, 270); 

//    lights();
//directionalLight(251, 252, 155, -1, 1, 0);
//directionalLight(251, 152, 255, 0, -1, 1);
directionalLight(151, 252, 255, 1, 0, -5);
ambientLight(11, 12, 16);
specular(255, 255, 255);

  
  // Center and spin grid
  translate(width/2, height/2, -depth/2);

newXmag = mouseX/float(width) * TWO_PI/3;
  newYmag = mouseY/float(height) * TWO_PI/3;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/14.0; }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/14.0; }
  
  rotateX(-ymag); 
  rotateY(-xmag); 



//    rotateY(map(mouseX, 0, width, 0, PI));
//    rotateZ(map(mouseY, 0, height, 0, -PI));
 rotateY(frameCount * 0.0051);
  rotateX(frameCount * 0.0051);
  
  
//random noise
float phi = random(TWO_PI);


  // Build grid using multiple translations 
  for (float i =- depth/2+margin; i <= depth/2-margin; i += boxSize+80){
    pushMatrix();
    for (float j =- height+margin; j <= height-margin; j += boxSize+80){
      pushMatrix();
      for (float k =- width+margin; k <= width-margin; k += boxSize+80){
        // Base fill color on counter values, abs function 
        // ensures values stay within legal range
        boxFill = color(abs(i)+100, abs(j)+100, abs(k)+100, 100);
        pushMatrix();
        translate(k, j, i);
//        translate(k+phi, j+phi, i+phi); // jitter
        fill(boxFill);
        box(boxSize, boxSize, boxSize);
//        ellipse(boxSize, boxSize, boxSize, boxSize*2);
//        sphere(boxSize);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
    image(logo, -375, -71);
}

  void mousePressed() {
    link("http://www.keithrowelldesign.blogspot.com", "_blank");
  }

