
int x=0;


void setup(){
  size(500,500);
  background(0);
   smooth();
  noStroke();
   fill(0);
   textSize(70);
}

void draw(){
  
  //background(255);
  
}
//////oekaki///////
void mouseDragged(){
  //fill(255,200,255);
  text(key,mouseX,mouseY);
}


//////////color////////////


void keyPressed(){
  if(keyPressed){
    if(key == '1'){  // red
    fill(255,0,0,50);
    }
    else if(key == '2'){  // pink
    fill(255,149,216,50);
    }
    else if(key == '3'){  // violet
    fill(172,27,255,50);
    }
    else if(key == '4'){  // blue
    fill(59,55,228,50);
    }
    else if(key == '5'){  // skyblue
    fill(55,226,228,50);
    }
    else if(key == '6'){  // limegreen
    fill(55,228,55,50);
    }
    else if(key == '7'){  // green
    fill(0,152,14,50);
    }
    else if(key == '8'){  // yerrow
    fill(136,152,0,50);
    }
    else if(key == '9'){  // orange
    fill(255,150,0,50);
    }
    else if(key == '0'){  // zenkeshi
    background(0);
    }
  }}


