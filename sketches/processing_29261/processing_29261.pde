
int X_SIZE=500, Y_SIZE=500;
 
int [][] grid = new int[X_SIZE+2][Y_SIZE+2];
int counter;
void setup(){
  size(X_SIZE,Y_SIZE);
  frameRate(60);
  background(0);
  for(int i=0;i<X_SIZE+2;i++){
    for(int j=0;j<Y_SIZE+2;j++){
      grid[i][j]=0;
    }
  }
  smooth();
}
 
void draw(){
  counter=counter==5?0:counter;
  counter++;
  if(counter==1){
    background(0);
    noStroke();
    switch((int)random(3)){//choose either red, green, or blue!
      case 0:
      fill(#ff0000);
      break;
      case 1:
      fill(#00ff00);
      break;
      case 2:
      fill(#0000ff);
      break;
    }
    float radius = random(X_SIZE/8,X_SIZE/4);//actually the diameter
    ellipse(random(X_SIZE),random(Y_SIZE),radius,radius);
    loadPixels();
    for(int i=0;i<X_SIZE;i++){
      for(int j=0;j<Y_SIZE;j++){//inefficient way to add ellipse
        float reds = red(grid[i+1][j+1])+red(pixels[i+j*X_SIZE]);
        reds = reds>255?255:reds;
        float greens = green(grid[i+1][j+1])+green(pixels[i+j*X_SIZE]);
        greens = greens>255?255:greens;
        float blues = blue(grid[i+1][j+1])+blue(pixels[i+j*X_SIZE]);
        blues = blues>255?255:blues;
        pixels[i+j*X_SIZE] = color(reds,greens,blues);
      }
    }
    updatePixels();
  } else {
    loadPixels();
    for(int i=0;i<X_SIZE;i++){
      for(int j=0;j<Y_SIZE;j++){
        grid[i+1][j+1]=pixels[i+j*X_SIZE];
      }
    }
    for(int i=0;i<X_SIZE;i++){
      for(int j=0;j<Y_SIZE;j++){//primitive and verbose box blur
        float reds = red(grid[i][j])+red(grid[i+1][j])+red(grid[i+2][j])+red(grid[i][j+1])+red(grid[i+1][j+1])+red(grid[i+2][j+1])+red(grid[i][j+2])+red(grid[i+1][j+2])+red(grid[i+2][j+2]);
        float greens = green(grid[i][j])+green(grid[i+1][j])+green(grid[i+2][j])+green(grid[i][j+1])+green(grid[i+1][j+1])+green(grid[i+2][j+1])+green(grid[i][j+2])+green(grid[i+1][j+2])+green(grid[i+2][j+2]);
        float blues = blue(grid[i][j])+blue(grid[i+1][j])+blue(grid[i+2][j])+blue(grid[i][j+1])+blue(grid[i+1][j+1])+blue(grid[i+2][j+1])+blue(grid[i][j+2])+blue(grid[i+1][j+2])+blue(grid[i+2][j+2]);
        //reds*=0.998;
        //greens*=0.998;
        //blues*=0.998;
        pixels[i+j*X_SIZE]=color(reds/9,greens/9,blues/9);
      }
    }
    updatePixels();
  }
}
  

