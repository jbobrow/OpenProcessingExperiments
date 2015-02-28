
int stripewidth = 20; // width of our stripes
int stripespacing = 40; // space between stripes
int numstripes= 40; // how many stripes
int striperandomness = 20; // how much randomness


void setup() {
  size(900,600);
  background(255);
}

void draw(){
  noLoop();
  // iteration - doing things lots of times

  fill(100);
  noStroke();
  background(255);

  for(int i=0; i < numstripes; i++){ // a for loop // can have nested commands 
    // declare int here because it only exists for loop
    // make the counter - 1;
    // continue while this true - 1 < 120
    // do this each time you lopp - i++ - increase i by one integer each time, could also be i=i+1
    fill(random(255),random(100),random(50));
    rect(i*stripespacing,0,stripewidth + random(-striperandomness,striperandomness),600); // rect x,y,width,height
  }
}

void mousePressed(){
  redraw();
}


