
//combine two relational expressions with a logical operator
//to control the form of a pattern
size(640, 360);
background(126);

boolean test = false;

for (int i = 5; i <= height; i += 5){
  // Logical AND
  stroke(0);
  if((i > 35) && (i <100) ){
    line(width/4, i, width/2, i);
    test = false;
  }

//Logical OR
stroke(76);
if ((i <= 35) || (i >=100)) {
  line(width/2, i, width, i);
  test = true;
}
}



