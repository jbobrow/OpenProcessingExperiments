

class Cell {
  float xpos, ypos;
  float[] Px; float[] Py;
  float UR = 50; 
  float IR, a;
  int corners;
  float cx, cy = 0;
  float cx2 = cx; 
  float cy2 = cy;
  float vx=random(1,5);
  float vy=random(1,5);
  float vr = 1.0;
  float spr = 0.01;
  float spw = 0.2;
  float angle = 0.0;
  int id;
  Cell[] others;

  boolean on=false;

  float easing = 0.04;
  float friction = 0.99;
  float luminance = 180;
  int alive=0; int dead=0; int asleep=0; int old=0;
  int top=36;

  Cell(int corner, float x, float y, int identity, Cell[] otherid) {
    corners = corner;
    xpos = x;
    ypos = y;
    id = identity;
    others = otherid;
  } 

  void display() {
    stroke(0,luminance); 
    strokeWeight(0.5);
    Px = new float[corners+1];
    Py = new float[corners+1];

    if (corners == 3){
      Px[0] = cx; Px[1] = cx+a/2; Px[2] = cx-a/2; Px[3] = cx; 
      Py[0] = cy+UR; Py[1] = cy-IR; Py[2] = cy-IR; Py[3] = cy+UR;
    }
    if (corners == 4){
      Px[0] = cx; Px[1] = cx+UR; Px[2] = cx; Px[3] = cx-UR; Px[4] = cx; 
      Py[0] = cy+UR; Py[1] = cy; Py[2] = cy-UR; Py[3] = cy; Py[4] = cy+UR;
    }
    if (corners == 5){
      Px[0] = cx; Px[1] = cx+sin(PI/2.5)*UR; Px[2] = cx+sin(PI/5)*UR; Px[3] = cx-sin(PI/5)*UR; Px[4] = cx-sin(PI/2.5)*UR; Px[5] = cx;
      Py[0] = cy+UR; Py[1] = cy+cos(PI/2.5)*UR; Py[2] =cy-IR; Py[3] = cy-IR; Py[4] = cy+cos(PI/2.5)*UR; Py[5] =cy+UR;
    }
    if (corners == 6){
      Px[0] = cx; Px[1] = cx+IR; Px[2] = cx+IR; Px[3] = cx; Px[4] = cx-IR; Px[5] = cx-IR; Px[6] = cx;
      Py[0] = cy+UR; Py[1] = cy+UR/2; Py[2] = cy-UR/2; Py[3] = cy-UR; Py[4] = cy-UR/2; Py[5] = cy+UR/2; Py[6] = cy+UR;
    }
    if (corners == 7){
      Px[0] = cx; Px[1] = cx+sin(PI/3.5)*UR; Px[2] = cx+cos(PI/14)*UR; Px[3] = cx+sin(PI/7)*UR; Px[4] = cx-sin(PI/7)*UR; Px[5] = cx-cos(PI/14)*UR; Px[6] = cx-sin(PI/3.5)*UR; Px[7] = cx;
      Py[0] = cy+UR; Py[1] = cy+cos(PI/3.5)*UR; Py[2] = cy-sin(PI/14)*UR; Py[3] = cy-IR; Py[4] = cy-IR; Py[5] = cy-sin(PI/14)*UR; Py[6] = cy+cos(PI/3.5)*UR; Py[7] = cy+UR;
    }
    if (corners == 8){
      Px[0] =cx; Px[1] = cx+sin(PI/4)*UR; Px[2] = cx+UR; Px[3] = cx+sin(PI/4)*UR; Px[4] = cx; Px[5] = cx-sin(PI/4)*UR; Px[6] = cx-UR; Px[7] = cx-sin(PI/4)*UR; Px[8] = cx;
      Py[0] = cy+UR; Py[1] = cy+cos(PI/4)*UR; Py[2] = cy; Py[3] = cy-cos(PI/4)*UR; Py[4] = cy-UR; Py[5] = cy-cos(PI/4)*UR; Py[6] = cy; Py[7] = cy+cos(PI/4)*UR; Py[8] = cy+UR;
    }
    if (corners == 9){
      Px[0] = cx; Px[1] = cx+sin(PI/4.5)*UR; Px[2] = cx+cos(PI/18)*UR; Px[3] = cx+cos(PI/6)*UR; Px[4] = cx+a/2; Px[5] = cx-a/2; Px[6] = cx-cos(PI/6)*UR; Px[7] = cx-cos(PI/18)*UR; Px[8] = cx-sin(PI/4.5)*UR; Px[9] = cx; Py[0] = cy+UR; 
      Py[1] = cy+cos(PI/4.5)*UR; Py[2] = cy+sin(PI/18)*UR; Py[3] = cy-sin(PI/6)*UR; Py[4] = cy-IR; Py[5] = cy-IR; Py[6] = cy-sin(PI/6)*UR; Py[7] = cy+sin(PI/18)*UR; Py[8] = cy+cos(PI/4.5)*UR; Py[9] = cy+UR;
    }
    if (corners == 10){
      Px[0] = cx; Px[1] = cx+sin(PI/5)*UR; Px[2] = cx+IR; Px[3] = cx+IR; Px[4] = cx+sin(PI/5)*UR; Px[5] = cx; Px[6] = cx-sin(PI/5)*UR; Px[7] = cx-IR; Px[8] = cx-IR; Px[9] = cx-sin(PI/5)*UR; Px[10] =cx;
      Py[0] = cy+UR; Py[1] = cy+cos(PI/5)*UR; Py[2] = cy+a/2; Py[3] = cy-a/2; Py[4] = cy-cos(PI/5)*UR; Py[5] = cy-UR; Py[6] = cy-cos(PI/5)*UR; Py[7] = cy-a/2; Py[8] = cy+a/2; Py[9] = cy+cos(PI/5)*UR; Py[10] = cy+UR;
    }
    a = UR*(2*sin(PI/corners));  
    IR = a/(2*tan(PI/corners)); 

    angle += (spr* vr);
    if ((vx*friction >0.05) || (vy*friction>0.05)){
      vx *= friction;
      vy *= friction;
    }
    if (vr < 50){
      xpos += (cos(angle+5))/5*vx;
      ypos += (sin(angle/3))/5*vy;
    }
    if (luminance < 3){ 
      xpos+=10;
      dead=1; 
    } else { dead=0;
    } if ((luminance > 3) && (xpos < width) && (xpos > 0) && (ypos < height) && (ypos > top)){
      alive=1;
    } else { alive=0;
  }
    pushMatrix();
    translate(xpos,ypos);
    rotate(angle);
    if (luminance > 3){
      if ((xpos > width - UR) || (xpos < 0 + UR)){
        vx = -vx;
        vr = -vr;
      } 
      if ((ypos > height- UR)  || (ypos < top + UR)){
        vy = -vy;
        vr = -vr;
      }
    }

    if ((luminance>3) && (vx < 0.5) && (vy < 0.5) && (vx > -0.5) && (vy > -0.5) && (xpos < width - UR) && (xpos > UR) && (ypos < height - UR) && (ypos > top + UR)){
      asleep=1;
    }else{asleep=0;}
    
    for (int i=0; i<corners;i++){
      beginShape();
      vertex(Px[i],Py[i]);
      bezierVertex(cx2,cy2,cx2,cy2,Px[i+1],Py[i+1]);
      endShape();
    }
    popMatrix();
  }

