
float buildheight = random(40,100);
float buildwidth = random(15,30);
float i = 0;
float windowh = buildheight / 10;
float windoww = buildwidth / 4;
float floorcount = 0;
color buildcolor;
float starcount = random(1000);
float starcounter = 0;

void setup(){
  size(400,400);
  background(0,76,68);
 noStroke();

}

void draw(){
   if(starcounter < starcount){
   fill(random(200,255), random(200,255), random(200,255), random(255));
   ellipse(random(width), random(0,250),random(4), random(4));
   starcounter++;
 }
  if (i < width){
    fill(color(random(50), random(100,255), random(100,255)));
   drawBuilding();
    i = i + buildwidth;
    buildwidth = random(10,30);
    buildheight =random(40,100);
    windowh = buildheight / 10;
    windoww = buildwidth / 5;
    floorcount = 0;
  }
}
  void drawBuilding()
  {
    stroke(.5);
    rect(i, 250, buildwidth, -buildheight);
    noStroke();
    while(floorcount < buildheight -9){
      fill(color(255,255,random(255),random(30,255)));
      rect(i+buildwidth/7, 250 - (floorcount + windowh + 3), windoww, windowh);
       fill(color(255,255,random(255),random(30,255)));
      rect(i+3*buildwidth/7, 250 - (floorcount + windowh + 3), windoww, windowh);
       fill(color(255,255,random(255),random(30,255)));
      rect(i+5*buildwidth/7, 250 - (floorcount + windowh + 3), windoww, windowh);
      floorcount = floorcount + windowh + 3;
    }
  }




