
// character function
void jumpingjackguy(int x, int y)
{
  pushMatrix();
  translate(x, y);

 
 
  // body
  fill(255, 0, 0); // bodycolor  
  ellipse(0, 0, 100, 100);  
  
  // nose
  fill(0, 255, 255);
  ellipse( 0, 0, 9, 9);  

  // eyes
  eye( -50,  -50,  20, mx-x, my-y);
  eye( 50,   -50,  20, mx-x, my-y);
  
  
  popMatrix();
}


void eye(int x, int y, int s, float lookx, float looky) {
  
    // eye angle
    float  angle = atan2(looky-y, lookx-x);
    
    // draw eye
    pushMatrix();
    translate(x, y);
    fill(255, 255, 255);
    ellipse(0, 0, s, s);
    rotate(angle);
    fill(0, 0, 255);
    ellipse(s/4, 0, s/2, s/2);
    popMatrix();      
}




