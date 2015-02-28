
int pixelMax;
int mode = 0;
int pixelz[];
color bg;

void setup(){
  bg = color(0, 0, 0, 100);
  background(bg);
  size(400, 400);
  println("ArraySize:\t"+(width-1)+(height-1)*width);
  pixelMax = (width-1)+(height-1)*width;
  pixelz = new int[width+height*width];
}

void draw(){
  pixelShift();
  noStroke();
  fill(0, 100, 100);
  ellipse(random(0, width), random(0, height), random(0, 15), random(0, 15));
  noFill();
}

void pixelShift(){
  int arrayX, arrayY; //Array bounds out of bounds variable.
  loadPixels();
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      //'shift' pixels to the left
      switch(mode){
        case 0:
          arrayX = abs(x+int(random(-5, 5)))%width;
          arrayY = abs(y+int(random(-5, 5)))%height;
          break;
        case 1:
          arrayX = (x+int(random(0, 5)))%width;
          arrayY = abs(y+int(random(-5, 5)))%height;
          break;
        case 2:
          arrayX = abs(x+int(random(-5, 0)))%width;
          arrayY = abs(y+int(random(-5, 5)))%height;
          break;
        case 3:
          arrayX = abs(x+int(random(-5, 5)))%width;
          arrayY = (y+int(random(0, 5)))%height;
          break;
        case 4:
          arrayX = abs(x+int(random(-5, 5)))%width;
          arrayY = abs(y+int(random(-5, 0)))%height;
          break;
        default:
          arrayX = x;
          arrayY = y;
          break;
      }
      //Originally, this would write back to the pixels array, rather than a second place holder array.
      // This caused pixels that had already been shifted down to be effected again.
      pixelz[x+y*width] = pixels[(abs(arrayX)+abs(arrayY)*width)];
    }
  }
  //In order to fix the strange behavior, a second loop is created to 
  // properly apply all pixels to their shifted position, without applying the effect twice.
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      pixels[x+y*width] = pixelz[x+y*width];
    }
  }
  updatePixels();
}

void mousePressed()
{
  mode++;
  mode%=6;
  background(bg);
}

void keyPressed(){
  //saveShot();
}

void saveShot(){
    noLoop();
    saveFrame(timeStamp() + ".png");
    loop();
  }
  
  String timeStamp() {
    String timestamp;
    int d = day();    // Values from 1 - 31
    int m = month();  // Values from 1 - 12
    int y = year();   // 2003, 2004, 2005, etc.
    int s = second();  // Values from 0 - 59
    int n = minute();  // Values from 0 - 59
    int h = hour();    // Values from 0 - 23
    //ie: 2009-12-07_8.14.56.png
    timestamp = String.valueOf(y) + "-" + 
                String.valueOf(m)+ "-" + 
                String.valueOf(d)+ "_" + 
                String.valueOf(h) + "." + 
                String.valueOf(n) + "." + 
                String.valueOf(s);
    
    return timestamp;
  }


