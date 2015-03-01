
PGraphics colorWheel;
PGraphics sliderWheel;
int cwx;
int cwy;
float cwr=200;
ArrayList <ColorSlider> colorSliders;
int selectedCs=-1;
Slider hueSlider;
Slider saturationSlider;
Slider brightnessSlider;

ColorSlider mycs;
void setup() {
  size(800, 800);
  frameRate(200);
  ellipseMode(CENTER);
  colorMode(HSB, 360, 255, 255);
  colorSliders=new ArrayList<ColorSlider>();
  hueSlider=new Slider(200, height-80, 200, 55, 0, 360);
  saturationSlider=new Slider(200, height-50, 200, 55, 0, 255);
  brightnessSlider=new Slider(200, height-20, 200, 55, 0, 255);
  cwx=width/2;
  cwy=height/2;
  colorWheel=createGraphics(2*(int)cwr, 2*(int)cwr);
  colorWheel.beginDraw();
  colorWheel.background(0, 0);
  colorWheel.colorMode(HSB, 360, 255, 255);
  colorWheel.loadPixels();
  colorWheel.endDraw();
  sliderWheel=createGraphics(2*(int)cwr, 2*(int)cwr);
  sliderWheel.beginDraw();
  sliderWheel.background(0, 0);
  sliderWheel.colorMode(HSB, 360, 255, 255);
  sliderWheel.endDraw();
  for (int i=0; i<2*cwr; i++) {
    for (int j=0; j<2*cwr; j++) {
      if (dist(cwr, cwr, i, j)<=cwr) {
        colorWheel.pixels[i+2*(int)cwr*j]=pixelToColor(i, j);//color(degrees(atan2(i-128,j-128))+180,128+dist(128,128,i,j),255);
      }
    }
  }
  colorWheel.updatePixels();
  ColorSlider mycs=new ColorSlider(TWO_PI/3, 140, true, 0);
  colorSliders.add(mycs);
  mycs=new ColorSlider(TWO_PI/3, 140, false, PI);
  colorSliders.add(mycs);
  mycs=new ColorSlider(TWO_PI/3, 140, false, PI-PI/8);
  colorSliders.add(mycs);
  mycs=new ColorSlider(TWO_PI/3, 140, false, PI+PI/8);
  colorSliders.add(mycs);
}
void draw() {
  background(255);
  for (int i=0; i<colorSliders.size (); i++) {
    colorSliders.get(i).display();
  }
  int count=0;
  int nbeSliders=colorSliders.size();
  for (int n=0; n<width/11; n++ ) {
    for (int p=0; p<height/11; p++) {
      fill(colorSliders.get(count%nbeSliders).col);
      stroke(colorSliders.get(count%nbeSliders).col);
      strokeWeight(2);
      rect(n*width/11, p*height/11, width/11, height/11);
      count++;
    }
  }
  image(colorWheel, cwx-cwr, cwy-cwr);
  image(sliderWheel, cwx-cwr, cwy-cwr);
  sliderWheel.beginDraw();
  sliderWheel.background(0, 0);
  sliderWheel.endDraw();
  if (selectedCs!=-1) {
    displayDetails(colorSliders.get(selectedCs));
  }
}
int pixelToColor(float x, float y) {
  return color(degrees(atan2(x-cwr, y-cwr)+PI), map(dist(cwx-cwr, cwy-cwr, x, y), 0, cwr, 0, 255), 255);
}
PVector colorToPixel(int col) {
  float hue=hue(col);
  float sat=saturation(col);
  float r=sat*cwr/255;
  float x=r*sin(hue);
  float y=r*cos(hue);
 
  return new PVector(x, y);
}
void mousePressed() {
  if (mouseButton==LEFT) {
    for (int i=0; i<colorSliders.size (); i++) {
      mycs=colorSliders.get(i);
      if (dist(mouseX, mouseY, mycs.x, mycs.y)<mycs.dia/2) {
        mycs.dragged=true;
        return;
      }
    }
    if(selectedCs!=-1){
      if(dist(mouseX,mouseY,brightnessSlider.valx,brightnessSlider.y)<10){
        brightnessSlider.dragged=true;
      }
    }
  } else {
    boolean removed=false;
    for (int i=colorSliders.size ()-1; i>0; i--) {
      mycs=colorSliders.get(i);
      if (dist(mouseX, mouseY, mycs.x, mycs.y)<mycs.dia/2) {
        colorSliders.remove(mycs);
        removed=true;
        println("removed");
      }
    }
    if (removed==false) {
      float thisTheta=atan2(mouseX-cwx, mouseY-cwy);
      colorSliders.add(new ColorSlider(thisTheta, dist(mouseX, mouseY, cwx, cwy), false, 0));
      println(colorSliders.size());
    }
  }
}
void mouseDragged() {
  if (dist(mouseX, mouseY, cwx, cwy)<cwr) {
    for (int i=0; i<colorSliders.size (); i++) {
      mycs=colorSliders.get(i);
      if (mycs.dragged) {
        if (mycs.master) {
          mycs.x=mouseX;
          mycs.y=mouseY;
          mycs.radius=dist(mouseX, mouseY, cwx, cwy);

          for (int ns=1; ns<colorSliders.size (); ns++) {
            ColorSlider mycs1=colorSliders.get(ns);
            mycs1.theta=atan2(mouseX-cwx, mouseY-cwy)+mycs1.offset;
            mycs1.radius=min(cwr, mycs1.radius0*mycs.radius/mycs.radius0);
            mycs1.x=cwx+mycs1.radius*sin(mycs1.theta);
            mycs1.y=cwy+mycs1.radius*cos(mycs1.theta);
            mycs1.display();
          }
        } else {
          mycs.x=mouseX;
          mycs.y=mouseY;
          mycs.radius=dist(mycs.x, mycs.y, cwx, cwy);
        }
      }
    }
  }
  if(brightnessSlider.dragged && abs(mouseY-brightnessSlider.y)<10 && abs(mouseX-(brightnessSlider.x+brightnessSlider.w/2))<brightnessSlider.w/2){
    int mycol=colorSliders.get(selectedCs).col;
    colorSliders.get(selectedCs).bright=abs(mouseX-brightnessSlider.x)*255/brightnessSlider.w;
    colorSliders.get(selectedCs).display();
  }
}
void mouseReleased() {
  for (int i=0; i<colorSliders.size (); i++) {
    if (colorSliders.get(i).dragged)colorSliders.get(i).radius0=dist(mouseX, mouseY, cwx, cwy);
    colorSliders.get(i).dragged=false;
    colorSliders.get(i).update();
  }
}
void mouseClicked() {
  selectedCs=-1;
  for (int i=0; i<colorSliders.size (); i++) {
    mycs=colorSliders.get(i);
    if (dist(mouseX, mouseY, mycs.x, mycs.y)<mycs.dia/2) {
      mycs.selected=!mycs.selected;
      if (mycs.selected) {
        selectedCs=i;
      }
    } else {
      mycs.selected=false;
    }
  }
}
void displayDetails(ColorSlider cs) {
  textSize(24);
  fill(0);
  int mycol=int(cs.col);
  text("Hue:"+int(hue(mycol)), 5, height-70);
  text("Saturation:"+int(saturation(mycol)), 5, height-40);
  text("Brightness:"+int(brightness(mycol)), 5, height-10);
  hueSlider.val=int(hue(mycol));
  hueSlider.display();
  brightnessSlider.val=int(brightness(mycol));
  brightnessSlider.display();
  saturationSlider.val=int(saturation(mycol));
  saturationSlider.display();
}

