
int windowX = 800;
int windowY = 600;
float distance = 0;
int cube = 19;
int columns = cube;
int rows = cube;
int layers = cube;
float boxSize = 20;
float margin = 0;
boolean[][][] data;
boolean[][][] nextData;
boolean isNoStroke;
int cubeCount = 0;

//Fonts
PFont myFont = createFont("Free Sans", 10);

void setup(){
  textFont(myFont);
  isNoStroke = true;
  strokeWeight(2);
  //smooth();	
  
  //frameRate(2);
  data = new boolean[layers+2][rows+2][columns+2];
  nextData = new boolean[layers+2][rows+2][columns+2];
  for(int k = 0; k < layers; k++){
    for(int j = 0; j < rows; j++){
      for(int i = 0; i < columns; i++){
        //if(k==1 || j==1 || i==1 || k == layers-2 || j == rows-2 || i == columns-2){
         // data[k][j][i] = true;
          //cubeCount++;
        //}else{
          data[k][j][i] = false;
       // }
      }
    }
  }
  /*
  data[12][12][12] = true;
  data[12][13][13] = true;
  data[12][12][13] = true;
  data[12][12][11] = true;
  data[12][13][12] = true;
  data[12][11][12] = true;
  data[13][12][12] = true;
  data[11][12][12] = true;
  */
  data[(layers/2)][(rows/2)][(columns/2)] = true;
  data[(layers/2)][(rows/2)][(columns/2)+1] = true;
  data[(layers/2)][(rows/2)][(columns/2)-1] = true;
  data[(layers/2)][(rows/2)+1][(columns/2)] = true;
  data[(layers/2)][(rows/2)-1][(columns/2)] = true;
  data[(layers/2)+1][(rows/2)][(columns/2)] = true;
  data[(layers/2)-1][(rows/2)][(columns/2)] = true;
  cubeCount += 7;
  
  
  //data[0][0][columns-1] = true;
  //data[0][rows-1][0] = true;
  //data[0][rows-1][columns-1] = true;
  //data[layers-1][0][0] = true;
  //data[layers-1][0][columns-1] = true;
  //data[layers-1][rows-1][0] = true;
  //data[layers-1][rows-1][columns-1] = true;
  size(windowX, windowY, P3D);
  //lights();
   	



  background(32,32,32);
  //stroke(255);
  //stroke(0,0,0,10);
  noStroke();
  //noFill();
  
  
}

int isLive(int k, int j, int i){
  if (data[k][j][i] == true){
    return 1;
  } else{
    return 0;
  }
}

void updateCube(int k, int j, int i){
  int result = 0;
    result += isLive(k  ,j  ,i  );
    result += isLive(k  ,j  ,i-1);
    result += isLive(k  ,j  ,i+1);
    result += isLive(k  ,j-1,i  );
    result += isLive(k  ,j-1,i-1);
    result += isLive(k  ,j-1,i+1);
    result += isLive(k  ,j+1,i  );
    result += isLive(k  ,j+1,i-1);
    result += isLive(k  ,j+1,i+1);
    result += isLive(k-1,j  ,i  );
    result += isLive(k-1,j  ,i-1);
    result += isLive(k-1,j  ,i+1);
    result += isLive(k-1,j-1,i  );
    result += isLive(k-1,j-1,i-1);
    result += isLive(k-1,j-1,i+1);
    result += isLive(k-1,j+1,i  );
    result += isLive(k-1,j+1,i-1);
    result += isLive(k-1,j+1,i+1);
    result += isLive(k+1,j  ,i  );
    result += isLive(k+1,j  ,i-1);
    result += isLive(k+1,j  ,i+1);
    result += isLive(k+1,j-1,i  );
    result += isLive(k+1,j-1,i-1);
    result += isLive(k+1,j-1,i+1);
    result += isLive(k+1,j+1,i  );
    result += isLive(k+1,j+1,i-1);
    result += isLive(k+1,j+1,i+1);
    
  /*if( result < 3 || result > 4){
    nextData[k][j][i] = false;
  } else {
    if(result == 3 || result == 4){
      nextData[k][j][i] = true;
    } else {
      //result ==2,3;
      nextData[k][j][i] = data[k][j][i];
    }
  }*/
  if(data[k][j][i] == true){
    //live cube
    if(result > 6 || result < 4){
      nextData[k][j][i] = false;
    } else {
      nextData[k][j][i] = true;
      cubeCount++;
    }
  } else {
    //dead space
    if(result == 5 || result == 4){
      nextData[k][j][i] = true;
      cubeCount++;
    }else{
      nextData[k][j][i] = false;
    }
  }
  
}

void mouseDragged(){
  distance += 5*(pmouseY-mouseY);
}

void mouseClicked(){
  if(isNoStroke){
    stroke(0);
    isNoStroke = false;
    
  } else {
    noStroke();
    
    isNoStroke = true;
  }
}

void updateScene(){
  cubeCount = 0;
  for (int k = 1; k < layers-1; k++){
    for (int j = 1; j < rows-1; j++){
      for (int i = 1; i < columns-1; i++){
        updateCube(k,j,i);
      }
    }
  }
    for (int k = 1; k < layers-1; k++){
    for (int j = 1; j < rows-1; j++){
      for (int i = 1; i < columns-1; i++){
        data[k][j][i] = nextData[k][j][i];
      }
    }
  }
}

void showScene(){
  background(0,0,0);
  //background(32,32,32);
  
  pushMatrix();
  translate(width/2, height/2, -distance);
  //int r = 4000;
  float r = frameCount * 0.03;
  rotateY(r+QUARTER_PI);
  rotateX(r);
  rotateZ(r);

  for (float k = 1; k < layers-1; k += 1){
    pushMatrix();
    for (float j = 1; j < rows-1; j += 1){
      pushMatrix();
      for (float i = 1; i < columns-1; i += 1){
        pushMatrix();
        translate((k-(layers/2))*boxSize, (j-(rows/2))*boxSize, (i-(columns/2))*boxSize);
        if(data[int(k)][int(j)][int(i)] == true){
          fill(map(k,0,layers-2,0,255),map(j,0,layers-2,0,255),map(i,0,layers-2,0,255));//,100);
          //stroke(0,0,0,255);//,10);
          box(boxSize);
        }
        
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
  popMatrix();
  //text("CubeCount: "+cubeCount,400,250,400);
}

void draw(){
  
  lights();
  showScene();
  //if(frameCount%10 == 0){
    //for(int i = 0; i < 10000; i++){ 
      
      updateScene();
      

    //  println(frameRate);
   // }
  //}
  
}

