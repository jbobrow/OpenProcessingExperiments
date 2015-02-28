
PImage img;
void setup(){
  size(1600,1200);
  background(0,32,32);// teal (but darker)
  stroke(255,20,147,128);// deeppink
  stroke(250,235,215,128);//antique white
  img=loadImage("treefog.jpg");
  for(int x=0;x<1600;x+=5){
    for(int y=0;y<1067;y+=5){
      color pix=img.get(x,y+100);
      float b=map(brightness(pix),0,256,0,50);
//      stroke(255,20,147,5*(50-b));
      line(x+.5*b,y-.5*b,x+b,y-b);
    }
  }
  save("whatisinthosewoods.png");    
      
}

