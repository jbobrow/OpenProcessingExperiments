
/*
Playing with low res graphics ideas
 
 Kawandeep Virdee
 
 11/17/11
 */
int width = 600;
int height = 480;

int w = 60;
int h = 48;
float c = 0;

int[][] vis = new int[w][h];


void setup(){
  colorMode(HSB);

  size(width, height);

  //init array
  for(int i=0; i<w; i++){
    for(int j=0;j<h;j++){
      vis[i][j]=0;  //vary this from 0 to 255
    } 
  }


}

void draw(){
  //background, shift alpha for fade
  fill(0,255,0,10);
  rect(0,0,width,height);
  
  displayGrid(int(c));
  randomizeGrid();
  c+=.05;

  
  c%=255;

}



void displayGrid(int col){
  for(int i=0; i<w; i++){
    for(int j=0;j<h;j++){
      noStroke();
      fill(col,vis[i][j],255,50);
      rect(i*10, j*10, 10, 10);
    } 
  }
}

void randomizeGrid(){
   for(int i=0; i<w; i++){
    for(int j=0;j<h;j++){
      vis[i][j] = int(random(255));
    } 
  }
}
                                
