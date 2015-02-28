
PImage[] img = new PImage[13];
int copy = 50;
float a=0;

void setup(){
  size(600,600);
  background(#F7B4B4);
  
  for(int i =0; i<13; i++){
    img[i]=loadImage(i+".png");
  }
  
}

void draw(){
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(a);
  image(img[12],0,0,150,150);
  popMatrix();
  
  image(img[1],random(0,100),random(0,100),50,50);
  image(img[2],random(0,200),random(0,200),30,30);
  image(img[3],random(0,300),random(0,300),50,50);
  image(img[4],random(0,400),random(0,400),50,50);
  image(img[5],random(0,500),random(0,500),40,40);
  image(img[6],random(0,600),random(0,600),50,50);
  image(img[7],random(0,600),random(0,600),50,50);
  image(img[8],random(0,600),random(0,600),30,30);
  image(img[9],random(0,600),random(0,600),40,40);
  image(img[10],random(0,600),random(0,600),50,50);
  image(img[11],random(0,600),random(0,600),20,20);
  
  a= a+0.02;
}

void keyPressed(){
  saveFrame("#####.png");
}