  void wobble(){
    cx2=random(cx-5,cx+5);
    cy2=random(cy-5,cy+5);
  }

  void attributes(){
    if (corners == 3) {UR = 15; }
    if (corners == 4) {UR = 17; }
    if (corners == 5) {UR = 19; }
    if (corners == 6) {UR = 21; }
    if (corners == 7) {UR = 23; }
    if (corners == 8) {UR = 25; }
    if (corners == 9) {UR = 27; }
    if (corners == 10){UR = 29; vr++; old=1;} else {vr=1.0; old=0; } 
  }

  void collide() {
    int number = int(scrollbar.getPos());
    for (int i = id +1; i < number; i++) {
      float dx = others[i].xpos - xpos;
      float dy = others[i].ypos - ypos;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].IR + IR;
      float angle = atan2(dy, dx);
      float targetX = xpos + cos(angle) * minDist;
      float targetY = ypos + sin(angle) * minDist;
      float ax = (targetX - others[i].xpos);
      float ay = (targetY - others[i].ypos);
      if ((distance < minDist) && (luminance > 3)) { 
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay; 
        stroke(144,13,22,200);
        ellipse(xpos+dx/2, ypos+dy/2,UR, UR);
        ellipse(xpos+dx/2, ypos+dy/2,UR+10,UR+10);
        ellipse(xpos+dx/2, ypos+dy/2,UR+30,UR+30);

        if ((corners == 3) && (others[i].corners == 4) && (corners < 10)){ others[i].corners =5; } 
        if ((corners == 3) && (others[i].corners == 5) && (corners < 10)){ others[i].corners =6; } 
        if ((corners == 3) && (others[i].corners == 6) && (corners < 10)){ others[i].corners =7; } 
        if ((corners == 3) && (others[i].corners == 7) && (corners < 10)){ others[i].corners =8; } 
        if ((corners == 3) && (others[i].corners == 8) && (corners < 10)){ others[i].corners =9; } 
        if ((corners == 3) && (others[i].corners == 9) && (corners < 10)){ others[i].corners =10; }
        if ((corners == 3) && (others[i].corners == 10))                 { corners = 4; others[i].corners =5; }
        if ((corners == 4) && (others[i].corners == 5) && (corners < 10)){ corners = 3; others[i].corners =6; }
        if ((corners == 4) && (others[i].corners == 6) && (corners < 10)){ corners = 3; others[i].corners =7; }
        if ((corners == 4) && (others[i].corners == 7) && (corners < 10)){ corners = 3; others[i].corners =8; }
        if ((corners == 4) && (others[i].corners == 8) && (corners < 10)){ corners = 3; others[i].corners =9; }
        if ((corners == 4) && (others[i].corners == 9) && (corners < 10)){ corners = 3; others[i].corners =10; }
        if ((corners == 5) && (others[i].corners == 6) && (corners < 10)){ corners = 4; others[i].corners =7; }
        if ((corners == 5) && (others[i].corners == 7) && (corners < 10)){ corners = 4; others[i].corners =8; }
        if ((corners == 5) && (others[i].corners == 8) && (corners < 10)){ corners = 4; others[i].corners =9; }
        if ((corners == 5) && (others[i].corners == 9) && (corners < 10)){ corners = 4; others[i].corners =10; }
        if ((corners == 5) && (others[i].corners == 10))                 { corners = 6; others[i].corners =3; } 
        if ((corners == 6) && (others[i].corners == 6) && (corners < 10)){corners = 4; others[i].corners =8; }        
        if ((corners == 6) && (others[i].corners == 7) && (corners < 10)){ corners = 5; others[i].corners =8; } 
        if ((corners == 6) && (others[i].corners == 8) && (corners < 10)){ corners = 5; others[i].corners =9; }
        if ((corners == 6) && (others[i].corners == 9) && (corners < 10)){ corners = 5; others[i].corners =10; }               
        if ((corners == 7) && (others[i].corners == 8) && (corners < 10)){ corners = 6; others[i].corners =9; } 
        if ((corners == 7) && (others[i].corners == 9) && (corners < 10)){ corners = 6; others[i].corners =10; }
        if ((corners == 7) && (others[i].corners == 10))                 { corners = 8; others[i].corners =3; } 
        if ((corners == 8) && (others[i].corners == 9) && (corners < 10)){ corners = 7; others[i].corners =10; }       
        if ((corners == 9) && (others[i].corners == 10))                 { corners = 9; others[i].corners =3; }                           
        if (corners == 3)                                                { luminance -=10; } else { luminance=180; }
      }
    }
  }

  void food(){
    if ((luminance > 3) && (corners < 10)){
      for (int i = id; i < numCells; i++) {
        float tx = mouseX;
        float ty = mouseY;
        float dx=tx-xpos;
        float dy=ty-ypos;
        float minDist = IR;
        if (on==true){
          xpos+=dx*easing;
          ypos+=dy*easing;
          float distx = others[i].xpos - mouseX;
          float disty = others[i].ypos - mouseY;
          float distance = sqrt(distx*distx + disty*disty);

          if ((distance <= minDist) && (corners < 10)){ 
            corners+=1;
          }
        }     
        if ((abs(dx)<=minDist) && (abs(dy)<=minDist)){
          on=false;
        }
      }
    }
  }
  void press(){
    on=true;
  }

}





