
import java.util.ArrayList;


String line;
ArrayList<Float> pts = new ArrayList<Float>(4096 * 2);
int count = 0;
BufferedReader reader;
float colorSpeed = 1;
float rippleSpeed = 1;
int[] choosy = {0,1,2};
float[] colores = {0,0,0};
float dataWidth = 1024.0f;
float scalingFactor;


public void setup() {
  size(800,800);
  background(255);
  reader = createReader("coords_4096.txt");
  initCoords();
  smooth();
}


public void initCoords() {
  boolean isGood = true;
  scalingFactor = width/dataWidth;
  while (isGood) {
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      isGood = false;
    } 
    else {
      String[] pieces = split(line, ' ');
      float x = (Float.valueOf(pieces[0]) + 8) * scalingFactor;
      float y = (Float.valueOf(pieces[1]) + 8) * scalingFactor;
      pts.add(x);
      pts.add(y);
    }
  }
}


public void draw() {
  float fx = 21.0f * colorSpeed;
  float fy = 34.0f * colorSpeed;
  float kx = 2 * PI * (count % fx)/fx;
  float ky = 2 * PI * (count % fy)/fy;
  float xctr = width/2;
  float yctr = height/2;
  colorMode(RGB, 1.0);
  background(0.0);
  fill(0);
  noStroke();
  for (int i = 0; i < pts.size(); ) {
    float x = pts.get(i++);
    float y = pts.get(i++);
    float d = dist(x, y, xctr, yctr);
    float c0 = (cos(x) + 1)/2;
    float c1 = (sin(y) + 1)/2;
    float c2 = 1 - (cos(d/width * 5 * PI + kx) + 1)/2;
    colores[0] = c0;
    colores[1] = c1;
    colores[2] = c2;
    fill(colores[choosy[0]], colores[choosy[1]], colores[choosy[2]]);
    // make concentric rings
    float w = (cos(rippleSpeed * d/width * PI + kx) * 8 ) + 9;
    // muddy the signal
    w += sin(y + ky) * 6;
    // compensate for resized window
    w = w * scalingFactor;
    ellipse(x,y,w,w);
  }
  count++;
}


void mouseMoved() {
  float xctr = width/2;
  float yctr = height/2;
  // float d =  dist(mouseX, mouseY, xctr, yctr);
  float d =  mouseY - yctr;
  float newSpeed = d * 34.0f/width;
  if (newSpeed != rippleSpeed) {
    rippleSpeed = newSpeed;
  }
  newSpeed = (xctr - mouseX)/width + 1.0f;
  if (newSpeed != colorSpeed) {
    colorSpeed = newSpeed;
  }
}


void keyPressed() {
  // step to next permutation when spacebar is pressed
  if(key==' ') {
    boolean hasNextPerm = nextPerm(choosy);
    if (!hasNextPerm) {
      // set the array to its beginning state
      choosy[0] = 0;
      choosy[1] = 1;
      choosy[2] = 2;
    }
    // println(choosy[0] +", "+choosy[1] +", "+ choosy[2]);
  }
}


/**
 * Step to next permutation of an Array of integers. The next permutation is the one
 * that would appear next in a sorted list of all permutations, where the sorting function
 * orders in descending order. In the final permutation, each nubmer is greater than the previous
 * and no more permutations are possible. This is an impementation of an algorithm described by 
 * Edsger Dijkstra in "A Discipline of Programming" [Prentice-Hall, 1976].
 * @return   true if the permutation was sucessfully generated, otherwise false
 */
boolean nextPerm(int[] permArray) {
  int i = permArray.length - 2;
  while (permArray[i] >= permArray[i + 1]) {
    if (i-- <= 0) {
      // permutation is in terminal ordering
      return false;
    }
  }
  int j = permArray.length - 1;
  while (permArray[j] <= permArray[i]) j--;
  swap(i, j, permArray);
  i++;
  j = permArray.length - 1;
  while (i < j) {
    swap(i, j, permArray);
    i++;
    j--;
  }
  /* println("i: " + i + " j: " + j); */
  return true;
}


void swap(int i, int j, int[] permArray) {
  int temp = permArray[i];
  permArray[i] = permArray[j];
  permArray[j] = temp;
}


