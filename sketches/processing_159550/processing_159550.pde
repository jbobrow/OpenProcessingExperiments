


void setup (){
  size(700, 400);
  background (0);
 
}

void draw (){
   background (0);
   
  if (mouseX < 100) { //red
    noStroke();
    fill (255, 0, 0);  
    rect (0, 0, 100, height);
  }
  else if (mouseX < 200 ) { //orange
    noStroke();
    fill (255, 127, 0);
    rect (100, 0, 100, height);
  }
  else if (mouseX < 300) {//yellow
    noStroke();
    fill (255, 255, 0);
    rect (200, 0, 100, height);
  }
  else if (mouseX < 400) {//green
    noStroke();
    fill (0, 255, 0);
    rect (300, 0, 100, height);
  }
  else if (mouseX < 500) {//blue
    noStroke();
    fill (0, 0, 255);
    rect (400, 0, 100, height);
  }
  else if (mouseX < 600) {//indigo
    noStroke();
    fill (75, 0, 130);
    rect (500, 0, 100, height);
  }
    else if (mouseX < 700) {//violet
    noStroke();
    fill (143, 0, 255);
    rect (600, 0, 100, height);
  }
  else {
    background (0);
  }
}


