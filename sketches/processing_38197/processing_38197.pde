
size (300, 300);
smooth();
 
translate(width/2, height/2); //starts in the middle
for (int x = height/2; x>=50; x-=5) { 
  for (int y =10; y <=width; y+=10) { 
    rotate(radians(50)); //rotate 50 degrees each time
    strokeWeight(1);
    line(x,y,50,0);
    rect(x,y,5,5);//by following the x and y coordinates, small squares are on the ends
    
    
    
  }
}


