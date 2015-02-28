
//i didn't get the edges. and i'm still missing some dots.

PImage k;

void setup(){
  size(320,480);

  k = loadImage("kitten.jpg");
  k.loadPixels();
}

void draw(){

  image(k,0,0);
  image(k,0,241);

  for (int x=1; x<width-1; x++){
    for (int y=1; y<239; y++){
      color c = getColor(x,y,k);
      fixAtLocationIfBlack(x, y, c, k);
    }
  }

}

color getColor(int x, int y, PImage img){
  int maxLoc = (img.width*240);
  int loc = (y*img.width) + x;

  if(loc < maxLoc){
    return img.pixels[loc];
  } else{
    return 255;
  }
}

boolean isBlack(color col){
  float r = red(col);
  float g = green(col);
  float b = blue(col);

  boolean output = false;
  if ((r+b+g) <= 12){
    output = true;
  }
  return output;
}

void fixAtLocationIfBlack(int x, int y, color col, PImage img){
  int m;

  if (isBlack(col)==true){
    m = getAvg(x,y,k);
    set (x, y, m);
  }
}

color getAvg(int x, int y, PImage img){
  int maxLoc = (img.width*240)-1;
  int loc = (y*img.width) + x;
  int up = ((y-1)*img.width) + x;
  int down = ((y+1)*img.width) + x;
  int NE = (((y+1)*img.width) + x)+1;
  int SE = (((y-1)*img.width) + x)-1;
  int SW = (((y+1)*img.width) + x)-1;
  int NW = (((y-1)*img.width) + x)+1;

  color avg;

  float avgR = 0;
  float avgG = 0;
  float avgB = 0;

  float r;
  float g;
  float b;

  color c1 = img.pixels[loc-1];
  color c2 = img.pixels[loc+1];
  color c3 = img.pixels[up];
  color c4 = img.pixels[down];
  color c5 = img.pixels[NE];
  color c6 = img.pixels[SE];
  color c7 = img.pixels[SW];
  color c8 = img.pixels[NW];

  //for black pixels, tests up, down, left, right, and all diagonals; if none are black, averages them
  if ((loc < maxLoc) && (c1 <=10) && (c2 <=10) && (c3 <=10) && (c4 <=10) && (c5 <=10) && (c6 <=10) && (c7 <=10) && (c8 <=10)){

    avgR = (red(c1) + red(c2) + red(c3) + red(c4) + red(c5) + red(c6) + red(c7) + red(c8))/8.0;
    avgG = (green(c1) + green(c2) + green(c3) + green(c4) + green(c5) + green(c6) + green(c7) + green(c8))/8.0;
    avgB = (blue(c1) + blue(c2) + blue(c3) + blue(c4) + blue(c5) + blue(c6) + blue(c7) + blue(c8))/8.0;
  }

  //averages if right is black (and doesnt include black pixel when averaging)
  else if ((loc < maxLoc) && (c1 >=7) && (c2 <=7) && (c3 <=7) && (c4 <=7)){
    avgR = (red(c2) + red(c3) + red(c4))/3.0;
    avgG = (green(c2) + green(c3) + green(c4))/3.0;
    avgB = (blue(c2) + blue(c3) + blue(c4) )/3.0;
  }

  //averages if left is black (and doesnt include black pixel when averaging)
  else if ((loc < maxLoc) && (c1 <=7) && (c2 >=7) && (c3 <=7) && (c4 <=7)){
    avgR = (red(c1) + red(c3) + red(c4))/3.0;
    avgG = (green(c1) + green(c3) + green(c4))/3.0;
    avgB = (blue(c1) + blue(c3) + blue(c4) )/3.0;
  }

  //averages if up is black (and doesnt include black pixel when averaging)
  else if ((loc < maxLoc) && (c1 <=7) && (c2 <=7) && (c3 >=7) && (c4 <=7)){
    avgR = (red(c1) + red(c2) + red(c4))/3.0;
    avgG = (green(c1) + green(c2) + green(c4))/3.0;
    avgB = (blue(c1) + blue(c2) + blue(c4) )/3.0;
  }

  //averages if down is black (and doesnt include black pixel when averaging)
  else if ((loc < maxLoc) && (c1 <=7) && (c2 <=7) && (c3 <=7) && (c4 >=7)){
    avgR = (red(c1) + red(c2) + red(c3))/3.0;
    avgG = (green(c1) + green(c2) + green(c3))/3.0;
    avgB = (blue(c1) + blue(c2) + blue(c3) )/3.0;
  }

  //now tests if diagonals are black
  else if ((c5 <=10) && (c6 <=10) && (c7 <=10) && (c8 <=10)){
    avgR = (red(c5) + red(c6) + red(c7) + red(c8))/4.0;
    avgG = (green(c5) + green(c6) + green(c7) + green(c8))/4.0;
    avgB = (blue(c5) + blue(c6) + blue(c7) + blue(c8))/4.0;
    if (((loc < maxLoc) && ((c1>=10) && (c2>=10) || (c1>=7) && (c3>=10) || (c1>10) && (c4>=10))
    || ((c2>=10) && (c3>=7) || (c2>=10) && (c4>=10))
    || (c3>=10) && (c4>=10))){

      avgR = (red(c5) + red(c6) + red(c7) + red(c8))/4.0;
      avgG = (green(c5) + green(c6) + green(c7) + green(c8))/4.0;
      avgB = (blue(c5) + blue(c6) + blue(c7) + blue(c8))/4.0;
    }
  }
  return avg = color (avgR,avgG,avgB);

}

