
//EMOTION sketch 
//Sruthi Kainady

//canvas description
void setup(){
size(800, 600);
smooth();
background(208,80,84);
}

//for creating parallel circles
void draw(){
  background(0);
strokeWeight(.7);               
stroke(108,14,11);
for(int y = 0; y < 600; y +=20){    //vertical gap between units
  for (int x = 0; x < 800; x +=25){    //horizontal gap between units
  fill(random(255),0,0);
rect(x,random(y),random(20),random(20));
 noFill();
  ellipse(x,y,random(150),random(200));
 
  }
}
}                                               
