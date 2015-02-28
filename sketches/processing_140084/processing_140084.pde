
PImage img;
//String imgFileName = "http://i.imgur.com/KNC7zu2";//"http://i.imgur.com/w988mI5";
String imgFileName = "http://i.imgur.com/Q5irTw7";
//String fileType = "png";
String fileType = "jpg";

int horizontalTriangles = 31;
int verticalTriangles;
float preferredWidth = 600.0;

int rectangleWidth;
int rectangleHeight;
 
void setup() {
  noStroke();  
  img = loadImage(imgFileName+"."+fileType);
  
  verticalTriangles = floor(img.height/(img.width/horizontalTriangles));
  
  rectangleWidth = floor(preferredWidth / horizontalTriangles);
  int realWidth = round(rectangleWidth * horizontalTriangles);  
  int realHeight = round(rectangleWidth * verticalTriangles);  
  rectangleHeight = rectangleWidth;
  
  img.resize(realWidth,realHeight);
  //image(img, 0, 0);
  size(img.width, img.height);
  background (0);
} 
 
void draw() {
  //image(img, 0, 0);  
  triangles();
  //noLoop();
}



void triangles () { 
  int cols = horizontalTriangles;
  int rows = verticalTriangles;
  
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      int xTri1 = i*rectangleWidth;                   //x value topleft
      int yTri1 = j*rectangleHeight;                  //y value topleft
      int xTri2 = i*rectangleWidth + rectangleWidth;  //x value topright
      int yTri2 = j*rectangleHeight;                  //y value topright
      int xTri3 = i*rectangleWidth + rectangleWidth;  //x value bottomright
      int yTri3 = j*rectangleHeight + rectangleHeight;//y value bottomright
      int xTri4 = i*rectangleWidth;                   //x value bottomleft
      int yTri4 = j*rectangleHeight + rectangleHeight;//y value bottomleft
      
      //first 6 samples
      // Pick the first point
      int x1 = int(i*rectangleWidth + 1*rectangleWidth/5);
      int y1 = int(j*rectangleHeight + 1*rectangleHeight/5);
      int loc1 = x1 + y1*img.width;
      
      // Pick the second point
      int x2 = int(i*rectangleWidth + 3*rectangleWidth/5);
      int y2 = int(j*rectangleHeight + 1*rectangleHeight/5);
      int loc2 = x2 + y2*img.width;
      
      // Pick the third point
      int x3 = int(i*rectangleWidth + 1*rectangleWidth/5);
      int y3 = int(j*rectangleHeight + 3*rectangleHeight/5);
      int loc3 = x3 + y3*img.width;      
      
      // Pick the fourth point
      int x4 = int(i*rectangleWidth + 4*rectangleWidth/5);
      int y4 = int(j*rectangleHeight + 2*rectangleHeight/5);
      int loc4 = x4 + y4*img.width;
      
      // Pick the fifth point
      int x5 = int(i*rectangleWidth + 2*rectangleWidth/5);
      int y5 = int(j*rectangleHeight + 4*rectangleHeight/5);
      int loc5 = x5 + y5*img.width;
      
      // Pick the sixth point
      int x6 = int(i*rectangleWidth + 4*rectangleWidth/5);
      int y6 = int(j*rectangleHeight + 4*rectangleHeight/5);
      int loc6 = x6 + y6*img.width;
      
      //next 6 samples
      // Pick the first point
      int x7 = int(i*rectangleWidth + 2*rectangleWidth/5);
      int y7 = int(j*rectangleHeight + 1*rectangleHeight/5);
      int loc7 = x7 + y7*img.width;
      
      // Pick the second point
      int x8 = int(i*rectangleWidth + 4*rectangleWidth/5);
      int y8 = int(j*rectangleHeight + 1*rectangleHeight/5);
      int loc8 = x8 + y8*img.width;
      
      // Pick the third point
      int x9 = int(i*rectangleWidth + 4*rectangleWidth/5);
      int y9 = int(j*rectangleHeight + 3*rectangleHeight/5);
      int loc9 = x9 + y9*img.width;
      
      // Pick the fourth point
      int x10 = int(i*rectangleWidth + 1*rectangleWidth/5);
      int y10 = int(j*rectangleHeight + 2*rectangleHeight/5);
      int loc10 = x10 + y10*img.width;
      
      // Pick the fifth point
      int x11 = int(i*rectangleWidth + 1*rectangleWidth/5);
      int y11 = int(j*rectangleHeight + 4*rectangleHeight/5);
      int loc11 = x11 + y11*img.width;
      
      // Pick the sixth point
      int x12 = int(i*rectangleWidth + 3*rectangleWidth/5);
      int y12 = int(j*rectangleHeight + 4*rectangleHeight/5);
      int loc12 = x12 + y12*img.width;
      
      // Look up the RGB color in the source image  
      loadPixels();
      float r1 = red(img.pixels[loc1]);
      float g1 = green(img.pixels[loc1]);
      float b1 = blue(img.pixels[loc1]);
      float r2 = red(img.pixels[loc2]);
      float g2 = green(img.pixels[loc2]);
      float b2 = blue(img.pixels[loc2]);
      float r3 = red(img.pixels[loc3]);
      float g3 = green(img.pixels[loc3]);
      float b3 = blue(img.pixels[loc3]);
      float r4 = red(img.pixels[loc4]);
      float g4 = green(img.pixels[loc4]);
      float b4 = blue(img.pixels[loc4]);
      float r5 = red(img.pixels[loc5]);
      float g5 = green(img.pixels[loc5]);
      float b5 = blue(img.pixels[loc5]);
      float r6 = red(img.pixels[loc6]);
      float g6 = green(img.pixels[loc6]);
      float b6 = blue(img.pixels[loc6]);
      float r7 = red(img.pixels[loc7]);
      float g7 = green(img.pixels[loc7]);
      float b7 = blue(img.pixels[loc7]);
      float r8 = red(img.pixels[loc8]);
      float g8 = green(img.pixels[loc8]);
      float b8 = blue(img.pixels[loc8]);
      float r9 = red(img.pixels[loc9]);
      float g9 = green(img.pixels[loc9]);
      float b9 = blue(img.pixels[loc9]);
      float r10 = red(img.pixels[loc10]);
      float g10 = green(img.pixels[loc10]);
      float b10 = blue(img.pixels[loc10]);
      float r11 = red(img.pixels[loc11]);
      float g11 = green(img.pixels[loc11]);
      float b11 = blue(img.pixels[loc11]);
      float r12 = red(img.pixels[loc12]);
      float g12 = green(img.pixels[loc12]);
      float b12 = blue(img.pixels[loc12]);
      
      float hueColor1 = hue(color(r1,g1,b1));
      float hueColor2 = hue(color(r2,g2,b2));
      float hueColor3 = hue(color(r3,g3,b3));
      float hueColor4 = hue(color(r4,g4,b4));
      float hueColor5 = hue(color(r5,g5,b5));
      float hueColor6 = hue(color(r6,g6,b6));
      float hueColor7 = hue(color(r7,g7,b7));
      float hueColor8 = hue(color(r8,g8,b8));
      float hueColor9 = hue(color(r9,g9,b9));
      float hueColor10 = hue(color(r10,g10,b10));
      float hueColor11 = hue(color(r11,g11,b11));
      float hueColor12 = hue(color(r12,g12,b12));
      
      float avgHueSit1 = (hueColor1 + hueColor2 + hueColor3)/3;
      float avgHueSit2 = (hueColor4 + hueColor5 + hueColor6)/3;
      float avgHueSit3 = (hueColor7 + hueColor8 + hueColor9)/3;
      float avgHueSit4 = (hueColor10 + hueColor11 + hueColor12)/3;
      
      float distanceHue1 = abs(hueColor1 -  avgHueSit1);
      float distanceHue2 = abs(hueColor2 -  avgHueSit1);
      float distanceHue3 = abs(hueColor3 -  avgHueSit1);
      float distanceHue4 = abs(hueColor4 -  avgHueSit2);
      float distanceHue5 = abs(hueColor5 -  avgHueSit2);
      float distanceHue6 = abs(hueColor6 -  avgHueSit2);
      float distanceHue7 = abs(hueColor7 -  avgHueSit3);
      float distanceHue8 = abs(hueColor8 -  avgHueSit3);
      float distanceHue9 = abs(hueColor9 -  avgHueSit3);
      float distanceHue10 = abs(hueColor10 -  avgHueSit4);
      float distanceHue11 = abs(hueColor11 -  avgHueSit4);
      float distanceHue12 = abs(hueColor12 -  avgHueSit4);
      
      float distanceSit1 = distanceHue1 + distanceHue2 + distanceHue3;
      float distanceSit2 = distanceHue4 + distanceHue5 + distanceHue6; 
      float distanceSit3 = distanceHue7 + distanceHue8 + distanceHue9;
      float distanceSit4 = distanceHue10 + distanceHue11 + distanceHue12;
      
      float absDistanceSit1n2 = abs(distanceSit1 - distanceSit2);
      float absDistanceSit3n4 = abs(distanceSit3 - distanceSit4);
      
      int directionOfTriangle;
      float redColor1;
      float greenColor1;
      float blueColor1;
      float redColor2;
      float greenColor2;
      float blueColor2;
      if (absDistanceSit1n2 < absDistanceSit3n4) {
        redColor1 = (r1 + r2 + r3)/3;
        greenColor1 = (g1 + g2 + g3)/3;
        blueColor1 = (b1 + b2 + b3)/3;
        redColor2 = (r4 + r5 + r6)/3;
        greenColor2 = (g4 + g5 + g6)/3;
        blueColor2 = (b4 + b5 + b6)/3;
        directionOfTriangle = 1;
      } else {
        redColor1 = (r7 + r8 + r9)/3;
        greenColor1 = (g7 + g8 + g9)/3;
        blueColor1 = (b7 + b8 + b9)/3;
        redColor2 = (r10 + r11 + r12)/3;
        greenColor2 = (g10 + g11 + g12)/3;
        blueColor2 = (b10 + b11 + b12)/3;
        directionOfTriangle = 2;
      }
      
      switch(directionOfTriangle) {
      case 1:
        fill(redColor1, greenColor1, blueColor1);
        triangle(xTri1, yTri1, xTri2, yTri2, xTri4, yTri4);
        rect(i*rectangleWidth, j*rectangleHeight, rectangleWidth, rectangleHeight);
        fill(redColor2, greenColor2, blueColor2);
        //rect(i*rectangleWidth, j*rectangleHeight, rectangleWidth, rectangleHeight);
        triangle(xTri2, yTri2, xTri3, yTri3, xTri4, yTri4);   
      break;
      case 2:
        fill(redColor1, greenColor1, blueColor1);
        triangle(xTri1, yTri1, xTri2, yTri2, xTri3, yTri3);
        rect(i*rectangleWidth, j*rectangleHeight, rectangleWidth, rectangleHeight);
        fill(redColor2, greenColor2, blueColor2);
        //rect(i*rectangleWidth, j*rectangleHeight, rectangleWidth, rectangleHeight);
        triangle(xTri1, yTri1, xTri3, yTri3, xTri4, yTri4);     
      break;
      default:
      break;   
      }
    }
  }
}

