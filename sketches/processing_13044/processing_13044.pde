
boolean rectShapes = false;
boolean now = false;

float spin1 = 0; 
float spinSlow = 1;

float x1 = 180;
float y1 = 50;
float x2 = 190;
float y2 = 75;
float x3 = 205;
float y3 = 50;
float x4 = 180;
float y4 = 75;

float Xspeed = 10;
float Yspeed = 9;
float Xspeed2 = 8;
float Yspeed2 = 8;
float Xspeed3 = 0.8;
float Yspeed3 = 8;
float Xspeed4 = 7;
float Yspeed4 = 8;

//  ************************* Triangles
boolean triShapes = false;
boolean triNOW = false;

float tx1 = 185;
float ty1 = 100;
float tx2 = 185;
float ty2 = 100;
float tx2a = 205;
float ty2a = 100;
float tx3 = 175;
float ty3 = 120;
float tx4 = 175;
float ty4 = 120;
float tx5 = 215;
float ty5 = 120;
float tx6 = 215;
float ty6 = 120;
float tx7 = 185;
float ty7 = 140;
float tx8 = 185;
float ty8 = 140;
float tx9 = 205;
float ty9 = 140;



float txSpeed = 10;
float tySpeed = 10;
float tx2Speed = 2;
float ty2Speed = 11.5;
float tx8Speed = 10.5;
float ty8Speed = 9;
float tx3Speed = 10;
float ty3Speed = 1;
float tx7Speed = 10;
float ty7Speed = 2;
float tx2aSpeed = 4;
float ty2aSpeed = 11.5;
float tx4Speed = 10;
float ty4Speed = 12;
float tx5Speed = 2;
float ty5Speed = 14;
float tx6Speed = 10;
float ty6Speed = 2;
float tx9Speed = 10;
float ty9Speed = 12;

//  ************************* LINES
boolean lineShapes = false;
boolean lineNOW = false;

float lx1 = 190;
float ly1 = 140;

float lxSpeed = 7;
float lySpeed = 12;

//  ************************* DOTS
boolean dots = false;
boolean dotsNOW = false;

float d;
float t;

float gravity = 0.5;

void setup() {
  size(400,550);
  smooth();
  frameRate(40);
}

