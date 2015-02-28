

int stripewidth = 5; // width of our stripes
int stripespacing = 15; // space between stripes
int numstripes = 100; // how many stripes
int striperandomness = 25;// how much randomness

void setup(){
  size(600,600);
  background(255);
}

void draw(){
  noLoop();
  // iteration - doing things lots of times
  fill(100);
  noStroke();
  for(int i = 0; i < numstripes; i = i+1 ){ // a for loop 
    fill(i*20,random(100),100 - i*5);  
    rect(i*stripespacing,0,stripewidth + random(-striperandomness,striperandomness),600); // rect x y width height
    // make the counter - i ; 
    // continue while this is true - i < 20;
    // do this each time you loop - i++ - increase i by 1
  }
}




