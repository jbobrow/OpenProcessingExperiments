
PImage webImg;
float a;float b;
int x;int y;
void setup(){
  size(400,400);
  smooth();
  noStroke();
  String url = "http://www.clker.com/cliparts/s/n/2/E/H/4/pink-heart-md.png";
  webImg = loadImage(url, "png");
}
   
void draw(){
  background(255,255,240);
  if(mousePressed==true){
    background(255,125,64,15);
  }
  backGround();
    
}
  
void backGround(){
   float f=random(255);
  float g=random(255);
  float h=random(255);
    rect(200,200,300,200);
    fill(0,f,g);
    rect(200,200,260,160);
  if(mousePressed==false){
    rectMode(CENTER);
    rect(200,200,300,200);
    fill(255,193,193);
    rect(200,200,250,150);
    fill(255,g,0);
    rect(200,200,250,10);
    rect(200,200,10,150);
  }
}
         
void mouseDragged(){
  float f=random(255);
  float g=random(255);
  float h=random(255);
  a=mouseX;
  b=mouseY;
  rectMode(CENTER);
  fill(255,193,193);
  rect(a,b,250,150);
  fill(255,g,0);
  rect(a,b,250,10);
  rect(a,b,10,150);
   
  image(webImg,80,130,50,50);
  image(webImg,130,130,50,50);
  image(webImg,180,130,50,50);
  image(webImg,230,130,50,50);
  image(webImg,280,130,50,50);
  textSize(40);
  text("I Love You", 110,220);
  image(webImg,80,225,50,50);
  image(webImg,130,225,50,50);
  image(webImg,180,225,50,50);
  image(webImg,230,225,50,50);
  image(webImg,280,225,50,50);
  fill(f,g,h);
  textSize(25);
  text("Happy Valentine's Day",70,50);
}
   
void mouseMoved(){
float a=random(400);
  float b=random(400);
  float f=random(255);
  float g=random(255);
  float h=random(255);
  fill(255,g,h);
  for(int x=0;x<100;x=x+10){
    for(int y=0;y<100;y=y+10){
      ellipse(a,b,x,y);
    }
    }
}


