
float posX ;
float posY ;
float posX2;
float posY2;
float bcc=0.05;
float n =0;
float n2=0;
void setup(){
 size (800,600);
 smooth();
background(255); 
  
}


void draw(){
  noStroke();
fill(255,255,255,50);
rect(0, 0, width, height);
 
  bcc = bcc + 0.01;
  n = noise(bcc);
for (int i= 0; i<100; i++){

 n2 = n*i; 
}

  fill (random(255), 127,127, 250);
 rect (random(width)+n,random(height)+n,n2,n2+random(width));
//translate (40,50); 
  
}

