
import surface.calculation.*;
import surface.*;

int sizeFactor = 7;
int arraySize = (int)pow(2,sizeFactor)+1; // 8, 257
float heightMap[][] = new float[arraySize][arraySize];
int windowSize = 800;
float strFactor = .8;
float disFactor = 300;
int startHeight = 0;

int numSmoothing = 3;

float maxHeight = 0;
float minHeight = 0;

PFont font;



void setup() {
  size(900,700,P3D);
  background(150);
  
  font = loadFont("Serif-48.vlw");
  textFont(font,16);
  
  for(int y=0; y<arraySize; y++) {
    for(int x=0; x<arraySize; x++) {
      //heightMap[x][y] = x*y*20;///(size/2);//random(10,100);   
      if((x==0 || x==arraySize-1) && (y==0 || y==arraySize-1)) {
        heightMap[x][y] = startHeight; // Seed corners with 50
      }
      else {
        heightMap[x][y] = 0;
      }
    }
  }
  noStroke();
  //noLoop();
  
  iterate();
  
}

void draw() {  
  translate(width/2,height/2);
  background(255);
  
  
 pushMatrix();
  // Rotate
  rotateX((float)mouseY/150);
  //rotateX(45);
  rotateZ((float)mouseX/75);
  //rotateZ((float)frameCount/200);
  if(millis()%5000 == 0) iterate();
  
  lights();

  getMinMax();
  //stroke(100);
  //beginShape();
  for(int y=0; y<arraySize-1; y++) {
    for(int x=0; x<arraySize-1; x++) {
      float xPos = (((float)x/arraySize) - .5)*windowSize*strFactor; 
      float yPos = (((float)y/arraySize) - .5)*windowSize*strFactor;
      
      float xPos2 = xPos + ((float)1/arraySize)*windowSize*strFactor;
      float yPos2 = yPos;
      
      float xPos3 = xPos + ((float)1/arraySize)*windowSize*strFactor;
      float yPos3 = yPos + ((float)1/arraySize)*windowSize*strFactor;
      
      float xPos4 = xPos;
      float yPos4 = yPos + ((float)1/arraySize)*windowSize*strFactor;

      float zPos = heightMap[x][y]*strFactor;
      float zPos2 = heightMap[x+1][y]*strFactor;
      float zPos3 = heightMap[x+1][y+1]*strFactor;
      float zPos4 = heightMap[x][y+1]*strFactor;
      
      int shade = (int)map(heightMap[x][y], minHeight, maxHeight, 10, 255);
      fill(0,shade,0);
      
      beginShape(QUADS);
      vertex(xPos,yPos,zPos);
      vertex(xPos2,yPos2,zPos2);
      vertex(xPos3,yPos3,zPos3);
      vertex(xPos4,yPos4,zPos4);
      endShape();
      
      /*
      // Point
      stroke(0);      
      point(xPos,yPos,zPos);
      */
      
      /*
      // Sphere
      noStroke(); 
      translate(xPos,yPos,zPos);
      sphere(5);
      */
      
      /*
      // Box 
      translate(xPos,yPos,zPos/2);
      box(strFactor,strFactor,zPos);
      */
      /*
      // Index Debug
      String pos = Integer.toString(x) + " " + Integer.toString(y);
      text(pos,xPos*.5,yPos*.5,0);
      */
      //popMatrix();
    }
  }
  popMatrix();
  fill(0);
  textFont(font,16);
  String str = "Random Factor: " + Float.toString(disFactor);
  String str2 = "Smoothing Level: " + Integer.toString(numSmoothing);

  text(str + "   " + str2,-width/2 + 20,-height/2 + 20);
  textFont(font,32);
  //text("Fractal Terrain",30, -height/2 + 40);
  
  textFont(font,14);
  text("Press Q or E to change Random  Factor",-width/2 + 20,-height/2 + 40);
  text("Press A or D to change Zoom Level",-width/2 + 20, -height/2 + 60);
  text("Press Z or C to change Smoothing Level", -width/2 + 20, -height/2 + 80);
  text("Click to generate new fractal",-width/2+20,-height/2+100);
  text("Press space to smooth terrain", -width/2+20,-height/2+120);
  text("Press R to reset parameters", -width/2+20, -height/2 + 160);
  //endShape();
}

void keyPressed() {
  if(key == 'e') disFactor +=10;
  if(key == 'q') disFactor -=10;
  if(key == 'a') strFactor *=1.1;
  if(key == 'd') strFactor /=1.1;
  if(key == ' ') smoothTerrain();
  if(key == 'z') numSmoothing--;
  if(key == 'c') numSmoothing++;
  if(key == 'r') {
    numSmoothing = 3;
    strFactor = .8;
    disFactor = 300;
  }
  
  numSmoothing = constrain(numSmoothing, 1, 20);
  disFactor = constrain(disFactor,80,1000);
  strFactor = constrain(strFactor,0.5,100000);
  
  //if(key == 'w')
  //println(strFactor);
  //if(key == ' ') iterate();
}
void mouseReleased() {
  iterate();
}

void getMinMax() {
  for(int y=0; y<arraySize; y++) {
    for(int x=0; x<arraySize; x++) {
      maxHeight = max(heightMap[x][y],maxHeight);
      minHeight = min(heightMap[x][y],minHeight);
    }
  }
  //println(minHeight + " " + maxHeight);
}

