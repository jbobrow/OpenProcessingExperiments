
//(Re)production of Malevich, Kasimir "Suprematism: Self Portrait in 2D. 

//1915. oil on canvas. 80 x 62cm 

//Stedelijk Museum, Amsterdam 

//opened in photoshop to find size and color(s) of image 
//use rulers and grids to locate starting points for shapes and distances 

void setup(){
  size (495,640);
  noStroke();
  background(253,251,242);
}
  
void draw(){
  fill(16,12,3);
  rect(142,35,215,220);

  fill(244,176,35);
  rect(37,283,89,142);
 
  fill(142,57,3);
  rect(95,425,55,49);
  
  fill(142,57,3);
  ellipse(181,393,60,60);
 
  fill(247,248,243);
  ellipse(181,393,40,40);

  fill(16,12,3);
  quad(387,585,482,505,461,482,366,557);
  fill(15,55,114);
  quad(211,463,360,363,429,507,334,583);
}


