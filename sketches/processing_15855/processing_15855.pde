
PImage img1,img2;
PFont f,f2;

int wCen, yCen, cloCir, halfCir1,halfCir2,halfCir3;
void setup(){
  size(360,600); 
  stroke(255);
  smooth();
  img1= loadImage("no.png");
  img2= loadImage("back.png");
  f2=loadFont("Debussy-40.vlw");
  f=loadFont("Debussy-18.vlw");
}



void draw(){
  image(img2,0,0,360,600,600,600,0,600);
  background(img2);
  
  wCen = width/2; 
  cloCir = 250;
  yCen = height/2-100; 
  halfCir1=cloCir/2-2;
  halfCir2=cloCir/2-10;
  halfCir3=cloCir/2-15;
 
  fill(80);
  noStroke();
  ellipse(wCen,yCen,10,10);
  float s = map(second(),0,60,0,TWO_PI) - HALF_PI;
  float m = map(minute(),0,60,0,TWO_PI) - HALF_PI;
  float h = map(hour()%12,0,12,0,TWO_PI) - HALF_PI;
  stroke(255,0,0); strokeWeight(1);
  line(wCen,yCen,cos(s)*halfCir1+wCen, sin(s)*halfCir1+yCen);
  imageMode(CENTER);
  image(img1,cos(s)*halfCir1+wCen, sin(s)*halfCir1+yCen);
  strokeWeight(3); line(wCen,yCen,cos(m)*halfCir2+wCen, sin(m)*halfCir2+yCen);
  strokeWeight(7); line(wCen,yCen,cos(h)*halfCir3+wCen, sin(h)*halfCir3+yCen);
  
  
  int D = day();
  int M = month();
  int Y = year();
   
  int mi =minute();
  int H =hour(); 
  
 String time = nf(H,2)+  " : " + nf (mi,2);
  textAlign(CENTER);
  textSize(40);
  text(time, width/2, 450);
  textFont(f);
  
   
 String time2  = nf(Y, 2)+ " / " + nf(M, 2) +" / " + nf(D, 2);
  textAlign(CENTER);
  textSize(18);
  text(time2, width/2, 400); 
  textFont(f2);

}
  

