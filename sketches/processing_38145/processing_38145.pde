
size(400,400);



ellipseMode(CENTER);

fill(RGB,10,60,120);
smooth();



for (int y=20; y<height/4; y+=15){
  for(int x=20; x<width/4; x+=15){
    ellipse(x+10,y+10, 30, 30);
    
    line(x,50,y,50);
translate(10,10);


  }
}







