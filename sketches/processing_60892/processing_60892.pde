
///controller related codes.
//=============================================================/unused codes

//peasycam (3d camera) initialization
void initCam(){
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(1500);
}

//key pressed actions
void keyPressed() {
  if (key=='r') {
    //reset the sketch
    setup();
  }
  if (key == 'a'){
    //increase the minimum distance to make network connection
    distTxt++;
  }
}


