
//PlainGrid class is my first attempt of making from scratch a class to create rectangular 3d grids// 
//without any texture. I suppose there's a canonical fast and elegant way of doing that task, here///
//I have thought the grid in a way that allows a fast displaying method//////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
//TODO: I don´t like ArrayList here, I think it isn´t fast for its purposes here, ´ve to change it///
//TODO2: createGrid as a static method?//////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

class PlainGrid {
  
  int 
  bucketsPerRow,      
  bucketsPerColumn,
  bucketsNumber;       
  float 
  bucketWidth,     
  bucketHeight,
  totalWidth,
  totalHeight;
  ArrayList <PVector[]>
  bucketsVertices;  
  PVector 
  centerPosition;      
  
  ///////////////////////////////////////////////////////////////////CONSTRUCTORS && METHODS INVOLVED
  
  //Square Grid
  PlainGrid (int bucketsPerSide, float bucketSize){                   
    bucketsPerRow = bucketsPerColumn = bucketsPerSide;
    bucketWidth   = bucketHeight     = bucketSize;
    totalWidth    = totalHeight      = bucketsPerSide * bucketSize;
    bucketsNumber = bucketsPerSide  *  bucketsPerSide;
    commonSetup();
  }
  
  //Rectangular Grid
  PlainGrid (int bucketsPerRow, int bucketsPerColumn, float bucketWidth, float bucketHeight) {       
    this.bucketsPerRow    = bucketsPerRow; 
    this.bucketsPerColumn = bucketsPerColumn; 
    this.bucketWidth      = bucketWidth;
    this.bucketHeight     = bucketHeight;
    totalWidth     = bucketsPerRow * bucketWidth;
    totalHeight    = bucketsPerColumn * bucketHeight;
    bucketsNumber  = bucketsPerRow * bucketsPerColumn;
    commonSetup();
  }
  
  void commonSetup(){
    bucketsVertices = createGrid (bucketsPerRow, bucketsPerColumn, bucketWidth, bucketHeight);
    centerPosition  = new PVector(totalWidth * .5 , totalHeight * .5);
    //createGrid();
  }
  
  ArrayList<PVector[]> createGrid(int bucketsPerRow, int bucketsPerColumn, float bucketWidth, float bucketHeight){
    //Create a grid of buckets defines by four vertices,
    //anticlockwise from above-left corner
    
    ArrayList <PVector[]> bucketsVertices = new ArrayList <PVector[]> ();
    
    //Create first element    
  
    PVector[] v= new PVector[4];  
    v[0]= new PVector(0,0,0);
    v[1]= new PVector(0,bucketHeight,0);
    v[2]= new PVector(bucketWidth,bucketHeight,0);
    v[3]= new PVector(bucketWidth,0,0);
    bucketsVertices.add(v);
    
    //Fill up the rest of the first row
    
    for (int i=1; i<bucketsPerRow; i++){
      v= new PVector[4];
      v[0]= bucketsVertices.get(i-1)[3];
      v[1]= bucketsVertices.get(i-1)[2];
      v[2]= new PVector(v[1].x + bucketWidth, v[1].y, 0);
      v[3]= new PVector(v[0].x + bucketWidth, v[0].y, 0);
      bucketsVertices.add(v);
    }

    //And end up the whole grid, iterating row by row  
    
    int k;  //number of the current bucket
    for (int j=1; j<bucketsPerColumn; j++){
      //Create first element of the row
      k= j* bucketsPerRow;
      v= new PVector[4];
      v[0]= bucketsVertices.get(k-bucketsPerRow)[1]; 
      v[1]= new PVector(v[0].x, v[0].y+bucketHeight, 0);
      v[2]= new PVector(v[1].x+bucketWidth, v[1].y, 0);
      v[3]= bucketsVertices.get(k-bucketsPerRow)[2];
      bucketsVertices.add(v);
        //And fill up the rest of the row
        for (int i=1; i<bucketsPerRow; i++){
          k++;
          v= new PVector[4];
          v[0]= bucketsVertices.get(k-1)[3];
          v[1]= bucketsVertices.get(k-1)[2];
          v[2]= new PVector(v[1].x + bucketWidth, v[1].y, 0);
          v[3]= bucketsVertices.get(k-bucketsPerRow)[2];
          bucketsVertices.add(v); 
        }  
     }
     
    return bucketsVertices;
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////OTHER METHODS  

  //Quite straight-forward rendering method
  //TODO: dynamic assignment of rendering methods
  void render(){
    beginShape();
      for (int i=0; i<bucketsNumber; i++){
        PVector[] v = bucketsVertices.get(i);
        for (int j=0; j<v.length; j++){
          vertex(v[j].x,v[j].y,v[j].z);
        }
    }
    endShape();
  }  
  
  
}

