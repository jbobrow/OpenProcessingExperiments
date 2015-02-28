
float width;
float height;
float rise = 0;

void setup(){
  size(1200,600);
  background(0);
  smooth();
}

void flame(){
  noStroke();
  fill(255,0,0,80);
  quad(mouseX+rise,mouseY+rise,mouseX+.5*width+rise,mouseY+.5*height+rise,
        mouseX+.05*width+rise,mouseY+height+rise,mouseX-.5*width+rise,mouseY+.5*height+rise);}
       
  

void draw(){
  fill(0,1);
  rect(0,0,1200,600);
  width = random(10, 60);
  height = random(2*width, 3*width);
  
  while(rise>-40){
    rise = rise - 5;
    flame();}
  rise = 0;
}

void mousePressed(){
  flame();}

