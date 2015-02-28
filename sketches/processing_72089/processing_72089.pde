
void setup (){
  
  
  size(600,600);
  background(0);
  smooth();
  colorMode(RGB);
  noLoop();
}
 
  
void draw(){
  
 circlebackground();
 diamondforeground();
 
 
}


void diamondforeground(){
  
  int c = color (random(255),random(255), random(255), random(255));
 
 for (int x=0; x<width; x=x+20){
   for(int y=0; y<height; y=y+40){
     fill (c);
     noStroke();
     quad(x,y, x+10,y-20, x+20,y, x+10,y+20); 
     
     }
     
 }
  
}

void circlebackground() {

  for (int i=1; i<600; i+=20) {
    ellipse(width/2, height/2, i, i);

    fill(random(225), random(245), random(235), random(255));



  }


  
}






