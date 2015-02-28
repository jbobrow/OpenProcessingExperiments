
/**
  HashGrid.
  An array of 'buckets'. Each bucket is a container of elements implementing the Locable interface, and is
  defined by a rectangular boundary [bW * bH].
  When an object asks the map for neighbours of a given element, the map returns all elements contained
  into the buckets nearest to the container wherein the element resides. 
*/


class HashGrid {
  
  //The map itself
  ArrayList <Locable> [] buckets;
  //Bucket and map parameters: 
  // · bW and bH define the bucket dimensions, 
  // · rowB and colB are the number of buckets per row and column
  int bW, bH, rowB, colB;
  
  /**
    Constructor
  */
  
  HashGrid (float distanceToCheck, PGraphics c) 
  {
    //Calculate dimensions of buckets and map
    int d = int (distanceToCheck) - 1;
    for (int i=d; ++i<c.width;)  if (c.width %i==0) {bW = i; break;}
    for (int i=d; ++i<c.height;) if (c.height%i==0) {bH = i; break;}
    rowB = c.width  / bW;
    colB = c.height / bH;
    //Instantiate the map and buckets inside
    buckets = new ArrayList [rowB * colB] ;
    clear();
  }

  /** 
    Methods
  */

  //clear all the buckets of their current information
  
  void clear() {                                   
    for ( int i=0; i<buckets.length; buckets[i++]= new ArrayList () );
  }

  //Methods to know the bucket that contains a given location
  int getCol (PVector location) { return (int)(location.x/bW); }               
  int getRow (PVector location) { return (int)(location.y/bH); }                  
  int getInd (PVector location) { return getCol(location) + getRow(location)*rowB;} 
  
  //To put a given element inside of its correspondent bucket
  void update (Locable element) {                       
     if (element!=null)  buckets [getInd (element.getLocation())].add (element);     
  }
  
  //Retrieve the nearest neighbours of a given element
  ArrayList <Locable> nearElements (Locable element) {
    
    ArrayList 
      nearest = new ArrayList ();      //the container to be returned
    PVector 
      l = element.getLocation();       //element's location   
    int                              
      t,                               //a variable to hold temporary values
      c  = getCol (l),                 
      r  = getRow (l),                           // Bucket 'b' and its neighbours 'n':
      iC = (t=c-1)>0 ? t : 0 ,                   // 
      iR = (t=r-1)>0 ? t : 0 ,                   //    n(iC,iR)    ·    n(eC,iR)
      eC = (t=c+1)<rowB ? t : rowB-1 ,           //        ·    b(c,r)     ·                
      eR = (t=r+1)<colB ? t : colB-1 ;           //    n(iC,eR)    ·    n(eC,eR)   
    
    //Retrieve nearest buckets  
    for (r=iR, t=r*rowB; r<=eR; r++, t+=rowB) for (c=iC; c<=eC; c++) nearest.addAll (buckets[t+c]);
    return nearest;
  }
 
  //Displays the grid defined by the buckets
  void displayGrid (int col) {
    stroke (col);
    for (int r=0, y=0; r<=colB; r++, y+=bH) line (0, y, width, y);
    for (int c=0, x=0; c<=rowB; c++, x+=bH) line (x, 0, x, height); 
  }
 
}

