
PImage bild;


void setup(){
size (800,600);
smooth();
tint(255, 0, 0);
bild = loadImage("Merkel.jpg");
image(bild,0,0,800,600);

frameRate(999);
}

void draw(){
  
 // background(0);
    
  float cs = 35;
  
  
  
  noStroke();
  int x = int(random(width));
  int y = int(random (height));
  fill(bild.get (x,y));
  
  rect(x, y,random(2,3),random(20,45));
   float css = 10;
   if(mousePressed){
     rect(x+1, y+1,random(2,3),random(20,45));
     rect(x+2, y+3,random(2,3),random(20,45));
     rect(x+3, y+2,random(2,3),random(20,45));
     rect(x+1, y+4,random(2,3),random(20,45));
     rect(x+4, y+1,random(2,3),random(20,45));
   
   }
   
int d = mouseX;

fill(random(180,120),25,25);
if(d > 400){
  for (int j = 0; j<height/css+1;j++) { 
    for (int i = 0; i<width/css+1 ; i++) {
      ellipse(i*x*3, j*y*2, css, css);
    }
  }
if(d > 600){
  for (int j = 0; j<height/css+1;j++) { 
    for (int i = 0; i<width/css+1 ; i++) {
      rect(i*x, j*y, css/2, css+random(50,100));
    }
  }}}
  
  

// 
//  for(int j = 0 ; j < height/cs+1;j++){
//  
//  for(int i =0 ; i <width/cs+1; i = i+1){
//    noStroke();
//    
//    fill(i*5,j*5,255);
//   ellipse(i*cs, j*cs , cs-5 , cs-5);
//   
//   
//   
//   textAlign(CENTER,CENTER);
//    fill(255);
//   
//   text(i,i*cs, j*cs );
   
  
   
 // }
 // }
}


