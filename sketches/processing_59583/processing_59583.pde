
// Autostereogram v1
// Matthew Pearson 2012

int angle = 0;
float t = 10;


PGraphics pattern;
PGraphics3D depthMap;

void setup() {
  size(600, 400, P3D);
  //smooth();
  lights();
  //fill(0);
  //rect(0,0,width,height);

  depthMap = (PGraphics3D)createGraphics(width, height, P3D);

  pattern = createGraphics(60, height+10, P2D);

  //noCursor();

  
  
  drawPattern();
}

void drawPattern() {

/*
  pattern.beginDraw();
  pattern.noStroke();
  colorMode(HSB);
  //int randomStart = 5; //int(random(2,500));

  // draw a bunch of circles and stuff
  for (int y=0;y<pattern.height+5;y+=5) {
    for (int x=0; x<pattern.width+5;x+=5) {
      //      if(x%80 == 0) //< random(0,3))
      //        randomSeed(y*randomStart); //x%75+y*20);
      //int x = floor(random(0,width));
      //int y = floor(random(0,height));
      float r = random(8, 12);

      int h = floor(random(255));
      int s = floor(random(0, 40));
      int b = floor(random(150, 220))/2;

      //int b = int(100+constrain(100*sin(x/15+zigzag)+100,0,50));
      color c = color(h, s, b);
      pattern.fill(c);
      pattern.pushMatrix();
      //      if(x>150 && x<250 && y>100 && y<300)
      //        bg.translate(x*0.98,y);
      //      else
      pattern.translate(x, y);
      pattern.ellipse(0, 0, r, r);
      pattern.popMatrix();
    }
  }
  //pattern.fill(120);
  //pattern.rect(0,0,pattern.width,pattern.height);
  pattern.endDraw();
  colorMode(RGB);
*/
  // apply noise
  pattern.loadPixels();
  //randomSeed(10);
  int offset = 0;
  //noiseDetail(1);
  t+=2;

  for (float y=0; y<pattern.height; y++) {
    for (float x=0; x<pattern.width; x++) {
      //if(i%(pattern.width/80) < 1)
      //randomSeed(i%pattern.width);

      //float f = noise(x,y/40,t)+0.3;
      //print(" "+f);
      float f = random(0.5, 1.5);
      int r = min(255, floor(f*180));
      int g = min(255, floor(f*120));
      int b = min(255, floor(f*120));
      //r = min(255,floor(f*red(pattern.pixels[i])));
      //g = min(255,floor(f*green(pattern.pixels[i])));
      //b = min(255,floor(f*blue(pattern.pixels[i])));
      colorMode(HSB);
      pattern.pixels[offset] = color(random(255),random(40,120),r); //color(r, g, b);

      offset++;
    }
    pattern.updatePixels();
  }
}


void draw() {
  //noLoop();
  drawBox();
  drawPattern();

  //  depthMap.beginDraw();
  //  depthMap.noStroke();
  //  depthMap.fill(0);
  //  depthMap.background(0);
  //  depthMap.fill(20);
  //  depthMap.rect(mouseX - 70,mouseY-50,140,100);
  //  depthMap.fill(40);
  //  depthMap.endDraw();

  loadPixels();
  depthMap.loadPixels();

  float zbuffer, depth, depthOffset;
  
  int offset = 0;
  for (int y=0;y<height;y++) {
    for (int x=0;x<width;x++) {
      
      //depthOffset = x+y*width;
      //depth = 0;

//      for(int i=0; i<width; i++) {
        
        //int offset = i+y*width;

        zbuffer = constrain(depthMap.zbuffer[offset], 0, 0.95);
        zbuffer = (255-map(zbuffer, 0.85, 0.95, 0, 255)) / 10;
        depth = int(zbuffer);
        
//        if(depth == abs(x-i) && abs(depth)<abs(x-i))
//          depth = x-i;
        
      //pixels[offset] = color(depth); //depthMap.pixels[offset]; 
      //depth = 0;
      //if(x > 100 && x < 200 && y > 200 && y < 300)
        // depth = 5;
      //print(intDepth);
     // print(" ");
     
//      }
     
     
      if(x<pattern.width) {
        depthOffset = constrain(x + depth + pattern.width*y,0,pattern.pixels.length-1);
        pixels[offset] = pattern.pixels[int(depthOffset)];
      } else {
        depthOffset = constrain((offset + depth) - pattern.width,0,pixels.length-1);
        //depthOffset = (offset + depth) - pattern.width; //,0,pixels.length-1)
        //if(depthOffset < 0)
         // depthOffset = pattern.width - depthOffset%pattern.width;
       // if(depthOffset > pixels.length-1)
         // depthOffset = depthOffset%pattern.width;

          pixels[offset] = pixels[int(depthOffset)];
      }
      offset++;
    }
  }

  updatePixels();
}

void mousePressed() {
  depthMap.loadPixels();

  float d = depthMap.zbuffer[mouseX+mouseY*depthMap.width];
  d = constrain(d, 0, 1);
  //print (d);
  print(map(d, 0.8, 1, 0, 255));

  loadPixels();
  int offset = mouseX + width*mouseY;
  float depth = brightness(depthMap.pixels[offset]);
  //float factor = (width+depth)/width;
  float depthOffset = constrain(mouseX - depth - pattern.width, 
  0, pixels.length-1
    );
  print(" ");
  //print (factor);
  print(" ");
  //print(depthOffset-mouseX);
}


void drawBox() {
  depthMap.beginDraw();
  depthMap.background(0);
  depthMap.lights();

  depthMap.noStroke();
  depthMap.pushMatrix();
  depthMap.translate(width/2, height/2, 0);
  depthMap.rotateX(map(height/2-mouseY,height/-2,height/2,-1*PI,PI));
  depthMap.rotateY(map(mouseX-width/2,width/-2,width/2,-1*PI,PI));
  depthMap.box(150);
  depthMap.popMatrix();
  depthMap.endDraw();
  
}

