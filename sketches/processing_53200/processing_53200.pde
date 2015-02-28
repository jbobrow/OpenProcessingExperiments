
//sets the size of doc
size(250,250);

//background color
background(255);

//smooths out rough edges
smooth();

//no stroke & borders on shapes
noStroke();

//center rectangle shape will be drawn with equal width and height
rectMode(CENTER);

//puts the center of where shape starts (inthis case 125/half of 250)
translate(125,125);

//fills a dark red color
fill(60,0,0);

//loop the squares, starts at point a:180, going up by 10 size
for(int a=175; a>0;a-=10){
  
    //turn as we draw by 0.50
  rotate (0.50);
  
  //changing the color as each shape goes in
  fill((a-255)*-1,0,0);
  
    //as a changes change rectangle
  rect(0,0,a,a);
}
                
