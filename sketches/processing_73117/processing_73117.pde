
//Keith Maverick Yeung
//Introduction to Digital Media Fall 2012
//Section A
//September 11th, 2012

int randomdiameter = 0; //Global Celebrity
float strokevalue = 0;
PImage img1;
PImage img2;
int ray;
int ray2;


void setup() {
  size(1200,600);
//  background(0,0,0);
  img1 = loadImage("pm1.png");
  img2 = loadImage("pm2.png");
  ray = 0;
  ray2 = 0;
  
}
   

void draw() {
  background(0,0,0);
//  stroke(0,100,255);

  if (mouseX < 600) {
    mouseX = 600;
  }

//  for (int i = 0;i<1000;i++) {
//    int p = 0+ i;
//    int z = 500 - i;
//    
//    if (i%10 == 0) {
//      stroke(0);
//      strokeWeight(0);
//      line(0,0,0,0);
//
//    }
//    
//    else{
//    
//    stroke(255);
//    strokeWeight(1);
//   line(p,z,p-200,z-200);
//    }
//    
    
//    
//  }

  float u = random(50);
  if(u<30) {
    image(img1,450,225);
  }
  else {
    image(img2,450,225);
  }
  
for (int i= 0; i<1200; i++){
  
  if(ray2 == 0) {
       stroke(0);
       strokeWeight(0);
       ellipse(i, i,10,10);
       fill(255);
  }
  if(ray2 == 1) {
       stroke(0);
       strokeWeight(0);
       ellipse(i, i,50,10);
       fill(255);
  }
  
  
   }


for (int i= 0; i<1200; i++){
       stroke(0);
       strokeWeight(0);
       ellipse(random(1200), i,2,2);
       fill(255);

  
   }


  stroke(strokevalue);
  strokeWeight(strokevalue);
  float randomdiameter = random(50);
  smooth();
  fill(0,78,100);
  //image(img, mouseX+3,mouseY+3);
  ellipse(mouseX,mouseY,randomdiameter,75);
  
  stroke(0,100,255);
  strokeWeight(20);
  line(mouseX,mouseY,random(300),random(400));
  
    
//  if(randomdiameter < 100){
//    randomdiameter = randomdiameter+2;
//  }
//  else {
//    randomdiameter = 50;
//  }
//  for(int i =0; i<10000;i++) {
//    ellipse(random(1200),random(600),i,i);
//  }


// float r1,r2;
// float v = random(1);
// if(v<1) {
//   r1 = random(100,220);
//   r2 = random(100,200);
// }
// else {
//   r1 = random(270,400);
//   r2 = random(270,400);
// }

 
 if( ray == 1) {
   stroke(255,random(200),0);
  strokeWeight(100);
  line(mouseX-50,mouseY,random(300),random(400));
 }
 
  for (int i=0; i<100;i++) {
      
     
    
    
      stroke(0,50,75);
      strokeWeight(random(50));
      ellipse(random(100,400),random(100,400),60,60);
      fill(0,100,255);
  }
  
   
//   for(int u = 0; u<100;u++) {
//     ellipse(random(100,500), random(50, 500), random(10), random(10));
//     fill(255);
//   }
   
   
 
}

void mouseClicked() {
  if(strokevalue == 0) {
    strokevalue = 255;
  }
  else {
    strokevalue = 0;
  }
  if (ray == 0) {
    ray = 1;}
   else {
   ray = 0;
   }
  if (ray2 == 1) {
    ray2 = 0;}
    else {
      ray2++;}


}

void keyPressed() {
  if(key == 's') {
    save("keithMaverickYeung.png");
  }
}


