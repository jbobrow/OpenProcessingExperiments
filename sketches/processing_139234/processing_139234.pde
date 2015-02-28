
//ARTISTIC STATEMENT

//"Brownies for Brown is using for and while to make
//a distinct pattern using the color palette theme. 


//Setup canvas
color[] theme = {#8F3F21, #B76239, #742A15, #571609, #280705};
color[] palette = theme;
float counter = 0;

void setup(){
  size(960, 960);
  background(palette[int(random(0,5))]);
}

//Setup the while and for loops
void draw() {
  while(counter < width) {
    stroke(palette[int(random(0, 5))]);
    strokeWeight(int(random(1, 3)));
    noFill();
    //fill(palette[int(random(0, 5))]);
    float a = random(width);
    float b = random(height);
    float c = random(width/2);
    float d = random(height/2);
    float e = random(0, TWO_PI);
    float f = random(0, TWO_PI);
    arc(a, b, c, d, e, f);
    ellipse(a, b, c, d);
    counter++;
  }
  for(int i = 30; i < width-30; i = i+5) {
    for (int j = 30; j < width-30; j = j+5) {
      point(i,j);
      strokeWeight(int(random(1,3)));
    }
  }
//Setup saving options, this one is for .png  
if (keyPressed) {
  saveFrame("images/artwork-###.png");
  }
}

