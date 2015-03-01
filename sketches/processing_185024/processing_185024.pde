
size(400,400);
background(35);

fill(0,220,170);

for(int i = 30; i < 50; i = i+3){
  for(int j = 0; j < 90; j = j+3){
    triangle(i,50,j,100,200,300);
    triangle(200,j,100,i,300,200);
    
  }
}


