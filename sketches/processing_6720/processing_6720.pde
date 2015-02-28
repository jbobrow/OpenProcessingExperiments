


int numShapes = 10;

//initialize arrays for shape points
float[][]xpoints = new float[numShapes][4];
float[][]ypoints = new float[numShapes][4];

//initialize arrays for target shapes
float[][]xtarget = new float[numShapes][4];
float[][]ytarget = new float[numShapes][4];

//initialize array for shape filling
int fillNumber = int(random(numShapes));

void setup(){
  size(800,800);
  fill(255,255,255,0);
  stroke(0,0,0,50);
  smooth();
  
  //initialize points and target
  //count through index for each shape
  for(int i=0; i<numShapes; i++){
    //fill each index with 4 points for each shape
    for(int j=0; j<4; j++){
      xpoints[i][j] = (random(width*1.5))-width*.25;
      ypoints[i][j] = (random(height*1.5))-height*.25;
      xtarget[i][j] = (random(width*1.5))-width*.25;
      ytarget[i][j] = (random(height*1.5))-height*.25;
    }
  }
}

void draw(){
  background(255);
  quadDrawer();
  quadCompare();
}

void quadDrawer(){
  for(int i=0; i<numShapes; i++){ 
    if(i==fillNumber){
      fill(0,30); 
    }
    else{
      fill(0,0); 
    }
    quad(xpoints[i][0],ypoints[i][0],xpoints[i][1],ypoints[i][1],
      xpoints[i][2],ypoints[i][2],xpoints[i][3],ypoints[i][3]);
  }
}

void quadCompare(){
  for(int i=0; i<numShapes; i++){
    for(int j=0; j<4; j++){
      if(int(xpoints[i][j])<int(xtarget[i][j])){
        xpoints[i][j]+=1;
      }
      if(int(xpoints[i][j])>int(xtarget[i][j])){
        xpoints[i][j]-=1; 
      }
      if(int(xpoints[i][j])==int(xtarget[i][j])){
        xtarget[i][j] = (random(width*1.5))-(width*.25); 
      }
      if(int(ypoints[i][j])<int(ytarget[i][j])){
        ypoints[i][j]+=1;
      }
      if(int(ypoints[i][j])>int(ytarget[i][j])){
        ypoints[i][j]-=1; 
      }
      if(int(ypoints[i][j])==int(ytarget[i][j])){
        ytarget[i][j] = (random(height*1.5))-(height*.25); 
      }
    }
  } 
}

void mousePressed(){
   fillNumber=int(random(numShapes));
}

