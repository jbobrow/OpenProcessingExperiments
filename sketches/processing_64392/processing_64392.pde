
void setup (){
  size(800, 800);
  background(255);
  smooth();
  //noStroke(); 
  //noLoop();
  //noFill();
  
  for (int a=50; a<width; a+=50){
  stroke(230);
  line(a, 0, a, width-1);
  line(0, a, width-1, a);
  }
  
}

int num = 40;

void draw (){
  
   float X = 50*int(random(1, 16));
   float Y = 50*int(random(1, 16));
   float cb = int(random(10,230));
   float cr = 255-cb;
   float ca = cr*2;
   float r = 150/(sqrt(cb));
   
  
  if(num > 1){
    num--;
    attractor(X, Y, cr, cb, ca, r);
  }
  
  
  //if ((num <= 1) && (num >0)){
  //  num--;
   //save("citygrid_colors10.tif");
  //}
  
  
}


void attractor(float X, float Y, float cr, float cb, float ca, float r){
  noStroke();
  fill(cr, 0, cb, ca);
  ellipse(X, Y, r, r);
  
}

void mousePressed() {
  
 num = 40;
 
 fill(255);
 noStroke() ;
 rect(0,0,800,800);
  
 for (int a=50; a<width; a+=50){
   stroke(230);
   line(a, 0, a, width-1);
   line(0, a, width-1, a);
  }
  
   float X = 50*int(random(1, 16));
   float Y = 50*int(random(1, 16));
   float cb = int(random(10,230));
   float cr = 255-cb;
   float ca = cr*2;
   float r = 150/(sqrt(cb));
   
  
  if(num > 1){
    num--;
    attractor(X, Y, cr, cb, ca, r);
  }
}

