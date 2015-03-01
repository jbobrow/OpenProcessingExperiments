
/* @pjs globalKeyEvents="true"; */
Layer colorWheel;//layer for displaying the color wheel (Layer has p, a transparent PGraphics)
boolean showColorWheel;//wether to show the color wheel or not
Layer sliderWheel;//layer for displaying the color wheel sliders
PGraphics helplayer;//layer for displaying the help pannel
boolean showHelp;//wether to show the help pannel or not
int cwx;//colorWheel center
int cwy;
float cwr=200;//colorWheel radius
ArrayList <ColorSlider> colorSliders;// color wheel sliders collection
ArrayList <Integer> colorsList;// list of color wheel sliders references for decoration mode 1
ArrayList <Integer> colorStrips;// list of strips heights for decoration mode 1
int selectedCs=-1;//index of the selected color slider
int decomode;
Slider hueSlider;//slider for editing/displaying selected color hue
Slider saturationSlider;//slider for editing/displaying selected color saturation
Slider brightnessSlider;//slider for editing/displaying selected color brightness

void setup() {
  size(800, 800);
  ellipseMode(CENTER);
  colorMode(HSB, 360, 255, 255);
  decomode=1;
  colorSliders=new ArrayList<ColorSlider>();
  colorsList= new ArrayList <Integer> ();//JavaScript mode doesnt take IntList...
  colorStrips=new ArrayList <Integer> ();
  hueSlider=new Slider(200, height-80, 200, 55, 0, 360);
  saturationSlider=new Slider(200, height-50, 200, 55, 0, 255);
  brightnessSlider=new Slider(200, height-20, 200, 55, 0, 255);
  cwx=width/2;
  cwy=height/2;
  showColorWheel=true;
  colorWheel=new Layer(2*(int)cwr, 2*(int)cwr);
  sliderWheel=new Layer(2*(int)cwr, 2*(int)cwr);
  helplayer=createGraphics(width-40, height-300);
  helplayer.beginDraw();
  helplayer.background(255, 200);
  helplayer.textSize(18);
  helplayer.fill(0);
  String helpText="This sketch allows you to create a color palette.\n";
  helpText+="To hide/show this help pannel, key 'h'\n\n";
  helpText+="On the color wheel, each 'slider' corresponds to a color in the palette.\n";
  helpText+="You can drag these sliders to change the colors.\n";
  helpText+="The thick slider is the main one: other sliders will move together with it.\n\n";
  helpText+="If you right click on the color wheel, you'll add another slider, thus another color to your palette.\n";
  helpText+="If you right click on a slider, you'll remove it and its color...\n";
  helpText+="If you left click on a slider, you'll select/unselect it. The color's details will be displayed.\n";
  helpText+="It allows you to fine tune it, and modify its brightness.\n\n";
  helpText+="Your palette is used to create background decoration, using different styles.\n";
  helpText+="To cycle through decoration styles, key 'd'. \nTo regenerate this decoration, hit space bar.\n";
  helpText+="To show/hide the color wheel, key 'c'. \n";
  helplayer.text(helpText, 0, 50);
  helplayer.endDraw();
  showHelp=true;
  //making of the colorwheel
  for (int i=0; i<2*cwr; i++) {
    for (int j=0; j<2*cwr; j++) {
      if (dist(cwr, cwr, i, j)<=cwr) {
        colorWheel.p.pixels[i+2*(int)cwr*j]=pixelToColor(i, j,255);//color(degrees(atan2(i-128,j-128))+180,128+dist(128,128,i,j),255);
      }
    }
  }
  colorWheel.p.updatePixels();
  //main color slider is created(random hue and saturation, full brightness
  int angle=int(random(TWO_PI));
  ColorSlider mycs=new ColorSlider(angle, random(cwr), true, 0);
  colorSliders.add(mycs);
  //3 secondary sliders are created (compound additive complementaries, with random saturation and full brightness)
  //they're added to the list of color sliders
  mycs=new ColorSlider(angle, random(cwr), false, PI);
  colorSliders.add(mycs);
  mycs=new ColorSlider(angle, random(cwr), false, PI-PI/8);
  colorSliders.add(mycs);
  mycs=new ColorSlider(angle, random(cwr), false, PI+PI/8);
  colorSliders.add(mycs);
}

