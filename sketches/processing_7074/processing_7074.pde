
PImage[] images = new PImage[9];

brush[] brushes = new brush[images.length];

int brush_res = 12;
float brush_overlap = 1.8;
float brush_radius_min = 6;
float brush_radius_max = 18;
float brush_vx = 3;
float brush_vy = 3;

int abrush;

boolean painting = true;
boolean simple = false;

void setup(){
  //load images
  for(int i=0;i<images.length;i++){
    String s = (i+1)+".jpg";
    images[i] = loadImage(s);
  }
  //setup
  background(0);
  noStroke();
  ellipseMode(CENTER);
  size(400,450);
  //generate brushes
  for(int i=0;i<brushes.length;i++){
    brushes[i] = new brush(random(brush_radius_min,brush_radius_max),i);
  }
}

void draw(){
  for(int i=0;i<brushes.length;i++){
    brushes[i].move();
    brushes[i].paint();
  }
}

class brush{
  float rad,x,y,vx,vy;
  int im;
  boolean active;
  brush(float _rad,int _im){
    rad = _rad;
    im = _im;
    x = rad+random(width-2*rad);
    y = rad+random(height-2*rad);
    vx = random(-brush_vx,brush_vx);
    vy = random(-brush_vy,brush_vy);
    active = false;
  }
  void move(){
    if(active==true){
      x = mouseX;
      y = mouseY;
    }else{
      x += vx;
      y += vy;
      if(x>width-rad||x<rad){
        vx *= -1;
      }
      if(y>height-rad||y<rad){
        vy *= -1;
      }
    }
  }
  void paint(){
    int px,py;
    float a,d;
    if(simple==true){
      //simpler polygon-based brush, less accurate
      beginShape(POLYGON);
      texture(images[im]);
      for(int i=0;i<brush_res;i++){
        a = i*TWO_PI/brush_res;
        px = int(floor(x+cos(a)*rad+.5));
        py = int(floor(y+sin(a)*rad+.5));
        vertex(px,py,px,py);
      }
      endShape();
    }else{
      //accurate pixel-based brush, processor intensive
      for(int r=0;r<rad;r++){
        d = TWO_PI*r;
        d *= brush_overlap;
        for(int i=0;i<d;i++){
          a = i*TWO_PI/d;
          px = int(floor(x+cos(a)*r+.5));
          py = int(floor(y+sin(a)*r+.5));
          set(px,py,images[im].get(px,py));
        }
      }
    }
  }
}

//array shuffler
float[] shuffle(float[] arr){
  for(int i=0;i<arr.length;i++){
    float tem = arr[i];
    int ran = int(floor(random(arr.length)));
    arr[i] = arr[ran];
    arr[ran] = tem;
  }
  return arr;
}

void keyPressed(){
  if(key=='i'||key=='I'){
    image(images[int(floor(random(images.length)))],0,0);
  }
}

void mousePressed(){
  abrush = int(floor(random(brushes.length)));
  brushes[abrush].active = true;
}

void mouseReleased(){
  brushes[abrush].active = false;
}

