
PImage img; 
class star { 
  int x, y, z; 
  color c; 
  float size;
  star() { // constructor
    x = (int)random(0, 1000);
    y = (int)random(0, 1000);
    z = (int)random(0, -10000);
    c = color(random(0, 155), random(0, 155), random(0, 155)); 
    size = random(1, 3);
  }
  void render() { 
    stroke(c); 
    strokeWeight(size); 
    point(x, y, z);
  }
  void move() {
    z += 4;
  }
}
star[] stars;
int MAX_STARS = 10000;
float w=0, h=0;
int cnt =0;
int cnt_MAX = 300, cnt_MIN = 80;
void setup() {
  size(600, 600, P3D);
  stars = new star[MAX_STARS]; 
  for (int i=0; i< MAX_STARS; ++i) {
    stars[i] = new star();
  }
  img = loadImage("https://c1.staticflickr.com/1/91/265861563_9be6450167.jpg");
}
void draw() {
  background(0);
  for (int i=0; i< MAX_STARS; ++i) {
    stars[i].render();
    if (mousePressed) {
      stars[i].move();
    }
  }
  
  if(mousePressed){
      cnt++;
      println(cnt);
  }
  
  image(img, width/2 - w*0.5,height/2 - h*0.5, w, h);
  if(cnt> cnt_MAX) return;
  
  if(cnt>cnt_MIN){
  int alpha = (int)map (cnt, cnt_MIN, cnt_MAX, 0, 255);
  tint(255,255,255,alpha);
  
  w = map(cnt, cnt_MIN, cnt_MAX, 0, img.width);
  h = map(cnt, cnt_MIN, cnt_MAX, 0, img.height); 
  
  }
  


}

