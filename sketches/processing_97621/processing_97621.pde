
//Barbara Cornudella

void setup(){
size (600,600);
frameRate (5);
}
void draw (){
  background (33,32,121);
 
  for (int i = 0; i < height; i = i + 20){  
     strokeWeight (2);
     stroke (i,150,30);
     line(0, i, width, i);
     
     noStroke();
     fill (255);
     ellipse (i,i,20,20);
  }
for (int i = 0; i <20; i = i + 1){
  
  noStroke();
  fill (33,32,121);
  rect (random (width), random (height),random  (100),random (100));
}

 for (int i = 0; i < height; i = i + 20){  
     noStroke();
     fill (255);
     ellipse (i,i,20,20);
 }
}




