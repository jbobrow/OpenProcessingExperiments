
// mouse drawing
// background is on the back not being render while mouse move
//void setup (){
//  size(500,500);
//  background(255,217,0);
//  noStroke();
//
//}
//void draw(){
//  rect(mouseX,mouseY,10,10);
//}

float circlex=0;
float circley=0;
float vely = 20;
float velx = 10;
float circlex2=800;
float circley2=0;
float vely2 = 20;
float velx2 = 10;

//mouse interaction
//background are being drawn as the rect move
void setup (){
  background(0);
  size(800,600);
  frameRate(60);
  smooth();
  //noStroke();

}
void draw(){
  stroke(random(0,50));
  strokeWeight(1);
  fill(random(150,255),random(30,100),30,random(0,200));
  triangle(mouseX-random(5,50),mouseY-random(5,50),mouseX-random(5,50),mouseY+random(5,50),mouseX+random(5,50),mouseY+random(5,50));

  
  //noStroke();
  
  stroke(255);
  fill(random(150,255),random(150,255),50,random(50,140));
  strokeWeight(1);
  circlex+=velx;
  circley+=vely; // the same as circley=circley+vel
  ellipse(circlex,circley,random(20,80),random(20,80));
  if((circlex<0)||(circlex>width)){
    velx=velx*-1;
  }
  if((circley<0)||(circley>height)){
    vely=vely*-1;
  }
  
    fill(50,random(150,255),random(150,255),random(50,140));

  circlex2+=velx2;
  circley2+=vely2; // the same as circley=circley+vel
  rect(circlex2,circley2,random(20,80),random(20,80));
  if((circlex2<0)||(circlex2>width)){
    velx2=velx2*-1;
  }
  if((circley2<0)||(circley2>height)){
    vely2=vely2*-1;
  }
  
  
  
 
}

