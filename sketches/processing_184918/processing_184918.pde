
size(600,600);
background(19,17,234);

//changes the line color and size
stroke(252,3,32);
strokeWeight(2);

noFill();
//starts,ends,moves over and makes another
//so starts at 0,ends at 150, moves over 50 and repeats
for(int i = 0;i <= 150; i += 50){
  for(int j = 225;j <=600; j +=25){
    for(int k = 0; k <=200; k +=25){
  //top set of circles
    //ellipse(x,,y,width,height)
    ellipse(j,i,50,50);
  //circles on the left
    ellipse(i,j,50,50);
  //rectangles on the bottom right
    //rect(x,y,width,height)
    rect(j,j,250,250);
  //rectangles on the top left
    rect(k,k,100,100);
    }
  }
}


