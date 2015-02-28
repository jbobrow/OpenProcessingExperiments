
size(250, 250); 
background(0); 
noStroke();
smooth(); 
     for(int y=-20;y<=1000;y+=10){
    for(int x=-20;x<=1000;x+=10){
    fill(x,y,x,y);
  ellipse(1.1*x,1.1*y,x/8,x/8);
     
    }
}

