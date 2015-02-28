
void setup () {
  size (900,900);
}


void draw () {
  background (0);


    
  for (int i=0; i<1500; i = i +175){
  for (int j=0; j<1000; j=j+175){
    
    fill (0);
   line (i,j, i+200, j+200);
   
    fill (150, i, j, 10);
    stroke (60,0,j, i);
  ellipse(i,j,i+200,j+400);
    
    
    fill (200,0, 255,50);
    textSize (350);
    text ("O", i, j+40);
  }
}
}

