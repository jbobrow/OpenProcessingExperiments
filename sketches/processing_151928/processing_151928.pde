
int num = 40, amplitude = 80; // num = number of balls, amplitude = height of the wave
float theta, sz; // theta = used in the map function to cycle through a virtual TWO_PI circle, sz = the size of the balls

void setup() {
  size(660, 360);
  colorMode(HSB, 255, 100, 100);
  sz = width/num; // setting the size so that all the balls fit next to each other
}

void draw() {
  background(0);
  for (int i=0; i< (num+2); i++) { //adding two balls so that they 'leave' the window on the left and the right
    float offSet = (TWO_PI/num*i)*2; // adding an offSet of the theta value of the map function to have the balls all start at a different position, try omitting 'offset' in the map() function to see the difference
    float x = width/num*i; //calculating the position of each ball
    float y = map(sin(theta+offSet), -1, 1, height/2-amplitude/2, height/2+amplitude/2); // mapping y to the sin value of (theta+offSet) to get the wave movement
        float f = map(sin(theta/2+offSet/4),-1,1,0,255); // mapping y to the sin value of (theta+offSet) to get the wave movement
    //fill(255/num*i, 90, 90); //calculating the current color value (you 'slice' the 255 in 'num' pieces and that add 'i' of this pieces together again
    fill(f, 90, 90);
    ellipse(x, y, sz, sz);
  } 
  theta += 0.06; // the speed of the ewave
}
