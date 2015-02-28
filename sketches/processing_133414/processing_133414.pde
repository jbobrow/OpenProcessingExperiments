
void setup(){

size(400, 400);
background(0);
  smooth();

}

/*
for (int i = 0; i < 400; i += 25){
  for(int j = 0; j <400; j += 25){
  rect(i, j, 25, 25);
  }
}
*/

void draw(){

fill(0, 15);
rect(0,0,width,height);
  
    stroke(255, 0, 0);
for (int i = 0; i < 400; i += (map(mouseX,0,400,25,250))){

 line(0,height,i,0); 
}

for (int i = 0; i <= 400; i += (map(mouseY,0,400,25,250))){
 line(0,height,width,i); 
}

  
for (int i = 0; i < 400; i += (map(mouseX,0,400,25,250))){
 line(width,height,width-i,0); 
}

for (int i = 0; i <= 400; i += (map(mouseY,0,400,25,250))){
 line(width,height,0,i); 
}

}


