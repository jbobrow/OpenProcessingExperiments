
void setup(){
size(500, 700);
smooth();

}
 
//for creating parallel circles
void draw(){
  size(500,700);
  background(215, 223, 35);
strokeWeight(10);              
stroke(50,14,50);
for(int y = 0; y < 700; y +=45){    //vertical gap between units
  for (int x = 0; x < 500; x +=25){    //horizontal gap between units
 


noStroke();
 fill (map(mouseX,0,height,0,255),0, map(mouseY,0,width,0,255));
  rect (x,y,random(60),random(80));
  
  }
  if (key =='s') {
saveFrame();
}
}
}

                
                
