
size(700,700);
smooth();
background(247, 64, 64);




for (int y=0; y<=height; y+=50) {
  for (int x=0; x<=width; x+=50){
   
   strokeWeight(1);
   stroke(27, 9, 130);
   line(350,350, x+10, y-20);
   
   strokeWeight(2);
   stroke(255, 90);
   line(350,350, x, y);
   
  }
}