void draw() {
  noStroke();
  fill(255);
  rect(0,0,400,550);

  //Buttons
  fill(250,95,204);
  rect(0,0,100,30);
  fill(217,234,25);
  rect(100,0,100,30);
  fill(16,215,85);
  rect(200,0,100,30);
  fill(14,195,245);
  rect(300,0,100,30);

  // _____________________________________________________________ Start if (rectShapes)
  if (rectShapes) {
    //stroke(50,35,35,50);
    fill(180,135,135,150);
    pushMatrix();
    translate(x1,y1);
    rotate(spin1);
    rect(0,0,25,25);//rect 1
    popMatrix();
    rect(x2,y2,25,25);//rect2
    rect(x3,y3,10,25);// rect 3
    rect(x4,y4,10,25);// rect 4


    // CONDITIONAL SHATTER activation
    if (now) {
      //      pushMatrix();
      //      rotate( degrees(frameCount));
      // OBJECT 1
      spin1 = spin1 + .25;
      x1 = x1 + Xspeed;
      y1 = y1 - Yspeed;
      Yspeed = Yspeed - gravity;

      // If the object hits the right side, it bounces slightly
      if (x1 == width-30 || x1 < 0) {
        Xspeed = Xspeed/3 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(y1 < -30) {
        Yspeed = Yspeed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (y1 > height-25) {
        spin1 = 0;
        y1 = height-25;
        Xspeed = Xspeed / 2;
      }

      //      if(y1 < height-25) {
      //        pushMatrix();
      //        translate(x1,y1);
      //        rotate(radians(frameCount * 2  % 360));
      //        popMatrix();
      //      }


      // OBJECT 2!!!!!!!!!!!!!!!!!!!!!!!!!!!
      x2 = x2 - Xspeed2;
      y2 = y2 + Yspeed2;
      Yspeed2 = Yspeed2 + gravity;

      // If the object hit the right side, it bounces slightly
      if (x2 == 25 || x2 < 0) {
        Xspeed2 = Xspeed2/3 * -1;
      }

      //    // If the object rises above height -30, it begins to descend
      //    if(y2 < -30){
      //    Yspeed2 = Yspeed2 * -1;
      //    Yspeed2 = Yspeed2 * gravity;
      //    }

      // If the object hits the bottom, it stops
      if (y2 > height-25) {
        y2 = height-25;
        Xspeed2 = Xspeed2 / 2;
      }

      // OBJECT 3!!!!!!!!!!!!!!!!!!!!!!!!
      x3 = x3 + Xspeed3;
      y3 = y3 - Yspeed3;
      Yspeed3 = Yspeed3 - gravity;

      // If the object hit the right side, it bounces slightly
      if (x3 == width-25 || x3 < 0) {
        Xspeed3 = Xspeed3/3 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(y1 < -30) {
        Yspeed3 = Yspeed3 * -1;
        Yspeed3 = Yspeed3 * gravity;
      }

      // If the object hits the bottom, it stops
      if (y3 > height-25) {
        y3 = height-25;
        Xspeed3 = Xspeed3 / 2;
      }


      // OBJECT 4!!!!!!!!!!!!!!!!!!!!!!!!
      x4 = x4 + Xspeed4;
      y4 = y4 - Yspeed4;
      Yspeed4 = Yspeed4 - gravity*1.2;

      // If the object hits the right side, it bounces slightly
      if (x4 >= 390 || x4 < 0) {
        Xspeed4 = Xspeed4 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(y4 < -30) {
        Yspeed4 = Yspeed4 * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (y4 > height-25) {
        y4 = height-25;
        Xspeed4 = Xspeed4 / 2;
      }
      //      popMatrix();
    } // END CONDITIONAL SHATTER (now)
  } // _____________________________________________________________ END if (rectShapes) 

  // _____________________________________________________________ Begin if (triShapes) 
  if (triShapes) {
    fill(130,135,180,150);
    triangle(tx1, ty1, tx1+10, ty1+20, tx1+20, ty1);
    triangle(tx2, ty2, tx2-10, ty2+20, tx2-20, ty2);
    triangle(tx2a, ty2a, tx2a+10, ty2a+20, tx2a+20, ty2a);    
    triangle(tx3, ty3, tx3+10, ty3+20, tx3+20, ty3);
    triangle(tx4, ty4, tx4-10, ty4+20, tx4-20, ty4);
    triangle(tx5, ty5, tx5+10, ty5+20, tx5+20, ty5);
    triangle(tx6, ty6, tx6-10, ty6+20, tx6-20, ty6);  
    triangle(tx7, ty7, tx7+10, ty7+20, tx7+20, ty7);
    triangle(tx8, ty8, tx8-10, ty8+20, tx8-20, ty8);
    triangle(tx9, ty9, tx9+10, ty9+20, tx9+20, ty9);   

    if (triNOW) {
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 1
      tx1 = tx1 + txSpeed;
      ty1 = ty1 - tySpeed;
      tySpeed = tySpeed - gravity;

      // If the object hits the right side, it bounces slightly
      if (tx1 == width-25 || tx1 < 0) {
        txSpeed = txSpeed/3 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(ty1 < -30) {
        tySpeed = tySpeed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ty1 > height-20) {
        ty1 = height-20;
        txSpeed = txSpeed / 2;
      }
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 8
      tx8 = tx8 - tx8Speed;
      ty8 = ty8 - ty8Speed;
      ty8Speed = ty8Speed - gravity;

      // If the object hits either side, it bounces slightly
      if (tx8 == width-25 || tx8 < 25) {
        tx8Speed = tx8Speed/4 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(ty8 < -30) {
        ty8Speed = ty8Speed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ty8 > height-20) {
        ty8 = height-20;
        tx8Speed = tx8Speed / 2;
      }
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 2
      tx2 = tx2 + tx2Speed;
      ty2 = ty2 - ty2Speed;
      ty2Speed = ty2Speed - gravity;

      // If the object hits either side, it bounces slightly
      if (tx2 == width-25 || tx2 < 25) {
        tx2Speed = tx2Speed/3 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(ty2 < -30) {
        ty2Speed = ty2Speed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ty2 > height-20) {
        ty2 = height-20;
        tx2Speed = tx2Speed / 2;
      }
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 3
      tx3 = tx3 + tx3Speed;
      ty3 = ty3 + ty3Speed;

      // If the object hits either side, it bounces slightly
      if (tx3 == width-25 || tx3 < 25) {
        tx3Speed = tx3Speed/3 * -1;
        ty3 = ty3 + ty3Speed*10;
        ty3Speed = ty3Speed*10 + gravity;
      }

      // If the object rises above height -30, it begins to descend
      if(ty3 < -30) {
        ty3Speed = ty3Speed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ty3 > height-20) {
        ty3 = height-20;
        tx3Speed = tx3Speed / 2;
      }
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 7
      tx7 = tx7 - tx7Speed;
      ty7 = ty7 + ty7Speed;

      // If the object hits either side, it bounces slightly
      if (tx7 == width-25 || tx7 < 25) {
        tx7Speed = tx7Speed/2 * -1;
        ty7 = ty7 + ty7Speed;
        ty7Speed = ty7Speed + gravity;
      }

      // If the object rises above height -30, it begins to descend
      if(tx7 < -30) {
        ty7Speed = ty7Speed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ty7 > height-20) {
        ty7 = height-20;
        tx7Speed = tx7Speed / 2;
      }
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 2a
      tx2a = tx2a - tx2aSpeed;
      ty2a = ty2a - ty2aSpeed;
      ty2aSpeed = ty2aSpeed - gravity;

      // If the object hits either side, it bounces slightly
      if (tx2a == width-25 || tx2a < 25) {
        tx2aSpeed = tx2aSpeed/3 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(ty2a < -30) {
        ty2aSpeed = ty2aSpeed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ty2a > height-20) {
        ty2a = height-20;
        tx2aSpeed = tx2aSpeed / 2;
      }
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 4
      tx4 = tx4 + tx4Speed;
      ty4 = ty4 - ty4Speed;
      ty4Speed = ty4Speed - gravity;

      // If the object hits either side, it bounces slightly
      if (tx4 == width-25 || tx4 < 25) {
        tx4Speed = tx4Speed/3 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(ty4 < -30) {
        ty4Speed = ty4Speed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ty4 > height-20) {
        ty4 = height-20;
        tx4Speed = tx4Speed / 2;
      }
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 5
      tx5 = tx5 + tx5Speed;
      ty5 = ty5 - ty5Speed;
      ty5Speed = ty5Speed - gravity;

      // If the object hits either side, it bounces slightly
      if (tx5 == width-25 || tx5 < 25) {
        tx5Speed = tx5Speed/3 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(ty5 < -30) {
        ty5Speed = ty5Speed/2 * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ty5 > height-20) {
        ty5 = height-20;
        tx5Speed = tx5Speed / 2;
      }
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 6
      tx6 = tx6 + tx6Speed;
      ty6 = ty6 - ty6Speed;

      // If the object hits either side, it bounces slightly
      if (tx6 == width-25) {
        tx6Speed = tx6Speed/3 * -1;
        ty6Speed = ty6Speed * -1;
        ty6 = ty6 + ty6Speed*4.5;
        ty6Speed = ty6Speed*4.5 + gravity;
      }


      // If the object hits the bottom, it stops
      if (ty6 > height-20) {
        ty6 = height-20;
        tx6Speed = tx6Speed / 2;
      }
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^Tri 9
      tx9 = tx9 + tx9Speed;
      ty9 = ty9 - ty9Speed;
      ty9Speed = ty9Speed - gravity;

      // If the object hits the right side, it bounces slightly
      if (tx9 == width-25 || tx9 < 0) {
        tx9Speed = tx9Speed/3 * -1;
      }

      // If the object rises above height -30, it begins to descend
      if(ty9 < -30) {
        ty9Speed = ty9Speed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ty9 > height-20) {
        ty9 = height-20;
        tx9Speed = tx9Speed / 2;
      }
    } // END TRI CONDITIONAL
  } // _____________________________________________________________ END if (triShapes)

  // _____________________________________________________________ Begin if (lineShapes) 
  if (lineShapes) {
    stroke(180,25,130,150);
    line(lx1, ly1, lx1+40, ly1+30);

    if (lineNOW) {
      //      lx1 = lx1 + Xspeed;
      ly1 = ly1 + Yspeed;
      lySpeed = lySpeed + gravity;

      //      for(int ly1, height-5) {
      //        lx1 = random (lx1+5,lx1-5);
      //      }

      if( ly1 >= height-40) {
        lySpeed = lySpeed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (ly1 > height-5) {
        ly1 = height-5;
        lxSpeed = lxSpeed / 2;
      }
    }
  } // _____________________________________________________________ END if (lineShapes)

  if (dots) {
    stroke(0);
    for (float d = 0; d < 400; d = d+20) {
      for (float t = 0; t < 550; t = t+20) {
        point(d, t);
        //        d = d +;
        if (dotsNOW) {
          pushMatrix();
          frameRate(10);
          t = t + ty6Speed;
          ty6Speed = ty6Speed + gravity;

          // If the object hits the bottom, it stops
          if (t > height-5) {
            t = height-5;
          }
          popMatrix();
        }
      }
    }
  }//  END if DOTS
}//end DRAW

void mousePressed() { 

  if(mouseX>0 && mouseX<100 && mouseY>0 && mouseY<30) {
    rectShapes = !rectShapes;
  }
  if(mouseX>0 && mouseX<550 && mouseY>50 && mouseY<550) {
    if (rectShapes == true) {
      now = !now;
    }
    if (triShapes == true) {
      triNOW = !triNOW;
    }
    if (lineShapes == true) {
      lineNOW = !lineNOW;
    }
    if (dots == true) {
      dotsNOW = !dotsNOW;
    }
  }

  if(mouseX>100 && mouseX<200 && mouseY>0 && mouseY<30) {
    triShapes = !triShapes;
  }
  if(mouseX>200 && mouseX<300 && mouseY>0 && mouseY<30) {
    lineShapes = !lineShapes;
  }
  if(mouseX>300 && mouseX<400 && mouseY>0 && mouseY<30) {
    dots = !dots;
  }
}


