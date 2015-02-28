
// header
/******************************************
* First Processing Sketch - Pratt Processing Workshop
*    
*  John Olson 03/23/2013
******************************************/

// global variables


// setup
void setup(){
  // the setup function gets executed first thing
  // when the sketch loads and only is executed once
  size(500, 500); //size(width, height); in pixels
  smooth(); //this turns on anti-aliasing

}

// draw
void draw(){
  // the draw function is continually executed repeatedly
  background(#4cff48);
  
  noStroke();
  
  fill(#000000);// black
  ellipse(170, 170, 215, 215);// ellipse(x, y, width, height);

  fill(#000000);// black
  rect(162, 62, 205, 335);// rect(x, y, width, height);
  
  fill(#ffffff);// white
  ellipse(170, 170, 190, 190);// ellipse(x, y, width, height);

  fill(#ffffff);// white
  rect(175, 75, 180, 310);// rect(x, y, width, height);
  
  fill(#fbb7ff);// lips
  rect(175, 270, 125, 60);// rect(x, y, width, height);
  
    fill(#ebebeb);// black
  ellipse(220, 173, 25, 35);// ellipse(x, y, width, height);
  
      fill(#ebebeb);// black
  ellipse(295, 173, 25, 35);// ellipse(x, y, width, height);
  
    fill(#000000);// black
  ellipse(220, 160, 25, 35);// ellipse(x, y, width, height);
  
    
  
  fill(#000000);// blackl
  ellipse(295, 160, 25, 35);// ellipse(x, y, width, height);
  
  fill(#fbb7ff);// pink
  ellipse(295, 300, 60, 60);// ellipse(x, y, width, height);
  
  fill(#ffffff);//teeth
  ellipse(277, 293, 40, 40);// ellipse(x, y, width, height);
  
  fill(#ffffff);//teeth
  ellipse(237, 293, 40, 40);// ellipse(x, y, width, height);
  
  fill(#ffffff);//teeth 
  ellipse(197, 293, 40, 40);// ellipse(x, y, width, height);
  
  fill(#fbb7ff);// lips
  rect(175, 270 , 125, 23);// rect(x, y, width, height);
 
  fill(#e897ed);// lips
  rect(175, 288 , 125, 5);// rect(x, y, width, height);
  
   fill(#000000);// leg
  rect(220, 385 , 20, 60);// rect(x, y, width, height);
  
     fill(#000000);// leg
  rect(190, 425 , 50, 20);// rect(x, y, width, height);
  
     fill(#000000);// leg
  ellipse(189, 435 , 20, 20);// rect(x, y, width, height);
  
  fill(#000000);// leg
  rect(290, 385 , 20, 60);// rect(x, y, width, height);
  
   fill(#000000);// leg
  rect(260, 425 , 50, 20);// rect(x, y, width, height);
  
    fill(#000000);// leg
  ellipse(263, 435 , 20, 20);// rect(x, y, width, height);
 
  

  
  println("this is the console");// println allows you to display information while the sketch is running
}


