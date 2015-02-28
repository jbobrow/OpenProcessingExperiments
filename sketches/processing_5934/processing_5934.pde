
PImage pic;
color [] samplingArray;
float offsetX=0;
float offsetY=0;
float dphX;
int dphY;
float speedX=10;
float speedY=10;
void setup(){
  size(400,300);
//  pic=  loadImage("SelfP.jpg");
  //pic=  loadImage("weird020.jpg");
  pic=  loadImage("DeathNote.jpg");
  smooth();
  //noLoop();
  background(0);
  image(pic,0,0,width-(width/20),height-(height/10));
  filter(BLUR,(pic.width/width/4));
  //filter(GRAY);
  stroke(255);
  strokeWeight(2);
  line(width/2-20,height-4,width/2+20,height-4);
  pic=get();
  pic.loadPixels();
  samplingArray=pic.pixels;
  pic.updatePixels();
  background(0);
}
void draw(){
  background(0);
  dphX=(mouseX/10.0);
  dphY=(mouseY/50+1);
  //  dphX=0;
  //  dphY=1;

  for(int i=0;i<samplingArray.length;i++){
    float x=i%width;
    float y=i/width;
    float sampleX=x+(dphX*y)+offsetX;
    float sampleY=(y*dphY+offsetY)%(samplingArray.length-1);
    int k=int((sampleY)*width+(sampleX))%(samplingArray.length-1);
    set(int(x),int(y),samplingArray[k]);

  }
  //  println(offset);
  offsetX+=speedX;
  offsetY+=speedY;
  offsetX%=width;
  offsetY%=height;
  //println(offset);
  //filter(BLUR,0.5);
  if(mousePressed){
    speedX=mouseX;
    speedY=mouseY;
  }
}





