
void setup(){
size(250,250);
background(255);
strokeWeight(4);
smooth();
stroke(0,102);
}

void draw (){
  strokeWeight(0.5);
  stroke(mouseY,24,24);
  fill(0,0);
  //black to red circles when mouse is moved around
ellipse(mouseX,mouseY,20,20);
strokeWeight(10);
stroke(255);
for(int y=0; y<=height; y+=40){ 
for (int x=0; x<=width; x+=40){
 //white background of circle outlines 
ellipse(x,y,40,40);}}
//pink circle in the centre
fill(#E85B5B);
ellipse(120,120,40,40);
}


