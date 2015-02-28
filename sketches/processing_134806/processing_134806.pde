
PImage photo;
PGraphics fog;
float x1, y1;

void setup(){
  photo = loadImage("img.jpg");
  size(500,500);
  //image(photo, 0, 0);
  smooth();
  fog = createGraphics(width,height);
  fog.beginDraw();
  fog.smooth();
  fog.noStroke();
  fog.fill(255,250);
  fog.rect(0,0,width,height);
  fog.endDraw();
}

void draw(){ 
  image(photo, 0, 0, width, height);
  image(fog,0,0);
  x1=mouseX; y1=mouseY;
  fogging();
  /*
  copy(photo,mouseX, mouseY, 10, 10, mouseX+20, mouseY+20, 50, 50);
  stroke(255);
  noFill();
  ellipse(mouseX, mouseY, 10, 10);*/
}

void mouseMoved() {
  defogging();
}

void fogging() {
  fog.beginDraw();
  fog.noStroke();
  fog.filter(BLUR, 1);
  fog.fill(255,5);
  fog.rect(0,0,width,height);
  float r=random(20);
  fog.fill(255,180);
  fog.ellipse(random(width),random(height),r,r);// let it snow!
  fog.endDraw();
}

void defogging() {
  //println("x1="+x1+":"+y1);
  //println("mouse="+mouseX+":"+mouseY);
  
  float dis= dist(x1,y1,mouseX,mouseY);
  float dis1 =map(dis,0,350,40,0);

  fog.beginDraw();
  fog.loadPixels();
  
  //println("dist="+dis+":"+dis1);
  
  for (int x=0; x<fog.width; x++) {
    for (int y=0; y<fog.height; y++ ) {
      if (dist(x,y,mouseX,mouseY) <= dis1) {
        int pix = x + y*fog.width;
        fog.pixels[pix] = color(0,0);
      }
    }
  }
  
  
  fog.updatePixels();
  fog.endDraw();
}


