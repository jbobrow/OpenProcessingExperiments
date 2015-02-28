
class Follow 
{
  // list of the keypoint, use super_class Path
  ArrayList<Path> listP ;
  // distance between the keypoint and the position of the translation shape
  float distObjectFromStartKeyPoint = 0 ;
  float distBetweenTwoKeyPoints = 0 ;
  // a & b are points to calculate the direction and position of the translation to give at the shape
  PVector a, b ;
  // calcul the gap between a & b
  PVector c = new PVector (0,0,0) ;
  // speed ratio to adjust the speed xy according to position target
  PVector r = new PVector (0,0,0) ;
  //keypoint 
  PVector pos ;
  // find a good keypoint in the ArrayList
  int n = 0 ;
  int m = 1 ;

  Follow() {
    listP = new ArrayList<Path>() ;
  }
  
  PVector follow(PVector position, float speed)
  {
    if (listP.size() > 1 ) {  
      // find a good keypoint in the list
      Path pthA = (Path) listP.get(n) ;
      Path pthB = (Path) listP.get(m) ;
      // update the position a & b from the list of keypoint  
      a = pthA.pos ;
      b = pthB.pos ;
      // give a starting position of the path, must use the same xyz than initialize PVector, here it's -1, -1
      if (position.x == -1 && position.y == -1 ) { position.x = a.x ; position.y = a.y ; }
      // distance between the keypoint a & b and the position of the translation shape
      distBetweenTwoKeyPoints = PVector.dist(a, b ) ;
      distObjectFromStartKeyPoint = PVector.dist(position, a) ;
      //update the position
      if ( distObjectFromStartKeyPoint < distBetweenTwoKeyPoints ) {
        // calcul speed ratio
        float cx = a.x -b.x ;
        float cy = a.y -b.y ;
        // final calcul ratio
        r.x = cx /cy ;
        r.y = cy /cx ;
        if(abs(r.x) > abs(r.y) ) { r.x = 1.0 ; r.y = abs(r.y) ; } else { r.x = abs(r.x) ; r.y = 1.0 ; }
        
        // Give the good direction to the translation
        if ( cx == 0 ) {
          position.x += 0 ;
          if (a.y - b.y < 0 )  position.y += speed ;  else position.y -= speed ;
        } 
        if ( cy == 0 ) {
          if (a.x - b.x < 0 )  position.x += speed ;  else position.x -= speed ;
          position.y += 0 ;
        }
        if ( cx != 0 && cy != 0  )  {
          if (a.x - b.x < 0 )  position.x += (speed *r.x) ;  else position.x -= (speed *r.x) ;
          if (a.y - b.y < 0 )  position.y += (speed *r.y) ;  else position.y -= (speed *r.y) ;
        }
      } else {
        n++ ; m++ ;
      }
      //change to the next keypoint
      if (int(position.x) == int(b.x) && int(position.y) == int(b.y)) {  m++ ; n++ ; }
      // exception, when add point when the shape is between the last point and the first point.
     // if ( m == 0 && n < listP.size() ) { m = 1 ; n = 0 ; }
      // to close the loop
      
      if ( n != listP.size() && m == 1 ) { m = 1 ; n = 0 ; }
      
      if ( m == listP.size()  )  { m = 0 ; }
      
      if ( n == listP.size()  )  { n = 0 ; }
      
      
      
    ////////////////////////////////////////  
    } else if (listP.size() == 1) {
      Path pthA = (Path) listP.get(n) ;
      a = pthA.pos ;
      position.x = a.x ; 
      position.y = a.y ;
    ///////////////////////////////////////
    } else {
      position.x = -100 ;
      position.y = -100 ;
    }
    ////////////////
    return position ;
    /////////////////
  }
  // to draw the path
  void path () 
  {
    for (int i=0 ; i < listP.size() ; i++) {
      Path pth = listP.get(i) ; // we must indicate wich one in the list or use the method above "for ( Path pth : listP )"
      fill(255,25,25) ;
       text(i, pth.pos.x -2, pth.pos.y -5) ;
       pth.keyPoint() ;
    }
  }
  
  //////THREE WAYS TO READ THE COORDINATE OF PATH////////////////////
  ///////////////////////////////////////////////////////////////////
  // add point to the path from the mousePressed
  void addPointToThePath()
  {
    pos = new PVector (mouseX, mouseY ) ;
    Path pth = new Path (pos) ;
    listP.add(pth) ;
  }
  ////////////////////////////////////////////////
  // to read the coordinates of path from file.txt
  void readFileToThePath()
  {
    //clear the list is important
    listP.clear() ;
    //read file.txt to find the list of points to add
    String[] path = loadStrings("path.txt");
    for ( int i = 0 ; i < path.length ; i++) {
      // split the file to give the X and the Y
      String[] pt = path[i].split(",");
      pos = new PVector (float(pt[0]), float(pt[1])) ;
      //call the super class Path
      Path pth = new Path (pos) ;
      //add point to the list
      listP.add(pth) ;
    }
  }
  ////////////////////////////////
  // void for the example keypoint
  void Path()
  {
    int[][] pts = {  { 175,300 }, 
                     { 185,190 },
                     { 120,120 },
                     { 98,145 } ,
                     { 10,10 }  ,
                     { 85,65 }  ,
                     { 200,350} ,
                  };
    for (int[] pair : pts)
    {
      listP.add(new Path(new PVector(pair[0], pair[1])));
    }
  }
  //////////////////////////////////////////////////////
}

