
int x, y, i;
float xs, ys, a, d; 
PImage img;

void setup(){
  img = loadImage("photo-3.JPG");
  size(600, 600);
  background(0);
  noStroke();
  smooth();
  xs = random(img.width);
  ys = random(img.height);
  x=y=0;
  i = 1;
  a = PI/2;
  
  for(int q = 0; q < width * height; q++){
    fill(img.get(int(xs), int(ys)));
    xs = (img.width + xs + cos(a)) % img.width;
    ys = (img.height + ys + sin(a)) % img.height;
    fill(img.get(int(xs), int(ys)));
    //a+=(frameCount % 50) * d;

    if(x == width - 1){
      y++;
      i = - 1;
      rect(x, y, 1, 1);
      x = x + i;   
    } else if (x == 0){
      y++;
      i = 1;
      rect(x, y, 1, 1);
      x = x + i;
    } else {
      x = x + i;
      rect(x, y, 1, 1);
    }
  }
}

void draw(){
}

void mouseClicked(){
  setup();
}

