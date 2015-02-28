
  size(250,250);

 background(255,236,23,1);
 smooth();
 noStroke();
for(int y=2;y<=height;y*=2){
    for(int x=2;x<=width;x*=2){
    fill(175,115,175,45);
    
      //rectMode(CENTER);
     triangle(125,125,x+20,y+20,x,y);
     triangle(125,125,250-(x+20),250-(y+20),250-x,250-y);  
     fill(210,30,220,9);
     ellipse(125+x/1.1,125-x/1.1,x/2,x/2);
     ellipse(125-x/1.1,125+x/1.1,x/2,x/2);
   }
  }


