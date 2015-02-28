
float buildheight = random(40,60);
float buildwidth = random(15,20);
float i = 0;
float windowh = buildheight / 10;
float windoww = buildwidth / 4;
float floorcount = 0;
color buildcolor;
PImage img1;


 
void setup(){
  size(640,410);
  background(0,30,78);
 
}
 
void draw(){
img1=loadImage("bg.jpg");
img1.resize(640,410);
image(img1,0,0);
tint(125,0);
  
   if (i < width){
    fill(color(random(200), random(40), random(10)));
   drawBuilding();
    i = i + buildwidth;
    buildwidth = random(15,20);
    buildheight =random(40,60);
    windowh = buildheight / 10;
    windoww = buildwidth / 4;
    floorcount = 0;
  }
}
  void drawBuilding()
  {
    stroke(.2);
    rect(i, 278, buildwidth, -buildheight);
    noStroke();
    while(floorcount < buildheight -9){
      fill(color(255,255,random(255),random(30,255)));
      rect(i+buildwidth/7, 278 - (floorcount + windowh + 3), windoww, windowh);
       fill(color(255,255,random(255),random(30,255)));
      rect(i+3*buildwidth/7, 278 - (floorcount + windowh + 3), windoww, windowh);
       fill(color(255,255,random(255),random(30,255)));
      rect(i+5*buildwidth/7, 278 - (floorcount + windowh + 3), windoww, windowh);
      floorcount = floorcount + windowh + 3;
    }
    
      
    
  }



