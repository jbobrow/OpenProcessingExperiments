

  
size(300,300);
noStroke();
background(255,200,200);

  

   
for(int y=-20; y<=height; y+=18) {
  for(int x=-20; x<=width; x+=18) {
    fill(x,y,y*0.8,128);
    triangle(x*1.1,y,x*1.11,y+30,x-40,y*1.60);
  }
}
