

// COLOR PICKER FUNCTIONS:  ---------------------------------------------------


void initColorPicker() {

    for (int i=0;i<12;i++) {
    mainColor[i]=color((int)random(255),(int)random(255),(int)random(255));
  }
  
    actualColor=mainColor[0]; 
    colorNum=0;
    colorPicking=false;
}

void drawColorPicker(int nr) {
  
    for (int i=0;i<12;i++) {
      strokeWeight(0.5);
    stroke(0); 
    fill(mainColor[i]); 
    rectMode(CENTER);
    rect(10+i*10,10,10,10);
  }
    
    strokeWeight(0.5);
    stroke(0); 
    fill(mainColor[nr]); 
    rect(140,10,10,10);
}

