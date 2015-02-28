
void mouseClicked(){
  setup();
  drawImage = false;
  drawLines = true;
}

void keyTyped(){
  if(key=='1')
    useHLines = !useHLines;
  if(key=='2')
    useVLines = !useVLines;
  
  if(key== 'q')
    overallScaling = overallScaling*1.2;
  if(key== 'a')
    overallScaling = overallScaling/1.2;
  if(key== 'w')
    kVert = kVert/1.2;
  if(key== 's')
    kVert = kVert*1.2;
  if(key== 'e')
    kOut = kOut/1.2;
  if(key== 'd')
    kOut = kOut*1.2;
  
  if(key=='z')
    updateLines();
  if(key=='x')
    liveUpdate = !liveUpdate;
  
  if(key== 'b')
    drawBarriers = !drawBarriers;
  if(key== 'p')
    drawPoints = !drawPoints;
  if(key== 'l')
    drawLines = !drawLines;
  if(key== 'f'){
    smoothing = !smoothing;
    if(smoothing)
      smooth();
    else
      noSmooth();
  }
  
   
  if(key== '-'){
    nLines = constrain(nLines-1, 3,2000);
    makeLines();
    updateLines();
  }
  if(key== '='){
    nLines++;
    makeLines();
    updateLines();
  }
  
  if(key== '['){
    nPointsOnLine = constrain(nPointsOnLine-1, 3,2000);
    makeLines();
    updateLines();
  }
  if(key== ']'){
    nPointsOnLine++;
    makeLines();
    updateLines();
  }
  
  if(key== ';'){
    nBarriers = constrain(nBarriers-1, 0,2000);
    makeBarriers();
    makeLines();
    updateLines();
  }
  if(key== '\''){
    nBarriers++;
    makeBarriers();
    makeLines();
    updateLines();
  }

  
  if(key=='i'){
    imageStretch();
    if(drawImage){
      drawLines = true;
      drawPoints = false;
      liveUpdate = true;
    }
    else{
      drawLines = false;
      drawPoints = false;
      liveUpdate = false;
    }
    drawImage = !drawImage;
  }
}

