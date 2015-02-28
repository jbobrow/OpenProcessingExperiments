
PImage pic;
PImage OSIY;
PImage TF;
boolean filterApplied = false;

void setup(){
  size(600,800);
  pic = requestImage("548px-Hakumen_(Emblem,_Crest).png");
  OSIY = requestImage("Oh_stop_it,_you.jpg");
  TF = requestImage("trollface.jpg");
}


void draw(){
  println(TF.width);
  if (pic.width > 0)
  {
   //image(pic,0,0, width, height); 
  }

 if (filterApplied == false)
 {
  filter(INVERT);
  filterApplied = true;
 }
  //noLoop();

  stroke(255);
  for(int x = 0; x < width; x+= 50)
  {
    line(x, 0, x, height);
  }
   
  for(int y = 0; y < height; y += 50)
  {
    line(0, y, height, y);
  }
   
  

 if (OSIY.width > 0){
   image(OSIY,450,650,200,150);
 }
 
if (TF.width > 0){
  //image(TF,0,0,200,150);
}

float x = 150;
  float y = 150;
  float x2 = y;
  float y2 = x;
   
  stroke(238, 23, 250);
strokeWeight(1);
  while(x < 650)
  {
    x += random(-5, 35);
    y += random(5, 25);
    line(x2, y2, x, y);
    x2 = x;
    y2 = y;
  }


 



}