void colorComparison (int i, int j) {
  
      /*
      float brightnessColor1 = brightness(color(r1,g1,b1));
      float brightnessColor2 = brightness(color(r2,g2,b2));
      float brightnessColor3 = brightness(color(r3,g3,b3));
      float brightnessColor4 = brightness(color(r4,g4,b4));
      float brightnessColor5 = brightness(color(r5,g5,b5));
      float brightnessColor6 = brightness(color(r6,g6,b6));
      float brightnessColor7 = brightness(color(r7,g7,b7));
      float brightnessColor8 = brightness(color(r8,g8,b8));
      float brightnessColor9 = brightness(color(r9,g9,b9));
      float brightnessColor10 = brightness(color(r10,g10,b10));
      float brightnessColor11 = brightness(color(r11,g11,b11));
      float brightnessColor12 = brightness(color(r12,g12,b12));
      
      float avgBrightnessSit1 = (brightnessColor1 + brightnessColor2 + brightnessColor3)/3;
      float avgBrightnessSit2 = (brightnessColor4 + brightnessColor5 + brightnessColor6)/3;
      float avgBrightnessSit3 = (brightnessColor7 + brightnessColor8 + brightnessColor9)/3;
      float avgBrightnessSit4 = (brightnessColor10 + brightnessColor11 + brightnessColor12)/3;
      
      float saturationColor1 = saturation(color(r1,g1,b1));
      float saturationColor2 = saturation(color(r2,g2,b2));
      float saturationColor3 = saturation(color(r3,g3,b3));
      float saturationColor4 = saturation(color(r4,g4,b4));
      float saturationColor5 = saturation(color(r5,g5,b5));
      float saturationColor6 = saturation(color(r6,g6,b6));
      float saturationColor7 = saturation(color(r7,g7,b7));
      float saturationColor8 = saturation(color(r8,g8,b8));
      float saturationColor9 = saturation(color(r9,g9,b9));
      float saturationColor10 = saturation(color(r10,g10,b10));
      float saturationColor11 = saturation(color(r11,g11,b11));
      float saturationColor12 = saturation(color(r12,g12,b12));
      
      float avgSaturationSit1 = (saturationColor1 + saturationColor2 + saturationColor3)/3;
      float avgSaturationSit2 = (saturationColor4 + saturationColor5 + saturationColor6)/3;
      float avgSaturationSit3 = (saturationColor7 + saturationColor8 + saturationColor9)/3;
      float avgSaturationSit4 = (saturationColor10 + saturationColor11 + saturationColor12)/3;
      */
}

