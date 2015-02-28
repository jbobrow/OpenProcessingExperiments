
/* @pjs preload="me.jpg"; */
float max_distance;
void setup (){
  size (600,650);
  max_distance = dist(0, 0, width, height);
  
}

void draw() {
  background(255);
PImage im = loadImage("me.jpg");
image(im,0,0,600,650);
image(im, 0, 0);
image(im, 50, 50);
filter(BLUR, 6);
image(im, 0, 50);
filter(POSTERIZE, 3);


noStroke();
fill(100,47,124);
rect(0,0,50,650);
fill(100,32,27);
rect(0,0,50,50);
fill(215,136,133);
rect(0,50,50,50);
fill(126,122,38);
rect(0,100,50,25);
fill(126,122,38);
rect(0,175,50,55);
fill(100,32,27);
rect(0,230,50,50);
fill(215,136,133);
rect(0,280,50,22);
fill(126,122,38);
rect(0,340,50,45);
fill(100,32,27);
rect(0,400,50,50);
fill(215,136,133);
rect(0,450,50,25);
fill(100,47,124);
rect(0,475,50,40);
fill(126,122,38);
rect(0,500,50,40);
fill(100,32,27);
rect(0,500,50,40);
fill(126,122,38);
rect(0,540,50,35);
fill(215,136,133);
rect(0,575,50,50);


  fill(100,47,124);
  for(int i = 0; i <= width; i += 30) {
    for(int j = 0; j <= height; j += 30) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 22;
      ellipse(i, j, size, size);
    }
  }
}



