
/*
* --=[Cubemap to fisheye]=--
* by Jonsku, March 2011
* --
* Some code to generate, load from files and display cube maps.
*/

/*
* Creates a XOR checker pattern for testing
*/
PImage createFace(color c1, color c2, int freq, int w) {
  if(freq<=0)
    freq = 1;
  freq = boxSize/freq;
  if(freq<1)
    freq = 1;
  PImage f = createImage(w,w,RGB);
  f.loadPixels();
  for(int i=0;i<w;i++) {
    for(int j=0;j<w;j++) {
      f.pixels[i+j*w] = (i%freq*2<=freq ^ j%freq*2<=freq)?c1:c2;
    }
  }
  return f;
}

void generateCubemap(){
  cubeMap[BOX_FRONT] = createFace(color(100), color(200), patternFrequency, boxSize);
  debug = cubeMap[BOX_FRONT].get();
  cubeMap[BOX_BEHIND] = createFace(color(200,0,0), color(100,0,0), patternFrequency, boxSize);
  cubeMap[BOX_LEFT] = createFace(color(0,200,0), color(0,100,0), patternFrequency, boxSize);
  cubeMap[BOX_RIGHT] = createFace(color(0,0,200), color(0,0,100), patternFrequency, boxSize);
  cubeMap[BOX_BOTTOM] = createFace(color(200,200,0), color(100,100,0), patternFrequency, boxSize);
  cubeMap[BOX_TOP] = createFace(color(0,200,200), color(0,100,100), patternFrequency, boxSize);
}

/*
Load 6 files named:
"front_"+setName
"behind_"+setName
"left_"+setName
"right_"+setName
"top_"+setName
"bottom_"+setName
*/
void loadCubemap(String setName){
  String fileName ="";
 for(int i=0;i<6;i++){
   switch(i){
     case BOX_FRONT:
     fileName = "front_"+setName;
     break;
          case BOX_BEHIND:
     fileName = "behind_"+setName;
     break;
          case BOX_RIGHT:
     fileName = "right_"+setName;
     break;
          case BOX_LEFT:
     fileName = "left_"+setName;
     break;
          case BOX_TOP:
     fileName = "top_"+setName;
     break;
          case BOX_BOTTOM:
     fileName = "bottom_"+setName;
     break;     
   }
   cubeMap[i] = loadImage(fileName);
 }
 boxSize = cubeMap[BOX_TOP].width;
}

void drawCubemap() {
  pushMatrix();
  //scale so that the entire cube map fits in the screen
  scale(float(width)/(4*boxSize));
  //top
  image(cubeMap[BOX_BOTTOM],boxSize,0);
  //left
  image(cubeMap[BOX_LEFT],0,boxSize);
  //front
  image(cubeMap[BOX_FRONT],boxSize,boxSize);
  //right
  image(cubeMap[BOX_RIGHT],2*boxSize,boxSize);
  //behind
  image(cubeMap[BOX_BEHIND],3*boxSize,boxSize);  
  //bottom
  image(cubeMap[BOX_TOP],boxSize,2*boxSize);
  popMatrix();
}


