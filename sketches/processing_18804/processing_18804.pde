
 size(250,250);

 background(0);
 smooth();

  for(int y=1;y<=height;y+=30){
    for(int x=1;x<=width;x+=30){
       stroke(1,x+10,y+70);
       strokeWeight(1.3);
      
      line(x+1,y+1,30,40);
    }
  }
  




