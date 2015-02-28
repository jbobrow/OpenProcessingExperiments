

/*
 * Scene controls
 */

void mouseDragged(){
  noCursor();
  rotX -= map(mouseY-pmouseY,-height,height,-TWO_PI,TWO_PI);
  rotY -= map(mouseX-pmouseX,-width,width,-TWO_PI,TWO_PI);
}

void mouseReleased(){
  cursor();
}

void keyPressed(){
  switch(keyCode){
    case UP:
      zoom *= 1.02;
      break;
    case DOWN:
      zoom /= 1.02;
      break;
    case LEFT:
      resolution++;
      if(resolution > 10){
        resolution = 10;
      }
      else{
        scan = new ScanContainer(scans[currentScan]);
        scan = scan.reduceResolution(resolution);
        backSide = scan.offsetScan(offsetDist);
      }
      break;
    case RIGHT:
      resolution--;
      if(resolution < 1){
        resolution = 1;
      }
      else{
        scan = new ScanContainer(scans[currentScan]);
        scan = scan.reduceResolution(resolution);
        backSide = scan.offsetScan(offsetDist);
      }
      break;
  }
  if(key == ' '){
    psychedelic = !psychedelic;
  }
  if(key == 'l'){
    asLines = !asLines;
    asPixels = false;
  }
  if(key == 'p'){
    asPixels = !asPixels;
    asLines = false;
  }
  if(key == '+'){
    pixelSize++;
    if(pixelSize > 3) pixelSize = 3;
  }
  if(key == '-'){
    pixelSize--;
    if(pixelSize < 1) pixelSize = 1;
  } 
}


