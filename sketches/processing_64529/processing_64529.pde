
String z = "MELT";
float x,y;
float speed;
float wt;
float ht;
//float d;



void setup(){
  background(255);
  fill(0);
  size(500, 500);
  PFont font = loadFont("universbold.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  smooth();
  noStroke();
  x=width/2;
  y=height/2;
  textSize(60);
  wt=textWidth(z)/2;
  ht=(textAscent()+textDescent());
}
  void draw(){
    fill(255,230,0);
//    float d = dist (mouseX, mouseY, x, y);

//  if (abs(mouseX - x) < wt && abs(mouseY - y) < ht) {
//    y+=1;
//    text("MELT",x,y);  
    
   if (((mouseX > (x-wt)) && (mouseX < (x+wt))) || ((mouseY > (y-ht)) && (mouseY < (y+ht)))){
     y+=1;
    text("MELT",x,y);
   }
  
   
   text("MELT",x,y);
    
    
      

  }

