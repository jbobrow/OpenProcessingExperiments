
size(500,500);
background (11,200,100);
fill(200,45,200, 150);
smooth(); 
strokeWeight(20);
stroke(200);
line(500, 20,50,500);
 line(500, 80,100,500);
  line(500, 160,200,500);
  line(500, 300,300,500);
 stroke(1);
 strokeWeight(2);
 
for(float y= 10; y<=500; y+=100) {
  for (float x =10; x<500; x+=100) {
    ellipse(x+y, y+ x/10.0, x/4,100);
  }
}
stroke(200,100,10,150);
strokeWeight(7);
for(int y=1; y<500; y+=10){
  for(int x=30; x<500; x+=50){
    point(x,y);
  }
}

