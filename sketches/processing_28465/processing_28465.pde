
float abstand = 60;
float a = 10;
float opac = 60;

void setup(){
  size(600, 600);
  smooth();
}

void draw(){
  background(255);
// for-schleife
  for(float y = 30; y <= height; y = y + abstand){
    for(float x = 30; x <= width; x = x + abstand){
      
      if (mousePressed){
        noStroke(); 
        fill(255);
        ellipse(x, y, a-200, a-200);
      }

      noStroke();
      fill(0, opac);
      ellipse(x, y, a, a);
      fill(255);
      ellipse(x, y, 10, 10);
      if (a <= 300){
        a = a+0.01;
      if (a >= 300){
        //LOOP:
        if (mousePressed){
            a = a/10;
            }  
        //a = a-0.01;
        //opac = opac-0.01;
        }
      }
    }
  } 
 
}

