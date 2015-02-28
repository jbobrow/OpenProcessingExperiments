
float counter = 0;
int WIDTH = 250;
int HEIGHT = WIDTH;
int SPACE = 1;
int NUM_SQUARES = WIDTH / (SPACE * 2);

color teal = color(153,255,204);
color pink = color(221,85,136);
color seaG = color(171,230,117);
color blue = color(51,34,99);

void setup(){
  size(500,500);
  background(pink);
}

void draw(){
  color from = lerpColor(pink,blue,(sin(counter*20)+1)/2);
  color to = lerpColor(teal,seaG,(sin(counter*20)+1)/2);
  translate(WIDTH,HEIGHT);
  background(from);
  for(int i = 1; i < NUM_SQUARES; i++){
    rotate(counter);
    color f = lerpColor(from,to,float(i)/float(NUM_SQUARES));
    stroke(f);
    fill(f);
    rect(i*SPACE,i*SPACE,WIDTH-(i*SPACE*2),HEIGHT-(i*SPACE*2));
  }
  counter += 0.0007;
}
