
void setup(){
size(500, 700);
smooth();
background(215,223,84);
}
 
//for creating parallel circles
void draw(){
  size(500,700);
  background(215, 223, 35);
strokeWeight(10);              
stroke(50,14,50);
for(int y = 0; y < 700; y +=25){    //vertical gap between units
  for (int x = 0; x < 700; x +=20){    //horizontal gap between units
 


 noStroke();
 fill(0, 167, 157,98);
  ellipse(x,y,random(30),random(100));
  
  }
  if (key =='s') {
saveFrame();
}
}
}                           
