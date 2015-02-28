
/*
void Back_ground() {
  
  noStroke();
  int moonX = int(random(40, 900));
  int moonY = int(random(50, 420));  
  int cr = int(random(225, 240));
  int cg = int(random(200, 230));
  int cb = int(random(20, 20));
  /*
  // randomizing star coordinates
  int sx = int(random(0, 950));
  int sy = int(random(0, 450));
  */
  // stars  
  /*
  stroke(255);  
  for (int i = 0 ; i < 150; i = i + 1) {
    sx = int(random(0, 950));
    sy = int(random(0, 450));
    line(sx, sy, sx, sy);
  }

  // moon
  fill(180);
  stroke(200);
  
  ellipse(moonX, moonY, 70, 70);
  noStroke();
  fill(35, 30, 70);
  ellipse(moonX + 20, moonY, 60, 60);

  // water  
  
  
  stroke(0);
  
  fill(30, 60, 120);
  rect(0, 475, 9000, 600);  

pushMatrix();
translate (0,0,-100);
  // START OF HOUSE

  fill(140);   
  // side bits
  rect(250, 430, 50, 70);
  rect(650, 430, 50, 70);
  // side bits perspective
  fill(110);  
  beginShape();
  vertex(250, 430);  
  vertex(300, 405);
  vertex(650, 405);
  vertex(700, 430);
  endShape();  

  // rectangle   
  fill(150);  
  rect(300, 400, 350, 400);

  // roof
  fill(140);   
  beginShape();
  vertex(300, 400);
  vertex(470, 310);
  vertex(650, 400);
  endShape(); 

  // windows  
  fill(cr, cg, cb);
  beginShape();
  vertex(385, 450);
  vertex(350, 401);
  vertex(593, 401);
  vertex(558, 450);
  vertex(385, 450);
  endShape();
  
  line(384, 450, 384, 401);
  line(559, 450, 559, 401);
  line(363, 418, 580, 418);

  // main triangle
  fill(120); 
    
  beginShape();  
  vertex(350, 500);
  vertex(470, 310);
  vertex(590, 500);
  vertex(350, 500);
  endShape(); 

  // roof
  fill(120);   
  beginShape();
  vertex(300, 400);
  vertex(470, 310);
  vertex(650, 400);
  endShape(); 

  // details  
  fill(150);  
  beginShape();
  vertex(400, 500);
  vertex(540, 500);
  vertex(470, 370);
  vertex(400, 500);
  endShape();

  // slope/stairs 
  beginShape();
  vertex(150, 550);
  vertex(250, 500);
  vertex(700, 500);
  vertex(800, 550);
  endShape();
  fill(#9B5513);

  // door
  beginShape();  
  vertex(440, 500);
  //vertex(440, 450);
  vertex(470, 430);  
  //vertex(500, 450);
  vertex(500, 500);  
  vertex(440, 500);
  endShape(); 
    
   
  fill(#DED719);
  beginShape();
  vertex(475, 480);
  vertex(485, 480);
  vertex(480, 470);
  vertex(475, 480);
  endShape();
popMatrix();
  // END OF HOUSE

  /*
  // hills    
  fill(60, 90, 50);  
  ellipse(430 + 950, 730, 2000, 400);
    
  fill(70, 120, 50);
  ellipse(430 + 950, 750, 2000, 400);
  fill(80, 150, 50);
  ellipse(430 + 950, 770, 2000, 400);  
  fill(90, 180, 50);  
  ellipse(430 + 950, 760, 2000, 310);

  // hills    
  fill(60, 90, 50);  
  strokeWeight(0); 
  ellipse(430 + 950, 730, 2000, 400);
  strokeWeight(0); 
  ellipse(430, 730, 2000, 400);
  strokeWeight(0);  
  fill(70, 120, 50);
  ellipse(430 + 950, 750, 2000, 400);
  strokeWeight(0); 
  ellipse(430, 750, 2000, 400);
  strokeWeight(0); 
  fill(80, 150, 50);
  ellipse(430 + 950, 770, 2000, 400);  
  strokeWeight(0); 
  ellipse(430, 770, 2000, 400);  
  strokeWeight(0); 
  fill(90, 180, 50);  
  ellipse(430 + 950, 760, 2000, 310);
  strokeWeight(0); 
  ellipse(430, 760, 2000, 310);
  
  // path
  fill(120); 
  
  beginShape();
  vertex(500, 552);
  vertex(521, 655);  
  vertex(412, 660);
  vertex(442, 550);
  endShape();

  // road
  fill(120);  
  ellipse(430, 760, 2000, 215);
  fill(90, 180, 50);  
  ellipse(430, 820, 2000, 215);

  // bushes
    

  // left bush
  fill(#1E9316);
  ellipse(200, 530, 30, 30);     
  ellipse(210, 525, 30, 30);    
  ellipse(220, 530, 30, 30);  
  ellipse(225, 520, 20, 20);  
  ellipse(237, 530, 27, 30);

  // right bush
  ellipse(720, 530, 30, 30);    
  ellipse(730, 525, 20, 30);  
  ellipse(740, 530, 30, 30);  
  ellipse(745, 520, 20, 20);  
  ellipse(757, 530, 27, 30);

  // TREES

  // left tree 
  
  fill(#814F0D);
  beginShape();
  vertex(130, 550);
  vertex(100, 550);  
  vertex(108, 460);
  vertex(121, 460);
  vertex(130, 550);
  endShape();
  fill(#1E9316);
      
  ellipse(113, 443, 30, 35); 
  ellipse(132, 450, 40, 40); 
  ellipse(100, 450, 30, 30);  
  ellipse(100, 467, 40, 40);  
  ellipse(120, 450, 40, 40); 
  ellipse(122, 477, 30, 30); 
  ellipse(136, 462, 30, 30); 

  // right tree
  
  fill(#814F0D);
  beginShape();
  vertex(820, 550);
  vertex(850, 550);  
  vertex(842, 460);
  vertex(831, 460);
  vertex(820, 550);
  endShape();
  fill(#1E9316);
      
  ellipse(833, 443, 30, 35); 
  ellipse(852, 450, 40, 40); 
  ellipse(820, 450, 30, 30);  
  ellipse(820, 467, 40, 40);  
  ellipse(840, 450, 40, 40); 
  ellipse(842, 477, 30, 30); 
  ellipse(856, 462, 30, 30); 

    fill(255);
    stroke(0);
    stroke (0);
    if (x<1000) { 
      for (int i = 0; i < 4; i++)
        backnum[i]=false;
      backnum[1]=true;
    }
  if (x>1000 && x < 2000) {
    for (int i = 0; i < 4; i++)
      backnum[i]=false;
    backnum[2]=true;
  }
  if (x>2000 && x < 3000) {
    for (int i = 0; i < 4; i++)
      backnum[i]=false;
    backnum[3]=true;
  }
  if (backnum[1]) 
    if (x<a || a != 0) 
      a-=10;

  if (backnum[2]) 
    if (x>a && a != 1000) 
      a+=10;
    else if (x<2000 && a != 1000) 
      a-=10;

  if (backnum[3]) 
    if (x>a && a != 2000)
      a+=10;

  camera ((width/2.0)+a, height/2.0, (height/2.0) / tan(PI*60.0 / 360.0), (width/2.0)+a, height/2.0, 0, 0, 1, 0);
}
*/
void Back_ground() {
 
  fill(255);
  stroke(0);
  stroke (0);/*
  if (x<1000) { 
    for (int i = 0; i < 4; i++)
      backnum[i]=false;
    backnum[1]=true;
  }
  if (x>1000 && x < 2000) {
    for (int i = 0; i < 4; i++)
      backnum[i]=false;
    backnum[2]=true;
  }
  if (x>2000 && x < 3000) {
    for (int i = 0; i < 4; i++)
      backnum[i]=false;
    backnum[3]=true;
  }
  if (backnum[1]) 
    if (x<a || a != 0) 
      a-=10;

  if (backnum[2]) 
    if (x>a && a != 1000) 
      a+=10;
    else if (x<2000 && a != 1000) 
      a-=10;

  if (backnum[3]) 
    if (x>a && a != 2000)
      a+=10;
      */
      
 background (200);
 int xcamlim = a+(x)+mouseX/5;
 if (xcamlim > 1000){xcamlim=1000;}
 if (xcamlim < 350){xcamlim=350;}
 // camera (camx,camz,camz,
  //camera (a+(x)+mouseX/5, (height/2.0)+50+(y/2)-150, (height/2.0) / tan(PI*60.0 / 360.0)-200, a+(x)+mouseX/5, (height/2.0)+50+(y/2)-150, 0-200, 0, 1, 0);
camera (xcamlim, (height/2.0)+200+(y/5)-200, (height/2.0) / tan(PI*60.0 / 360.0)-200, xcamlim, (height/2.0)+200+(y/5)-200, 0-200, 0, 1, 0);

 }


