
  import hypermedia.video.*;
  OpenCV opencv;
  
  PFont townFont;
  String[] townNames;
  String[] mtnNames;
  float noiseMap[];
  float[] imageValues;
  PImage mapImage;
  PImage imageMod;
  
  float noiseScale = .005;
  float levels = 30;
  int contrast = 40;
  int brightness = 0;
  int avg_level = 1;
  
  boolean show_noise = false;
  boolean use_mod = true;
  boolean draw_lines = true;
  
  color grass = color(200, 232, 156);
  color red_line = color(121, 76, 34);
  color water = color(165, 225, 225);
  
  //BlobDetection[] theBlobDetection = new BlobDetection[int(levels)];
  
  void setup() 
  {
    size(600, 800);
    noLoop();
    smooth();
    strokeCap(ROUND);
    strokeJoin(ROUND);
  
    noiseMap = new float[width * height];
    imageValues = new float[width * height];
    noiseDetail(5, .5);
    mapImage = createImage(width, height, RGB);
    mapImage.loadPixels();
    
    opencv = new OpenCV( this );
    opencv.allocate(width,height);
    
    townFont = loadFont("TheSans-Plain-12.vlw");
    textFont(townFont);
    townNames = loadStrings("town_names.txt");
    mtnNames = loadStrings("mtn_names.txt");
    
    setupImageValues();
  }
  
  void setupImageValues(){
   imageMod = loadImage("two_grey.jpg");
    image(imageMod, 0, 0, width, height);
    loadPixels();
    // getImageData
    for(int y = 0; y < height; y++) {
      for(int x = 0; x < width; x++) {
        int i = y * width + x;
        imageValues[i] = 1 - brightness(pixels[i])/255;
        //if(y%20 == 0 & x%20==0)println("iv "+imageValues[i]);
      }
    } 
  }
  
  void draw() 
  { 
    background(0);
  
    loadPixels();
    mapImage.loadPixels();
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int i = y * width + x;
        //noiseMap[i] = int(levels * noise(x * noiseScale, y * noiseScale, frameCount * noiseScale * 10))/levels;
        noiseMap[i] = noise(x * noiseScale, y * noiseScale, frameCount * noiseScale * 10);
        if(use_mod){
         float value = imageValues[i];
         for(int q=0; q<avg_level; q++)
           value += noiseMap[i];
         value /= (avg_level + 1);
         noiseMap[i] = value;
         //noiseMap[i] = (imageValues[i] + noiseMap[i] + noiseMap[i])/3; //no levels 
        }
        //if(y%30 == 0 & x%30==0)println("nv "+imageValues[i]);
        //pixels[i] = color (int(255*noiseMap[i]),int(255*noiseMap[i]),int(255*noiseMap[i]));
        mapImage.pixels[i] = color (int(255*noiseMap[i]), int(255*noiseMap[i]), int(255*noiseMap[i]));
      }
    }
    updatePixels();
    mapImage.updatePixels();  
    //image(mapImage, 0, 0);
  
    drawBlobs();
  }
  
  void drawBlobs(){  
    if(show_noise){
      opencv.copy(mapImage);
      opencv.contrast(contrast);
      opencv.brightness(brightness);
      image( opencv.image(), 0, 0 );
    }
    else{
      fill(grass);
      rect(0, 0, width, height);
    }
    
    if(!draw_lines)
        return;
    
    for(int a=0; a<levels; a++){
      opencv.copy(mapImage);
      opencv.contrast(contrast);
      opencv.brightness(brightness);
      opencv.threshold(255*a/levels);
      //image( opencv.image(), 0, 0 );
      Blob[] blobs = opencv.blobs(100, width*height/3, 100, true);
      //println("number of blobs = "+blobs.length);
      
      for( int i=0; i<blobs.length; i++ ) {
        //println("blob "+i);
        noFill();
        if(a == 0)    //lowest
          fill(water);
        if(a == levels-1){  //highest
          fill(255);
        }
        stroke(red(red_line)+(a/levels)*100, green(red_line)+(a/levels)*-50, blue(red_line)+(a/levels)*-50);
        strokeWeight(1.25);
        if ( blobs[i].points.length>0 ) {
          beginShape();
          for( int j=0; j<blobs[i].points.length; j++ ) {
            vertex( blobs[i].points[j].x, blobs[i].points[j].y );
          }
          if(dist(blobs[i].points[0].x, blobs[i].points[0].y, blobs[i].points[blobs[i].points.length-1].x, blobs[i].points[blobs[i].points.length-1].y) > 100)
            endShape();
          else
            endShape(CLOSE);
        }
        if(a == levels-1)  //highest
          drawPeak(blobs[i].centroid.x, blobs[i].centroid.y);
      }
      opencv.restore();
    }
  }
  
  void drawPeak(float peakX, float peakY){
    stroke(0);
    noFill();
    line(peakX-3, peakY-3, peakX+3, peakY+3);
    line(peakX+3, peakY-3, peakX-3, peakY+3);
    fill(0);
    if(mtnNames.length > 0){
      text(mtnNames[int(random(-.4,mtnNames.length-.6))], peakX+6, peakY+4);
    }
  }
  
  void mousePressed() 
  {
    redraw();
  }
  
  void keyPressed(){
    switch(key){
      case 'n':
        show_noise = !show_noise;
        redraw();
        break;
      case 'm':
        use_mod = !use_mod;
        redraw();
        break;
      case 'l':
        draw_lines = !draw_lines;
        redraw();
      case '-':
        if(levels > 5){
          levels -= 5;
          println("levels = "+levels);
          redraw();
        }
        break;
      case '=':
        if(levels < 101){
          levels += 5;
          println("levels = "+levels);
          redraw();
        }
        break;
      case '1':
        brightness -= 5;
        println("brightness = "+brightness);
        break;
      case '2':
        brightness += 5;
        println("brightness = "+brightness);
        break;
      case '3':
        contrast -= 5;
        println("contrast = "+contrast);
        break;
      case '4':
        contrast += 5;
        println("contrast = "+contrast);
        break;
      case '5':
        noiseScale -= .001;
        println("noiseScale = "+noiseScale);
        break;
      case '6':
        noiseScale += .001;
        println("noiseScale = "+noiseScale);
        break;
      case '7':
        if(avg_level>1){
          avg_level -= 1;
          println("avg_val = "+avg_level);
          redraw();
        }
        break;
      case '8':
        if(avg_level<20){
          avg_level += 1;
          println("avg_val = "+avg_level);
          redraw();
        }
        break;
    }
  }


