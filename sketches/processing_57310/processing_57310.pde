
/*Rain code by Sarah Tse
 York Sheridan Joint Program of Design
 
 Original lightning code by Nicholas Peter Bridle 
 at http://www.openprocessing.org/sketch/41533.
 
 I used the lightning code as a base to change into my own interpretation*/

int amount = 80;
Pour[] drops = new Pour[amount]; // Create the array

int o = 300;    //opacity of raindrops

void setup() {
  size(438,390);
  background(0);
  ellipseMode(RADIUS);
  smooth();
  noStroke();
  //Loop through array to create new raindrops
  for (int r = 0; r < drops.length; r++) {

    drops[r] = new Pour(); // creating new raindrops
  }
}

void draw(){
  fill(0,25);
  rect(0,0,600,600);
  //Loop through array to allow raindrops
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }

}

class Pour {
  float x = random(438);
  float y = random(-height);

  void fall() {
    fill(185, 218, 245,o);
    ellipse(x, y, 1, 1);

    if(y>height){

      x = random(438);
      y = random(-100);
    }
    if(mouseX < 50){
      o = 100;
      y = y + 3;
    }
    else if(mouseX >50 && mouseX < 100){
      o = 150;
      y = y + 4;
    }
    else if(mouseX > 100 && mouseX < 150){
      o = 200;
      y = y + 5;
    }
    else if(mouseX > 150 && mouseX < 200){
      o = 225;
      y = y + 6;
    }
    else if(mouseX > 200 && mouseX < 300){
      o = 250;
      y = y + 7;
    }
    else if(mouseX > 300 && mouseX < 438){
      o = 300;
      y = y + 8;
    }
  }
}

void lightning(){  
  int a = round(random(438));    //x-co for starting point
  int b = 50;    //x-co for ending point
  int c = 0;    //y-co for starting point
  int d = 0;    //y-co for ending point

  //max length of bolt 
  while (d < 200){

    b = (a-50) + round(random(80));    //direction of lines
    stroke (255);
    line (a, c, b, d);
    c = d;    
    d += round(random(50));    
    a = b;    
  }
}

void mousePressed() {
  lightning();
  lightning();
  lightning(); 
  loop();
}

void mouseReleased(){
  noStroke();
  rect(0,0,438,390);
  fill(0);
}


