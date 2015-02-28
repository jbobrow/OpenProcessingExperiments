
PImage img = createImage(500,500,RGB);
int nextX=0;
int alpha;
int dia;
String str,str2; 
void setup(){
  size(500, 500);
  colorMode(HSB);
  str = "Electric";
  str2 = "Scoreboard";
  noStroke();
}

void draw(){
  background(0);
  textSize(95);
  fill(40,80,256);
  text(str,nextX,100);
  textSize(85);
  text(str2,nextX,200);
  filter(BLUR,1);
  img.loadPixels();
  loadPixels();
  for(int x = 3; x < width; x += 6){
    for(int y = 3; y < height/2; y += 6){
      img.pixels[x+y*width] = pixels[x+y*width];
    }
  }
  img.updatePixels();
  updatePixels();
  background(0);
  for(int x = 3; x < width; x += 6){
    for(int y = 3; y < height/2; y += 6){
      fill(40,80,256,150);
      ellipse(x,y,3,3);
      if(img.pixels[x+y*width]!=color(0)){
        if(img.pixels[x+y*width]!=color(200,200,0));
         alpha=int(map(brightness(img.pixels[x+y*width]),0,200,150,250));
         dia=int(map(brightness(img.pixels[x+y*width]),0,200,3,5));
         fill(40,80,256,alpha);
      ellipse(x,y,dia,dia);
      noStroke();
      fill(40,80,256,20);
      ellipse(x,y,dia+20,dia+20);
      }
    }
  }
  fill(40,80,256);
  text(str,nextX,350);
  textSize(85);
  text(str2,nextX,450);
  
  nextX += 3;
  if(nextX >= width){
    nextX=0;
  }
  
    
  
}


