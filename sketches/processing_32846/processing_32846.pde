
//Jeremy Peterson - Conditional Quadrants//


smooth();

size(500,500);
background(195,224,227);

int rad = 50;

float centerX, centerY;
centerX = random(50,width-50);
centerY = random(50,height-50);



//draw quadrants//
line(width/2, 0, width/2, height);
line(0, height/2, width, height/2);

//original circle//

noStroke();
ellipse(centerX, centerY, rad, rad);



//opertions//
//where is the circle?//

//bottom right, GREEN //
if(centerX > width/2 && centerY > height/2){
  fill(0,255,0);
  ellipse(centerX, centerY, rad, rad);
  
// top left, BLUE //  
}else if(centerX < width/2 && centerY < height/2){
  fill(0,125,255);
  ellipse(centerX, centerY, rad, rad);

// bottom left, ORANGE, size x2// 
}else if(centerX < width/2 && centerY > height/2){
  fill(225,125,0);
  ellipse(centerX, centerY, rad*2, rad*2);

// top right, PURPLE, size = half// 
}else if(centerX > width/2 && centerY < height/2){
  fill(125,0,125);
  ellipse(centerX, centerY, rad/2, rad/2);
}
