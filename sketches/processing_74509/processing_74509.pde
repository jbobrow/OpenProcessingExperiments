
int d = 50;

void setup () {
  size (400, 400); 
  background (133,166,191);
}

void draw () {
  smooth();
  
 //capelli
 
  fill(49,30,17);
  ellipse(200, 130, 223, 230);
  
  fill(49,30,17);
  rect(90, 110, 220, 130);
  
  
  fill(219,199,218);
  ellipse(200,150,160,200);
  
  //occhi
  
  fill(33,103,41);
  ellipse(180,110,20,20);
  
  fill(33,103,41);
  ellipse(220,110,20,20);
 
 //naso 
  
  fill(103,33,72,50);
  ellipse (200,150, 20,20);
  
   //bocca 
  
  fill(103,33,72,50);
  ellipse (200,200,20,20);
     
  //frangia
  
  fill(49,30,17);
  rect(140, 50, 120, 30);
  

  if (mousePressed) {
    d= d + 1;
    fill(214, 121, 212,95);
  }else{
 fill(214, 121, 212);
 }

  noStroke();
  ellipse (width/2, height/2, d, d);
}
