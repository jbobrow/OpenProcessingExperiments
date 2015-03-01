
float counter = 20;
int WIDTH = 300;
int HEIGHT = WIDTH;
int SPACE = 3;
int NUM_SQUARES = WIDTH / (SPACE * 1);

color teal = color(200,200,204);
color pink = color(121,85,136);
color seaG = color(150,100,120);
color blue = color(151,34,39);

void setup(){
  size(600,600);
  background(pink);
}

void draw(){
  color from = lerpColor(pink,blue,(sin(counter*20)+1)/2);
  color to = lerpColor(teal,seaG,(sin(counter*10)+1)/2);
  translate(WIDTH,HEIGHT);
  background(from);
  for(int i = 1; i < NUM_SQUARES; i++){
    rotate(counter);
    color f = lerpColor(from,to,float(i)/float(NUM_SQUARES));
    stroke(f);
    fill(f);
    ellipse(i*SPACE,i*SPACE,WIDTH-(i*SPACE*1),HEIGHT-(i*SPACE*1));
  }
  counter += 0.0007;
}
