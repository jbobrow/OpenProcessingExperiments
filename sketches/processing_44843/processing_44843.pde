
//source code:  http://openprocessing.org/visuals/?visualID=31949  
  
  int click = 1;
  float paddle2 = 1;
  int cir;
  
  PImage img;
    
void setup() {
  smooth();
  size(500,450);
  img=loadImage("kale.jpg");
}


void draw(){
  image(img, 0,0);
  translate(width/2.5, height/2);
   for(cir=0; cir<=800; cir =cir+click){
    rotate(paddle2);
    noStroke();
  fill(0,cir,cir, 30); 
  ellipse(cir,cir,cir,cir);
  
   }
  }
   
void mouseReleased() {
  if(click == 1) {
     
    click = 2;
    background(150);
     
  }
  else {
    click = 1;
     
     
  }
 
}

