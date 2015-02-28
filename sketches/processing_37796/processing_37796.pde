
size (300, 300);
colorMode(RGB, 75); //insead of using full width, I stopped the fade at 75
//to give the composition an interesting bounding box and value for 2nd grid

//background color grid
for (int y = 0; y < height; y++) {  
  for (int x = 0; x < width; x++) {
    stroke(width, x, y);//red first bc it's (400,0,0) and then is goes towards
    //green and makes yellow... so on
    point(x, y);
  }
}

for (int x = 10; x <= width; x += 20) {
  for (int y = 10; y <= width; y += 20) {

    //circles
    pushMatrix();
    stroke(0, random(200), random(200)); //stroke has random colors of 
    //green and blue in the 200 range
    strokeWeight(random(5)); //the stroke weight has a random component with a
    //value of 5
    translate (75, 75); //starts grid at this point
    fill(random(100), 0, random(150)); 
    ellipse(x, y, 10, 10); //ellipse will follow loop and have a diameter of 10
    popMatrix();

    //small dot grid drawn with line
    pushMatrix();
    stroke(random(10), random(100), random(100));
    strokeWeight(random(3));
    translate(5, 5);
    line(x, y, x, y); //by having x and y values, it creates small dots rather
    //than lines because the second coordinates do not have a value.
    popMatrix();
  }
}


