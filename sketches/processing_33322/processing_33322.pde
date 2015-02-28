
size(600, 600);
background (225);
float r = random(255);
float g = random(255);
float b = random(255);

for (int i = 50; i < height*.5; i += 15) {
  float colorValue = map(i, 0, 600, 0, 600); //takes 5 values.
  //ellipse(i ,100, i/10, i/10); 
  fill (i, g, b);
  noStroke();
  smooth(); 
  rect(i-50, i-50, 600, 600);


}


//
//
//if (5 < 10){
//  if (6 > 15){
//   
//  ellipse(550, 50, 10, 10);
//}
//ellipse (550, 50, 90, 10);
//}

