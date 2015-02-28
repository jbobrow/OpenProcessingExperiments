
/**
 * Brian's Game of Chance
 *
 * A probablistic version of Conway's Game of Life.  In this game, each pixel's 
 * next color is determined by its 8 immediate neighbors.  The occurance of each bit set
 * to 1 is summed across its neighbors and then given a probability of being a 1 or a 0 
 * based on the sum.  For instance, if the greatest bit is 1 in 3 of the 8 neighbors,
 * then the chance that the center pixel's greatest bit will be 1 on the next draw is 3/8.
 * Conversely, there is a 5/8 chance that the greatest bit will be set to 0. This algorithm
 * is carried out for each bit position in the RGB space to determine the complete color.
 * The alpha channel is ignored.
 */
 
color[][] buffer;
color[][] swap;

void setup(){
  size(100, 100);
  background(0);
  buffer = new color[width][height];
  swap = new color[width][height];
  for(int i=0; i<height; i++) {
    for(int j=0; j<width; j++) {
      swap[j][i] = color(random(256),random(256),random(256));
    }
  }
}

void draw(){
  arrayCopy(swap,buffer);
  
  for(int i=0; i<height; i++) {
    for(int j=0; j<width; j++) {
      stroke(buffer[j][i]);
      point(j, i);
      
      swap[j][i] = nextColor(j,i);
    }
  }
}

color nextColor(int j, int i){
  int[] inputsR = new int[8];
  int[] inputsG = new int[8];
  int[] inputsB = new int[8];
  
  //int a = (argb >> 24) & 0xFF;
  //int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
  //int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
  //int b = argb & 0xFF;          // Faster way of getting blue(argb)

  int[] x = new int[8];
  int[] y = new int[8];
  
  x[0] = j==0?width-1:j-1;
  y[0] = i==0?height-1:i-1;
  x[1] = j;
  y[1] = i==0?height-1:i-1;
  x[2] = j==width-1?0:j+1;
  y[2] = i==0?height-1:i-1;
  
  x[3] = j==0?width-1:j-1;
  y[3] = i;
  x[4] = j==width-1?0:j+1;;
  y[4] = i;
  
  x[5] = j==0?width-1:j-1;
  y[5] = i==height-1?0:i+1;
  x[6] = j;
  y[6] = i==height-1?0:i+1;
  x[7] = j==width-1?0:j+1;
  y[7] = i==height-1?0:i+1;
  
  for(int q=0;q<8;q++){
    color input = buffer[x[q]][y[q]];
    inputsR[q] = (input >> 16) & 0xFF;
    inputsG[q] = (input >> 8) & 0xFF;
    inputsB[q] = input & 0xFF;
  }
  
  int newR = getNew(inputsR);
  int newG = getNew(inputsG);
  int newB = getNew(inputsB);
  
  return color(newR,newG,newB);
}

int getNew(int[] inputs){
  int newC = 0;
  
  for(int i=0;i<8;i++){
    int count = 0;
    for(int j=0;j<8;j++){
      count += (inputs[j] >> i) & 0x01;
    } 

    newC = newC | (newBit(count) << i);
  }
  
  return newC;
}

int newBit(int count){
 int bit = (count > random(8))?1:0;
  return bit;
}

