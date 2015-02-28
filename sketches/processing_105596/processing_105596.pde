
//Use a for loop to create multiple rectangles

size (400, 400);
int s = width/10;

//rect(320, 0, 40, 40);
//rect (360, 0, 40, 40);

/*
  
//a nested function must be added to make the squares appear vertically also
  for (int i=0; i< width; i+=40){
    for (int j = 0; j < height; j+=s){
    
    //this creates a gradient
    fill(i/2, j/2, 10);
    
    //this makes rectrangles horizontal and vertical
    rect(0+i, 0+j, s, s);
    }
  }

  //this positions the rectangles horizontal
  /*
  for (int i=0; i< width; i+=40){
  rect(0+i, 0, s, s);
  */
  
 
  //this positions the rectangles diaglal
  /*
  for (int i=0; i< width; i+=40){
  rect(0+i, 0+i, s, s);
  */
//}

//this creates a color gradient using points
for(int i=0; i < width; i++) {
  for(int j = 0; j < height; j++){
  //3d gradient
  stroke(i,j,10);
  
  //linear horizontal gradient
  //stroke(i,i,10);
  
  //linear vertical gradient
  //stroke(j,j,10);
  
  point(i,j);
  }
}
