
int levels = 4;

FlexCompRowMatrix[] interp = new FlexCompRowMatrix[levels-1];
FlexCompRowMatrix[] restrict = new FlexCompRowMatrix[levels-1];

//matrix stuff
void computeLaplacian() {
  LA.zero();
  LB.zero();
  int index = 0;
  int iX1,iX0,iY1,iY0,iZ1,iZ0;
  float dTdX = deltaT/delxSq;
  for(int x=0;  x<w;  ++x) {
    for(int y=0;  y<h;  ++y) {
      
       index = x*h+y;
       iX1 = xyToIndex(iNext[x],y); iX0 = xyToIndex(iPrev[x],y);
       iY1 = xyToIndex(x,jNext[y]); iY0 = xyToIndex(x,jPrev[y]);

       LA.add(index, iX1,dTdX*aRateX);
       LA.add(index, iX0,dTdX*aRateX);
       LA.add(index, iY1,dTdX*aRateY);
       LA.add(index, iY0,dTdX*aRateY);
       LA.add(index, index,-2*dTdX*(aRateX+aRateY));

       LB.add(index,iX1,dTdX*bRate);
       LB.add(index,iX0,dTdX*bRate);
       LB.add(index,iY1,dTdX*bRate);
       LB.add(index,iY0,dTdX*bRate);
       LB.add(index,index,-4*dTdX*bRate);         
      
    }
  }
  
  ((FlexCompRowMatrix)LA).compact();
  ((FlexCompRowMatrix)LB).compact();

}

int xyToIndex(int x, int y) {
  return y+x*h;
}

int xyToIndex(int x, int y, int cw, int ch) {
  return y+x*ch;
}

void gaussSeidel(FlexCompRowMatrix M, DenseVector v, DenseVector b) {
  int numRows = M.numRows();
  SparseVector curr;
  double diag;
  for(int i=0;  i<numRows;  ++i) {
    curr = M.getRow(i);
    diag = curr.get(i);
    v.add(i,(b.get(i)-curr.dot(v))/diag);
  } 
}


