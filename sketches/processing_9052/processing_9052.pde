
int direction = 2; 
int x = 249;
int xb = -249; 
float spin;
float h = 130; 
float s = 60; 
float b = 210;
float hb = 100; 
float sb = 50; 
float bb = 200;


void setup(){
size(600, 600);
background(0); 
frameRate(60);
smooth();
}

void draw(){

colorMode(HSB);  
  
  noStroke();
  fill(0, 1);
  rect(0,0, width, height); 
  
  
 
  pushMatrix();
  
  translate(width/2,height/2); 
  
  rotate(radians(spin));
  spin += mouseX/2 + mouseY/2;
 
 x -= direction; 
  
  if(x >= 250 || x <= -250){
    direction *= -1;
  }
  if(x >= 250 || x <= -250){
   h = h + 17;
  }
  if(x >= 250 || x <= -250){
   s = s + 10;
  }if(x >= 250 || x <= -250){
   b = b + 14;
  }
  if (h >= 255){
   h = 50;
 }
 if (s >= 255){
   s = 50;
 }
 if (b >= 255){
   b = 50;
 }
//-----------------

 xb += direction; 
  if(xb >= 250 || xb <= -250){
    direction *= -1;
  }
  if (hb >= 255){
   hb = 50;
 }
  if(x >= 250 || x <= -250){
   hb = hb + 12;
  }
  if (sb >= 255){
   sb = 50;
 }
  if(x >= 250 || x <= -250){
   sb = sb + 8;
  }
  if (bb >= 255){
   bb = 50;
 }
  if(x >= 250 || x <= -250){
   bb = bb + 14;
  }
//-----------------
  
  ellipseMode(CENTER);
  fill(h,s,b);
  ellipse(x,22, 20, 20); 
  
//----------------  
  
  fill(hb,sb,bb);
  ellipse(xb, -22, 20, 20);
  
  popMatrix();
  
}