//for each frame
void draw() {
  background(255);//wipe off  

  //decorating the background using the current palette and different modes. They will change every 250 frames
  decorateBackground(decomode);
  if (showColorWheel) {
    image(colorWheel.p, cwx-cwr, cwy-cwr);//colorwheel layer is drawn
    for (int i=0; i<colorSliders.size (); i++) {//displaying the color sliders onto their layer
      colorSliders.get(i).display();
    }
    image(sliderWheel.p, cwx-cwr, cwy-cwr);//colorSliders layer is drawn
    sliderWheel.p.beginDraw();//wipe this layer
    sliderWheel.p.background(0, 0);
    sliderWheel.p.endDraw();
    if (selectedCs!=-1) { //if any color slider is selected (by clicking on it) its details are displayed
      displayDetails(colorSliders.get(selectedCs));
    }
  }
  if (showHelp)image(helplayer, 20, 150);
}
//getting the color corresponding to a position on the wheel
int pixelToColor(float x, float y,float bright) {
  return color(degrees(atan2(x-cwr, y-cwr)+PI), map(dist(cwx-cwr, cwy-cwr, x, y), 0, cwr, 0, 255), bright);
}
//getting the position on the wheel corresponding to a color
PVector colorToPixel(int col) {
  float hue=hue(col);
  float sat=saturation(col);
  float r=sat*cwr/255;
  float x=r*sin(hue);
  float y=r*cos(hue);
  return new PVector(x, y);
}
//what if mouse is pressed
void mousePressed() {
  if (mouseButton==LEFT) {//with left button pressed, we can drag colorsliders
    for (int i=0; i<colorSliders.size (); i++) {
      ColorSlider mycs=colorSliders.get(i);
      if (dist(mouseX, mouseY, mycs.x, mycs.y)<mycs.dia/2) {
        mycs.dragged=true;
        return;
      }
    }
    if (selectedCs!=-1) {//a colorSlider is selected: with left button pressed, we can drag sliders in the color details
      if (dist(mouseX, mouseY, brightnessSlider.valx, brightnessSlider.y)<10) {
        brightnessSlider.dragged=true;
      }
      else if (dist(mouseX, mouseY, saturationSlider.valx, saturationSlider.y)<10) {
        saturationSlider.dragged=true;
      }
      else if (dist(mouseX, mouseY, hueSlider.valx, hueSlider.y)<10) {
        hueSlider.dragged=true;
      }
    }
  } else {//with right button pressed, we can create or destroy colorsliders
    boolean removed=false;
    for (int i=colorSliders.size ()-1; i>0; i--) {
      ColorSlider mycs=colorSliders.get(i);
      if (dist(mouseX, mouseY, mycs.x, mycs.y)<mycs.dia/2 && !mycs.selected) {
        println(colorSliders.size());
        colorSliders.remove(mycs);//a color is removed
        removed=true;
        println(colorSliders.size());
        //if we modify the number of colorSliders(colors in our palette) the decoration 
        //has to be recalculated
        preparedeco(decomode);
      }
    }
    if (removed==false) {
      float thisTheta=atan2(mouseX-cwx, mouseY-cwy);
      colorSliders.add(new ColorSlider(thisTheta, dist(mouseX, mouseY, cwx, cwy), false, 0));//a color is added
      preparedeco(decomode);
    }
  }
}

