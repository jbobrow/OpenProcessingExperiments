
//Exercise for Creating Geometric and Generative Art with Code with
//Kunstwurfelspiel Academy

//line original composition 
//trying a system to create artistic composition

// make variables for y position left and right
int far_y= 0;
int near_y = 0;


// set size
size(600, 600);
// set background to black
background(0);

// set stroke size
strokeWeight(56);

// set colour to orangey/red
stroke(255,102,0);

//put orangey line in background
line(200, 600, 490, 0);

// set stroke size
strokeWeight(5);

// set colour to green
stroke(153,255,0);

//for 145 times
for(int i = 0; i < 96; i++) {
  //if i is even
  if(i%2 ==0) {
    //left line end moves down 13px
    near_y = near_y +13;
  }
  //else right moves down 15px
    else{
      far_y = far_y +15;
    }
    // drawing the lines
   line(0, near_y, 600, far_y);
}





