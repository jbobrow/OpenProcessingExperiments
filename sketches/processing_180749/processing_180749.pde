
/*
Hart Boyd
Exercise 2: Repetition and Variation
*/
int w = 10;
int h = 10;
int startX = 0;
int startY = 0;
int endX = 400;
int endY = 400;

size (400,400); //set canvas size
noFill();
background (random(255),random(255),random(255)); //set background

for(float i=0;i<=random(1,400);i++){ //outer loop
    for(float j=0;j<=random(1,400);j++){ //inner loop
  ellipse(random(startX,endX),random(startY,endY),w+i,h+j); //draw ellipse
  stroke(random(100,200),random(100,200),random(100,200)); //set ellipse stroke color
  rect(random(startX,endX),random(startY,endY),w+i,h+j); //draw rectangle
  stroke(random(100,200),random(100,200),random(100,200)); //set rectangle stroke color
 if(w<h){ //if width is less than height
   strokeWeight(5); //set stroke weight to 5
 }else{
   strokeWeight(2); //set stroke weight to 2
} //end if loop
} //end inner loop
} //end outer loop


