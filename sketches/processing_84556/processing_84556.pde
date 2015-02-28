

int box_size = 25;
color[] boxes = new color[1000];

void setup()
{
  int n = int(sqrt(boxes.length));
  size(box_size * n, box_size * n);
  frameRate(30);
  for(int i = 0; i < boxes.length; i++) {
    boxes[i] = color(random(255), random(255), random(255));
  }
}

void draw()
{
  int n = int(sqrt(boxes.length));
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
      color c = boxes[i*n+j];
      if(red(c) == 255 && green(c) == 255 && blue(c) == 255 && frameCount % 60 == int(random(60))) {
        boxes[i*n+j] = color(random(255), random(255), random(255));
      } else {
        boxes[i*n+j] = color(red(c)+2, green(c)+2, blue(c)+2);
      }
      fill(boxes[i*n+j]);
      rect(i * box_size, j * box_size, i * box_size + box_size, j * box_size + box_size);
    }
  } 
}


