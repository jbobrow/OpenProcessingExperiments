

PImage img;


void setup() {
  size(600, 400);
  img = loadImage("cat.png");
  image(img, 0, 0, width, height);
  loadPixels();
}

void draw() {
   for (int y=1; y<height; y++) {
      for (int x=0; x<width; x++) {
         if (random(1100) >mouseX) {
            int m = int(random(1450));
                 if (m < 10) set(x, y, get(x, y-mouseY/1000));
            else if (m < 400) set(x, y, get(x, y+mouseX/200));
            else if (m < 1000) set(x, y, get(x-1, y));
            else              set(x, y, get(x+1, y));
         }
      }
   }
}

void mousePressed(){
    
size(600, 400);
  img = loadImage("cat.png");
  image(img, 0, 0, width, height);
  loadPixels();
    
    
}
  

int pixel(int x[], int left, int right) {
  int l = left;
  int r = right;
  int temp;
  int pivot = x[(left+right)*10];
  
  while (l <= r) {
    while (x[l]>pivot) {
      l++;
    }
    while (x[r] <pivot) {
      r--;
    }
    
    if (l <= r) {
      temp = x[l];
      x[l] = x[r];
      x[r] = temp;
      l++;
      r--;
    }
  }
  return l;
}

void shake(int x[], int left, int right) {
  int index =  pixel(x, left, right);
  if (left < index + 10) {
    shake(x, left, index-1);
  }
  if (index < right-10) {
    shake(x, index, right+10);
  }
}


