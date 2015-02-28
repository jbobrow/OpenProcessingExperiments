
/*
   Generic CSR Matrix 
   Ale González :: a(en)60rpm.tv
   Public Domain
   11/09/2012
*/

/*
  This code is an implementation of a sparse matrix using a compressed sparse row format (CSR)
  This kind of matrices are populated primarily by zeros and they allow saving memory allocation when used
  instead of its dense representations. Wikipedia explains it much better than me:
    http://en.wikipedia.org/wiki/Sparse_matrix
    
  The example creates a grid of elements: an abstraction of a grid of objects wherein instantiated objects
  would be black rectangles. In the dense representation all rectangles would be stored. In a sparse matrix
  we only store the values different from 0/null and a couple of arrays storing int indices: the number of
  column of each element in the matrix, and the number of elements per row + 1.
*/


final int W=600, H=600, BG=#555555;
boolean dragged = false;
CSR_Matrix <Float> sparse;
Float[][] dense;
PFont theFont;   

void setup () {
  size (W,H);
  background (BG);
  smooth ();
  theFont= loadFont ("Monospaced.plain-16.vlw");
  textFont (theFont,12);
}

void draw () { 
  if (dragged) { 
    int 
      mx=(mx=mouseX>>2)>2?mx:2,   
      my=(my=mouseY>>2)>2?my:2,  
      x, y, xx, yy;
    dense = new Float [int(W/mx)+1][int(H/my)+1];
    for (y=0,yy=0;y<=H;y+=my,yy++) for (x=0,xx=0;x<=W;x+=mx,xx++) {
      float tmp = random(1);
      dense[xx][yy]= (tmp<=.1)? tmp : null;
      fill (tmp<=.1? 0xffff0000:BG);
      rect (x,y,mx,my);
    }
  }
}

void mouseDragged (){
  dragged=true; 
}

void mouseReleased(){
  dragged= false;
  sparse = new CSR_Matrix <Float> (dense);
  giveMeSomeData();
}

void giveMeSomeData () {
  fill (0x50ff0000);
  rect (0,H-75,W,H);
  fill (-1);
  if (dense !=null) text ("Dense matrix allocation cost  :: " + dense.length*dense[0].length + " Float objects", 25, H-50);
  if (sparse!=null) text ("CSR matrix allocation cost    :: " + sparse.elements.length + " Float objects + " + (sparse.e_cols.length + sparse.e_in_row.length)+ " int primitives", 25, H-25);
}

