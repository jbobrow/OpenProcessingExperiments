
//sets the size of doc
size(250,250);

//background color
background(105);

//smooths out rough edges
smooth();

//center rectangle shape will be drawn with equal width and height
rectMode(CENTER);

//puts the center of where shape starts (inthis case 125/half of 250)
translate(125,125);

//loop the squares, starts at point a:255, going up by 0.1 size
for(int a=255; a>5;a-=0.1){
  
    //turn as we draw by 5
  rotate (5);
  
  //changing the color as each shape goes in
  fill((a-100)*-16,5,1);
  
    //as a changes change rectangle
  rect(90,88,-250,-a);
  }