//when mouse is dragged...
void mouseDragged() {
  if (dist(mouseX, mouseY, cwx, cwy)<cwr) {//inside the colorwheel
    for (int i=0; i<colorSliders.size (); i++) {//for every colorSliders
      ColorSlider mycs=colorSliders.get(i);
      if (mycs.dragged) {//if it's dragged
        if (mycs.master) {//if it's the main slider
          mycs.x=mouseX;//drag it
          mycs.y=mouseY;
          mycs.radius=dist(mouseX, mouseY, cwx, cwy);//update it's radius
          mycs.col=pixelToColor(mycs.x-cwx+cwr, mycs.y-cwy+cwr,mycs.bright);

          for (int ns=1; ns<colorSliders.size (); ns++) {//update the secondary colorsliders accordingly
            ColorSlider mycs1=colorSliders.get(ns);
            mycs1.theta=atan2(mouseX-cwx, mouseY-cwy)+mycs1.offset;//angle (hue)
            mycs1.radius=min(cwr, mycs1.radius0*mycs.radius/mycs.radius0);//radius (saturation)
            mycs1.col=pixelToColor(mycs1.x-cwx+cwr, mycs1.y-cwy+cwr,mycs1.bright);
            mycs1.x=cwx+mycs1.radius*sin(mycs1.theta);//position
            mycs1.y=cwy+mycs1.radius*cos(mycs1.theta);
            //mycs1.display();
          }
        } else {//if it's a secondary slider that is dragged
          mycs.x=mouseX;
          mycs.y=mouseY;
          mycs.radius=dist(mycs.x, mycs.y, cwx, cwy);
          mycs.col=pixelToColor(mycs.x-cwx+cwr, mycs.y-cwy+cwr,mycs.bright);
        }
      }
    }
  } 
  else if (hueSlider.dragged && abs(mouseY-hueSlider.y)<10 //outside the colorwheel
  && abs(mouseX-(hueSlider.x+hueSlider.w/2))<hueSlider.w/2) {//if the brightness slider is dragged (in the details area)
    ColorSlider mycs=colorSliders.get(selectedCs);
    float mycol=mycs.col;
    mycs.col=color(abs(mouseX-hueSlider.x)*360/hueSlider.w,saturation(mycol),mycs.bright);//selected color hue is adjusted
    mycs.theta=radians(hue(mycs.col))-PI;
    mycs.x=cwx+mycs.radius*sin(mycs.theta);
    mycs.y=cwy+mycs.radius*cos(mycs.theta);
    mycs.display();
  }
  else if (brightnessSlider.dragged && abs(mouseY-brightnessSlider.y)<10 //outside the colorwheel
  && abs(mouseX-(brightnessSlider.x+brightnessSlider.w/2))<brightnessSlider.w/2) {//if the brightness slider is dragged (in the details area)  
    float mycol=colorSliders.get(selectedCs).col;
    colorSliders.get(selectedCs).bright=abs(mouseX-brightnessSlider.x)*255/brightnessSlider.w;//selected color brightness is adjusted
    colorSliders.get(selectedCs).col=color(hue(mycol),saturation(mycol),colorSliders.get(selectedCs).bright);
    colorSliders.get(selectedCs).display();
  }
  else if (saturationSlider.dragged && abs(mouseY-saturationSlider.y)<10 //outside the colorwheel
  && abs(mouseX-(saturationSlider.x+saturationSlider.w/2))<saturationSlider.w/2) {//if the brightness slider is dragged (in the details area)
    ColorSlider mycs=colorSliders.get(selectedCs);
    float mycol=mycs.col;
    mycs.col=color(hue(mycol),abs(mouseX-saturationSlider.x)*255/saturationSlider.w,mycs.bright);//selected color hue is adjusted
    mycs.radius=saturation(mycs.col)*cwr/255;
    mycs.x=cwx+mycs.radius*sin(mycs.theta);
    mycs.y=cwy+mycs.radius*cos(mycs.theta);
    mycs.display();
  }
}
//when the mouse button is released
void mouseReleased() {
  for (int i=0; i<colorSliders.size (); i++) {
    //if (colorSliders.get(i).dragged)colorSliders.get(i).radius0=dist(mouseX, mouseY, cwx, cwy);
    colorSliders.get(i).dragged=false;
    colorSliders.get(i).update();
  }
}
void mouseClicked() {
  if (mouseButton==LEFT) {
    selectedCs=-1;
    for (int i=0; i<colorSliders.size (); i++) {
      ColorSlider mycs=colorSliders.get(i);
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
}
void preparedeco(int mode) {//todo use objects instead //<>//
  int reached=0;
  colorsList.clear();
  colorStrips.clear();
  switch(mode) {
  case 1:
    while (reached<height) {
      colorsList.add((int)random(colorSliders.size()));
      int rectH=int(random(10, 50));
      colorStrips.add(rectH);
      reached=min(height, reached+rectH);
    }
    break;
  case 2:
    while (reached<50) {
      colorsList.add((int)random(1, colorSliders.size()));
      colorsList.add((int)random(1, colorSliders.size()));
      colorsList.add(0);
      int dia=int(random(10, 120));
      colorStrips.add(dia);
      int x=int(random(width));
      int y=int(random(height));
      colorStrips.add(x);
      colorStrips.add(y);
      reached++;
    }
    break;
  }
}
void decorateBackground(int mode) {
  switch(mode) {  
  case 0:
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
    break;
  case 1:
    if (colorStrips.size()==0)preparedeco(1);   
    noStroke();
    int reached=0;
    for (int n=0; n<colorStrips.size (); n++) {
      fill(colorSliders.get(colorsList.get(n)).col);
      rect(0, reached, width, colorStrips.get(n));
      reached+=colorStrips.get(n);
    }
    break;
  case 2:
    if (colorStrips.size()==0)preparedeco(2); 
    background(colorSliders.get(0).col);
    for (int n=0; n<colorStrips.size ()-2; n+=3) {
      fill(colorSliders.get(colorsList.get(n)).col);
      stroke(colorSliders.get(colorsList.get(n+1)).col);
      int ellipseDia=colorStrips.get(n);
      strokeWeight(ellipseDia/10);
      ellipse(colorStrips.get(n+1), colorStrips.get(n+2), ellipseDia, ellipseDia);
      //println(colorStrips.get(n)+" "+colorStrips.get(n+1)+" "+colorStrips.get(n+2));
    }
    break;
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
    dia=25;
    bright=255;
    x=cwx+radius*sin(theta+offset);
    y=cwy+radius*cos(theta+offset);
    col=pixelToColor(x-cwx+cwr, y-cwy+cwr,bright);
    display();
  }
  void display() {   
    sliderWheel.p.beginDraw();
    sliderWheel.p.fill(col);
    sliderWheel.p.stroke(255*int(!dragged));
    sliderWheel.p.strokeWeight(1);
    sliderWheel.p.line(cwr, cwr, x-cwx+cwr, y-cwy+cwr);
    sliderWheel.p.stroke(100*int(!dragged)+155*int(!selected));
    sliderWheel.p.strokeWeight(2+3*int(master));
    sliderWheel.p.ellipse(x-cwx+cwr, y-cwy+cwr, dia, dia);
    sliderWheel.p.endDraw();
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
  float x, y, w, h, val, minval, maxval, valx;
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
}
void keyReleased() {

  if (keyCode == 67) {
    showColorWheel=!showColorWheel;
  } else if (keyCode == 68) {
    decomode++;
    decomode=decomode%3;
    colorStrips.clear();
    colorsList.clear();
  } else if (keyCode == 32) {
    colorStrips.clear();
    colorsList.clear();
    preparedeco(decomode);
  } else if (keyCode == 72) {
    showHelp=!showHelp;
  }
}
class Layer {
  PGraphics p;
  Layer(int w,int h){
     
    p=createGraphics(w,h);
  p.beginDraw();
  p.background(0, 0);
  p.colorMode(HSB, 360, 255, 255);
  p.loadPixels();
  p.endDraw();
  }
}


