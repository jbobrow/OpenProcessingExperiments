
float posX;
float posY;
float posX1;
float posY1;
float s;
float z;
float bcc;
float n;
float n2;
float opp;
float a;
float inc;
float si;
float si2;
float si3;


void setup(){
 size(1024,768);
 background(0);
smooth(); 
frameRate(5);
  
  
  
}

void draw(){
  
  posX = random(width);
  posY = random(height);
  posX1 = random(width);
  posY1 = random(height);
  s = random (50);
  z = random (50);
 
  
 fill(random(127),random(127), random(127));
  ellipse (posX, posY, s,s);
 
  strokeWeight(random(10));
  stroke(random(127),random(127),random(127));
  line (posX, posY, posX1, posY1);
  
  fill(random(127),random(127), random(127));
  ellipse (posX1, posY1, z,z);
  
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

fill(255,255,255,50);
rect(0, 0, width, height);
    for (int k =0; k<5; k++){
 stroke(255,0,0);
 strokeWeight(random(20));
 line(0+k+k, 0+k, 800+k, 600+k);
    }
    
      
   noStroke();
fill(0,0,0,0.03);
rect(0, 0, width, height);
 
 translate(0, -height/2);
  
  
  opp = opp + .01;
  float n = noise(opp) * width;
  float m = noise(opp) * height;
   
 for (int i=0; i<3000; i++){
   
   stroke (random(255),random(255),0, random(255));
  fill (0,0,0, random(127));
  posX = n;
  posY = m;
 ellipse (posX+i, posY+i, 20, 20);
  translate(opp, opp*i);
  rotate (180);
  }

noFill();
   
  stroke(random(255), random(255), random(255), 10);
   
  if (keyPressed == true){
   fill(255,255,0,2);
  }
 
  beginShape();
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  endShape();

     noStroke();
    fill(0, 25, 127);
    rect(0, 0, width, height);
    
 
  translate (width/2, height/2);
   
  fill(127, 0, 127, 20);
  for (int i=0; i<600; i=i+2) {
    ellipse(i*sin(a), 50, i, 50+tan(a)*2.0);
    a = a + inc;
    rotate (90);
  }
  
    noStroke();
  fill(255, 255, 255, 20);
  rect(0, 0, width, height);
   
 
  stroke(0);
  si = random(200);
  strokeWeight(10);
  fill(255);
  ellipse (200,200, si,si);
  si2 = random(200);
  strokeWeight(10);
  fill(255);
  ellipse (600,200, si2,si2);
   si3 = random(200);
  rect(width/2-100, height/2, si3,si3);


  
  
}

