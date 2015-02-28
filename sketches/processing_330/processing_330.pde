
/* 
  this method is to create random points to put in
  an array that will be used as the base of a cloud
  the points are then used for the transparent redraws   
*/

void buildCloudBases () {
  for (int i = 0; i < numOfClouds; i++) {
    // north point
    cloudBase [i][0][0] = halfW;
    cloudBase [i][0][1] = (int) random((0 + cloudSharpness),(halfH));
    // northeast point
    cloudBase [i][1][0] = (int) random((halfW), (w - cloudSharpness));
    cloudBase [i][1][1] = (int) random((0 + cloudSharpness), (halfH));
    // east point
    cloudBase [i][2][0] = (int) random((halfW), (w - cloudSharpness)); 
    cloudBase [i][2][1] = halfH;
    // southeast point
    cloudBase [i][3][0] = (int) random((halfW), (w - cloudSharpness));
    cloudBase [i][3][1] = (int) random((halfH), (h - cloudSharpness));
    // south point
    cloudBase [i][4][0] = halfW;
    cloudBase [i][4][1] = (int) random((halfH), (h - cloudSharpness));
    // southwest point
    cloudBase [i][5][0] = (int) random((0 + cloudSharpness), (halfW));
    cloudBase [i][5][1] = (int) random((halfH), (h - cloudSharpness));
    // west point
    cloudBase [i][6][0] = (int) random((0 + cloudSharpness), (halfW));
    cloudBase [i][6][1] = halfH;
    // northwest point
    cloudBase [i][7][0] = (int) random((0 + cloudSharpness), (halfW));
    cloudBase [i][7][1] = (int) random((0 + cloudSharpness), (halfH));
    // close point
    cloudBase [i][8][0] = halfW;
    cloudBase [i][8][1] = (int) random((0 + cloudSharpness),(halfH));    
  }
  // now reduce by cloud size
  for (int i = 0; i < numOfClouds; i++) {
    for (int j = 0; j < numOfPts; j++) {
      cloudBase [i][j][0] = (int) (cloudBase [i][j][0] * cloudSize);
      cloudBase [i][j][1] = (int) (cloudBase [i][j][1] * cloudSize);
    }   
  }
}
 

