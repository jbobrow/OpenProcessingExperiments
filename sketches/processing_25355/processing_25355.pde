
rect ( 0, 5, 70, 30);


//using the function translate; just copy and pasting it under the original object
pushMatrix();
translate(10,30);
rect ( 0, 5, 70, 30);
popMatrix();

fill (185, 0, 0);
translate(50,50);
rect(0, 5, 70, 30);



//with a rectangle, and rotating it
//Translate/rotate

size(350,350);

smooth();
background(255);
stroke(255,120);
translate(60,30);

//drawing 85 rect, it wil start at zero, then up to zero
// ++ it adds one, means -> i + 1
for(int i =0; i < 85; i ++){
  strokeWeight(i);
  // how much the rect is rotated , ie. PI divided by 110 
  rotate(PI/110);
  //placement of the object
  rect(width/2, height/2,70,50);
  
}


