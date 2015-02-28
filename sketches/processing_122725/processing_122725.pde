
int x, y;

void setup(){
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  fill(0);
}

void draw(){
}

void mouseDragged(){
  ellipse(mouseX, mouseY, 10, 10);
}


void keyPressed(){
  if(keyPressed){
    if(key == 'A'){  // akuamarin ni suru
    fill(127,255,212);
    }
    else if(key == 'B'){  // aoiro ni suru
    fill(0,0,255);
    }
    else if(key == 'C'){  // sian ni suru
    fill(0,255,255);
    }
    else if(key == 'D'){  // hukasorairo ni suru
    fill(0,191,255);
    }
    else if(key == 'E'){  // kuroiro ni suru
    fill(0);
    }
    else if(key == 'F'){  // ferudosupa- ni suru
    fill(254,208,224);
    }
    else if(key == 'G'){  // midoriiro ni suru
    fill(0,128,0);
    }
    else if(key == 'H'){  // hottopink ni suru
    fill(255,105,180);
    }
    else if(key == 'I'){  // indeligo ni suru
    fill(75,0,130);
    }
    else if(key == 'J'){  // kuroiro ni suru
    fill(0);
    }
    else if(key == 'K'){  // ka-kiiro ni suru
    fill(240,230,140);
    }
    else if(key == 'L'){  // raimuiro ni suru
    fill(0,255,0);
    }
    else if(key == 'M'){  // mazenta ni suru
    fill(255,0,255);
    }
    else if(key == 'N'){  // neibi- ni suru
    fill(0,0,128);
    }
    else if(key == 'O'){  // orenjiiro ni suru
    fill(255,165,0);
    }
    else if(key == 'P'){  // murasakiiro ni suru
    fill(128,0,128);
    }
    else if(key == 'Q'){  // kuroiro ni suru
    fill(0);
    }
    else if(key == 'R'){  // akairo ni suru
    fill(255,0,0);
    }
    else if(key == 'S'){  // ginniro ni suru
    fill(192,192,192);
    }
    else if(key == 'T'){  // tomatoiro ni suru
    fill(255,99,71);
    }
    else if(key == 'U'){  // kuroiro ni suru
    fill(0);
    }
    else if(key == 'V'){  // vaioretto ni suru
    fill(238,130,238);
    }
    else if(key == 'W'){  // siroiro ni suru
    fill(255);
    }
    else if(key == 'X'){  // kuroiro ni suru
    fill(0);
    }
    else if(key == 'Y'){  // kiiro ni suru
    fill(255,212,0);
    }
    else if(key == 'Z'){  // kuroiro ni suru
    fill(0);
    }
    if(key == CODED) {
    if(keyCode == ALT) {// haikei kuro ni suru
    background(0);
    }
    else if(keyCode == CONTROL) { //haikei siro ni suru = kuria
    background(255);
    }
  }
  }
}