void smoothTerrain() {
  float tempHeightMap[][] = new float[arraySize][arraySize];
  for(int y=1;y<arraySize-1;y++) {
    for(int x=1;x<arraySize-1;x++) {
      //if(x2 == arraySize-1)
      tempHeightMap[x][y] = (heightMap[x-1][y-1]+ heightMap[x][y-1]+ heightMap[x+1][y-1]+ 
                            heightMap[x-1][y]+   heightMap[x][y]+   heightMap[x+1][y]+ 
                            heightMap[x-1][y+1]+ heightMap[x][y+1]+ heightMap[x+1][y+1])/9;
                            
      /*
      tempHeightMap[x][y] = (float)(heightMap[x][y-1] +
                            heightMap[x-1][y]+   heightMap[x][y]+   heightMap[x+1][y]+ 
                            heightMap[x][y+1])/5;
      */
                            
      //println(tempHeightMap[x][y]);
    }
  }
  
  for(int x=1; x<arraySize-1;x++) {
    int y = 0; 
    tempHeightMap[x][0] = (heightMap[x-1][y]+   heightMap[x][y]+   heightMap[x+1][y]+ 
                           heightMap[x-1][y+1]+ heightMap[x][y+1]+ heightMap[x+1][y+1])/6;
    y = arraySize-1;                       
    tempHeightMap[x][arraySize-1] = (heightMap[x-1][y-1]+ heightMap[x][y-1]+ heightMap[x+1][y-1]+ 
                                    heightMap[x-1][y]+   heightMap[x][y]+   heightMap[x+1][y])/6;
  }
                            
  for(int y=1; y<arraySize-1;y++) {
    int x = 0;
    tempHeightMap[0][y] = (heightMap[x][y-1]+ heightMap[x+1][y-1]+ 
                           heightMap[x][y]+   heightMap[x+1][y]+ 
                           heightMap[x][y+1]+ heightMap[x+1][y+1])/6;
                           
    x = arraySize-1;
    tempHeightMap[arraySize-1][y] = (heightMap[x-1][y-1]+ heightMap[x][y-1]+
                                     heightMap[x-1][y]+   heightMap[x][y]+
                                     heightMap[x-1][y+1]+ heightMap[x][y+1])/6;
  }
  
                                     
  for(int y=0;y<arraySize;y++) {
    for(int x=0;x<arraySize;x++) {
      heightMap[x][y] = tempHeightMap[x][y];
    }
  }      
}
void iterate() {
  //calcStep(0,0,arraySize-1);
  //print(sizeFactor);
  int lastIndex = arraySize-1;
  
  for(int increment = lastIndex; increment>=2; increment /= 2) {
    for(int y=0; y < lastIndex; y+=increment) {
      for(int x=0; x < lastIndex; x+=increment) {
        diamond(x,y,increment);
      }
    }        
    for(int y=0; y < lastIndex; y+=increment) {
      for(int x=0; x < lastIndex; x+=increment) {
        //println(x + " " + y);
        boolean left = x==0;
        boolean top = y==0;
        square(x,y,increment,top,left);
      }
    }
    
  }
  for(int i=0; i<numSmoothing; i++) {
    smoothTerrain();
    //println(i);
  }
  
  //println("\n");  
}

void diamond(int x, int y, int size) {
  midPointMod(x,y,  x+size,y,  x+size,y+size,  x,x+size); // Diamond
}
  
void square(int x, int y, int size, boolean top, boolean left) {
  int midX = x + size/2;
  int midY = y + size/2;
  int endX = x+size;
  int endY = y+size;
  
    
  if(top) {
    // Top Center
    midPointMod(x,y,  midX,midY,  endX,y,  midX,abs(y-midY)%2);
  }
   if(left) { //else
    // Left Center
    midPointMod(x,endY,  midX,midY,  x,y,  abs(x-midX)%2,midY);
  }
  //else {
    diamond(x,y,size);
    // Right Center
    midPointMod(endX,y,  midX,midY,  endX,endY,  (endX+midX)%2,midY);
    //printArr(heightMap);
    
    // Bottom Center
    midPointMod(endX,endY,  midX,midY,  x,endY,  midX,(endY+midY)%2);
    //printArr(heightMap);
  //}
}

void midPointMod(int ax, int ay, int bx, int by, int cx, int cy, int dx, int dy) {
  float w = heightMap[ax][ay];
  float x = heightMap[bx][by];
  float y = heightMap[cx][cy];
  float z = heightMap[dx][dy];
  float avg = (w+x+y+z)/4; 
  //float avg = pow((x*w*y*z),1/4); 
  
  float displacement;
  /*
  if(ax != cx && ay != cy) {
    displacement = abs(cx-ax);
  }
  else {
    displacement = abs(cx-ax) + abs(cy-ay);
  }
  */
  displacement = abs(cx-ax) + abs(cy-ay);
  
  displacement /= arraySize-1;
  
  float randRange = displacement*disFactor;

  avg += random(-1,1)*randRange;
  
  //println("Displacement at " + ax + "," + ay + ": " + displacement + " Random Range: " + randRange + " Avg. : " + avg);
  int midX = (ax+cx)/2;

  int midY = (ay+cy)/2;
  //println(midX + " " + midY);
  
  heightMap[midX][midY] = avg;
}  

void printArr(float arr[][]) {
  for(int y=0;y<arr.length;y++) {
    for(int x=0;x<arr[y].length;x++) {
      print((int)arr[x][y] + " ");
    }
    println("");
  }
  println("");
}
      
      

