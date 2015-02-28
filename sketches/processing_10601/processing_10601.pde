
float ypos = 80;
    float speed1 = 1.1;
    float speed2 = 2.1;
    int yposdown = 80;
    boolean checkup = true;
     
     
    void arm(float xArm, float yArm)
    {
      pushStyle();
      pushMatrix();
    noStroke();
    fill(#FFB79B);
    //bewegung
    if (ypos > 10 && checkup == true)
    {
    ypos = ypos - speed2;
      if (ypos < 11)
      { ypos = 10; checkup = false; }
    }
    if (ypos < yposdown && checkup == false )
    { ypos = ypos + speed1;
      if (ypos > yposdown)
      { ypos = 80; checkup = true; } 
    }
    translate(xArm,yArm);
     
     
//oberarm
beginShape();
vertex( 272.0 , -2.0 );
bezierVertex( 235.0 , 14.0-ypos/3 , 212.0-ypos/3 , 53.0 , 213.0 , 129.0 );
bezierVertex( 213.0 , 129.0 , 213.0 , 168.0 , 260.0 , 138.0 );
bezierVertex( 260.0 , 138.0 , 323.0+ypos/8 , 83.0 , 314.0 , 14.0 );
bezierVertex( 314.0 , 14.0 , 310.0 , 1.0 , 273.0 , -3.0 );
endShape();
 stroke(0);
 strokeWeight(3);
  
 //anker
 pushMatrix();
 translate(-10-ypos/7,0);
 line( 266.0 , 43.0 , 284.0 , 52.0 );
 bezier( 260.0 , 52.0 , 253.0 , 67.0 , 268.0 , 78.0 , 287.0 , 68.0 );
 bezier( 278.0 , 39.0 , 278.0 , 39.0 , 273.0 , 57.0 , 265.0 , 69.0 );     
 popMatrix();
 
 //hinteres gewicht
 
 noStroke();
 beginShape();
 translate(230,130);
 rotate(radians(ypos));
 pushStyle();
  fill(0);
  beginShape();
vertex( -171.0 , 30.0 );
bezierVertex( -166.0 , 9.0 , -157.0 , -7.0 , -122.0 , -5.0 );
bezierVertex( -122.0 , -5.0 , -89.0 , 6.0 , -95.0 , 43.0 );
bezierVertex( -95.0 , 43.0 , -108.0 , 92.0 , -143.0 , 79.0 );
bezierVertex( -143.0 , 79.0 , -178.0 , 65.0 , -170.0 , 30.0 );
endShape();
popStyle();
  
  //unterarm
  beginShape();
vertex( -8.0 , -17.0 );
bezierVertex( -35.0 , -14.0 , -67.0 , 19.0 , -97.0 , 45.0 );
bezierVertex( -97.0 , 45.0 , -114.0 , 34.0 , -126.0 , 42.0 );
bezierVertex( -126.0 , 42.0 , -142.0 , 40.0 , -145.0 , 55.0 );
bezierVertex( -145.0 , 55.0 , -153.0 , 68.0 , -138.0 , 62.0 );
bezierVertex( -138.0 , 62.0 , -141.0 , 74.0 , -129.0 , 68.0 );
bezierVertex( -129.0 , 68.0 , -135.0 , 85.0 , -123.0 , 77.0 );
bezierVertex( -123.0 , 77.0 , -125.0 , 88.0 , -115.0 , 82.0 );
bezierVertex( -115.0 , 82.0 , -90.0 , 74.0 , -89.0 , 63.0 );
bezierVertex( -89.0 , 63.0 , -2.0 , 30.0 , 12.0 , 13.0 );
bezierVertex( 12.0 , 13.0 , 56.0 , 17.0 , 30.0 , -18.0 );
bezierVertex( 30.0 , -18.0 , 19.0 , -30.0 , -4.0 , -18.0 );
endShape();
 //vorderes gewicht
 pushStyle();
fill(0);
 beginShape();
vertex( -113.0 , 44.0 );
bezierVertex( -113.0 , 44.0 , -100.0 , 33.0 , -73.0 , 55.0 );
bezierVertex( -73.0 , 55.0 , -49.0 , 80.0 , -91.0 , 113.0 );
bezierVertex( -91.0 , 113.0 , -116.0 , 123.0 , -134.0 , 89.0 );
bezierVertex( -134.0 , 89.0 , -158.0 , 51.0 , -113.0 , 43.0 );
endShape();
popStyle();
 
 popStyle();
 popMatrix();
  
  
 }

