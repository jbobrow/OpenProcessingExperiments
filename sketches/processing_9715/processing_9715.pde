
int cols = 20 ;
int rows = 30;
float[][] size = new float[cols][rows];
float[][] trans = new float[cols][rows];

void setup() {
  size(400,800);
  smooth();
  background(0);
  for(int i =0; i<cols; i++){
    for(int j =0; j<rows; j++){
	size[i][j] = random(2,15);
	trans[i][j] = random(20,255);
    }
  }
  noStroke();
  frameRate(10);
}


void draw() {

  background(0);
  fill(255,0,0);
  for(int i =0; i<cols; i++){
    for(int j =0; j<rows; j++){
	fill(255,0,0,trans[i][j]);
	ellipse(i*(width/cols+1),j*(height/rows+1),size[i][j],size[i][j]);
    }
  }
shift();
}


void shift(){

  //copy the rows
  for(int i =0; i<cols; i++){
    for(int j =rows-1; j>0; j--){
	trans[i][j] = trans[i][j-1];   
	size[i][j] = size[i][j-1];   
 
    }
  }
  //fill the first row with new random data
   for(int i =0; i<cols; i++){
     size[i][0] = random(2,15);
    trans[i][0] = random(20,255);
   }

}