class ColorSlider {
  float theta, radius, radius0, col, bright,dia, x, y, offset;
  boolean dragged=false;
  boolean master, selected;
  ColorSlider(float theta, float radius, boolean master, float offset) {
    this.radius=this.radius0=radius;
    this.theta=theta;
    this.master=master;
    this.offset=offset;
    selected=false;
    bright=255;
    dia=25;
    x=cwx+radius*sin(theta+offset);
    y=cwy+radius*cos(theta+offset);
    col=pixelToColor(x-cwx+cwr, y-cwy+cwr);
    display();
  }
  void display() {
    col=pixelToColor(x-cwx+cwr, y-cwy+cwr);
    col=color(hue(col),saturation(col),bright);
    sliderWheel.beginDraw();
    sliderWheel.fill(col);
    sliderWheel.stroke(255*int(!dragged));
    sliderWheel.strokeWeight(1);
    sliderWheel.line(cwr, cwr, x-cwx+cwr, y-cwy+cwr);
    sliderWheel.stroke(100*int(!dragged)+155*int(!selected));
    sliderWheel.strokeWeight(2+3*int(master));
    sliderWheel.ellipse(x-cwx+cwr, y-cwy+cwr, dia, dia);
    sliderWheel.endDraw();
  }
  void update() {

    theta=atan2(x-cwx, y-cwy);
    radius0=radius;
    if (!master) {
      offset=theta-colorSliders.get(0).theta;
    }
  }
}
class Slider {
  float x, y, w, h, val, minval, maxval,valx;
  boolean dragged=false;
  Slider(float x, float y, float w, float val, float minval, float maxval) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.val=val;
    this.minval=minval;
    this.maxval=maxval;
  }
  void display() {
    stroke(0, 128);
    fill(0, 255, 255, 128);
    rect(x, y-2, w, 4);
    fill(0, 255, 255, 240);
    valx=x+val*w/(maxval-minval);
    ellipse(valx, y, 20, 20);
  }
  void mousePressed() {
    val=0;
    display();
    print("slider pressed");
  }
}



