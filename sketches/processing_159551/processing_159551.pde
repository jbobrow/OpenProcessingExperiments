


void setup (){
  size(700, 400);
  background (0);
 
}

void draw (){
   
  if (mouseX < 100) { //red
    fill (255, 0, 0);  
    rect (0, 0, 100, height);
  }
  else if (mouseX < 200) { //orange
    fill (255, 127, 0);
    rect (0, 0, 200, height);
  }
  else if (mouseX < 300) {//yellow
    fill (255, 255, 0);
    rect (0, 0, 300, height);
  }
  else if (mouseX < 400) {//green
    fill (0, 255, 0);
    rect (0, 0, 400, height);
  }
  else if (mouseX < 500) {//blue
    fill (0, 0, 255);
    rect (0, 0, 500, height);
  }
  else if (mouseX < 600) {//indigo
    fill (75, 0, 130);
    rect (0, 0, 600, height);
  }
    else if (mouseX < 700) {//violet
    fill (143, 0, 255);
    rect (0, 0, 700, height);
  }
  else {
    background (0);
  }
}


