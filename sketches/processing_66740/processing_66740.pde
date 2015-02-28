
float weirdShit;
float n;



void setup (){
  size (500, 500);
  background (255);
  smooth ();
  noStroke ();
}

void draw (){
  background (255);
  pulse (1);  
  
  for (int i=0; i < mouseX; i++){
    fill (0, 255, 249);
    rect (mouseY-i, 50, 50, 50); 
  }

 
  }

void pulse (int speed){
  if (mouseX <=width){
    weirdShit = dist (mouseX, mouseY, pmouseX, pmouseY);
    n = weirdShit*5.0;
    fill (255, 0, 153);
    ellipse (pmouseX, pmouseY, n, n);
  }    
}




/*void wave (int speed){
 if (mouseX <=width){
   biggerWave = di
  
}*/




