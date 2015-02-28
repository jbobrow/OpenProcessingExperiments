
PVector vec, vec1, vec2, vec3; //going to be random drops of ellipse from X and Y

int x = 0;
int y = 0;
int t = 2;
int p = 2;
int dr = 1;
int f = 1;

int cSize;
int br = 255;
int cScheme = 0;


void setup(){
  size(600,600);
  textSize(30);
  background(0, 0, 0, 230);
  colorMode(RGB);
  smooth();
  noStroke();

//  for (float i = 1; i < width; i = i+0.5) {
//    for (float j = 1; j < height; j = j+0.5) {
//      
//      cScheme++;
//      fill(cScheme, cScheme, cScheme);
//      ellipse(i, j, 1, 1);
//    }
//  }
}

void draw(){
  
  if(f == 0){
   
    background(0);
    
  }
  
  if(cSize > 400){
    cSize = 400;
    dr = 0; 
   }
   
  t--;
  if (t>0) { x=x+dr*t/2/(cSize/70+1); }else t=0;
  p--;
  if (p>0) { y=y+dr*p/2/(cSize/70+1); }else p=0;
   ellipse(x + 300,y + 300, 10+(t/2)+cSize, 10+(p/2)+cSize);
   
//   if(keyPressed == true){
//    
//     fill(random(255), random(255), random(255));
//     ellipse(x, y, 5, 5);
//     
//   }
   
   if(x < -300) x = -300;
   if(y < -300) y = -300;
   if(x > 300) x = 300;
   if(y > 300) y = 300;
   
   if(key == 'b'){
    
    for (float i = 1; i < width + 10; i = i+8) {
    for (float j = 1; j < height + 10; j = j+8) {
      for(float k = 1; k < 255; k+=10){
     
     
      fill(i, j, k);
      ellipse(i, j, 10, 10);
      
      }
    }
  }
  
     
   }
   
}

void keyPressed(){
  
  fill(random(255), random(255), random(255));
  
  if(keyCode == RIGHT){
  t=20;
  dr=1;
  cSize+=5;
  }
  
  if(key == 'd'){
  x+=10;
  }
  
  if(keyCode == LEFT){
    t=20;
    dr=-1;
    cSize+=5;
  }
  
  if(key == 'a'){
  x-=10;
  }
  
  if(keyCode == UP){
    p=20;
    dr=-1;
    cSize+=5;
  }
  
  if(key == 'w'){
  y-=10;
  }
  
  if(keyCode == DOWN){
    p=20;
    dr=1;
    cSize+=5;
  }
  
  if(key == 'x'){
  y+=10;
  }
  
  if(key == 'e'){
  y-=10;
  x+=10;
  }
  
  if(key == 'q'){
  y-=10;
  x-=10;
  }
  
  if(key == 'c'){
  y+=10;
  x+=10;
  }
  
  if(key == 'z'){
  y+=10;
  x-=10;
  }
  
  if(key == 'f'){
   
    f = 0;
    
  }
  
  if(key == 'g'){
   
    f = 1;
    
  }
//reset function

  if(key == 'r'){
   
   // x = 0;
  //  y = 0;
    t = 0;
    p = 0;
    cSize = 0;
//    background(random(255));
    
  }
  
 //total reset function
 
 if(key == 'v'){
   
    x = 0;
    y = 0;
    t = 0;
    p = 0;
    cSize = 0;
    background(random(-255,255), random(-255,255), random(-255,255));
   
 }
}
/*

//void init(){
// 
//  
//  
//}

*/

