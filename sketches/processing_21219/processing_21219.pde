
void setup(){
  size(600, 600);
  background(0);
  smooth();
  
  
  noStroke();
  
  for(int i = 0; i < 9; i++){
   colorArr[i] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
   //println("c " + colorArr[i]);
   
   divisionArr[i] = int(random(1, 20));
  // println(hex(colorArr[i]));
   
   strokeArr[i] = boolean(int(random(0, 2)));
   println(boolean(int(random(0, 2))));
  }
  
}

color[] colorArr = new color[9];
int[] divisionArr = new int[9];
boolean[] strokeArr = new boolean[9];

void draw(){
  fill(0, 0, 0, 100);
  rect(0, 0, width, height);  
  
  for(int i=0; i<9; i++){
      drawRectPattern(colorArr[i], (i%3)*200, int(i/3)*200, divisionArr[i], strokeArr[i]);
  }
}


void drawRectPattern(color _baseColor, int _xpos, int _ypos, int _division, boolean _stroke){
  
  pushMatrix();
  translate(_xpos, _ypos);
  
  if(_stroke){
   stroke(255); 
  }else{
    noStroke();
  }
  
  for(int x = 0; x < _division; x++){
    for(int y = 0; y < _division; y++){
      fill(_baseColor, random(0, 255));
      
      ellipse(x * (200/_division) + 200/_division/2, y * (200 / _division) + 200/_division/2, 200 / _division, 200 / _division);
    }
  }
  
  popMatrix();
}

