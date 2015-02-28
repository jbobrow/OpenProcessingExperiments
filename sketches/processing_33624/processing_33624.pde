
int circ_x = 100;
int circ_y = 231;


void setup () {
  size(400, 400);
  background (124, 252, 0);
}

void draw () {
  fill(24, 79, 30);
}

void mouseDragged() {
  if (keyCode == UP) {
    line(mouseX, mouseY, mouseX, mouseY);
    line(mouseX-6, mouseY+12, mouseX+2, mouseY-3);
    ellipse(mouseX, mouseY, mouseX*4, mouseY*4);
  } 
  else  if (keyCode == DOWN) {
   ellipse(mouseX, mouseY, mouseX*2, mouseY*2);
  }
 else if (keyCode == RIGHT) {
    point(50, 50);
  }
}


void keyPressed () {
  if (key == 'z')
  {
    stroke(random(256), random(256), random(256));    
    //for random colors click Z
  }

    if (key== 'o') 
    {                
      //for orange click o
      stroke(255, 165, 0);
    }
    if (key=='b')
    { 
      //for blue click b
      stroke(0, 0, 255);
    }

    if (key == 'e') 
    {
      background(124, 252, 0);                   
      //to erase the window click e
    }
}


