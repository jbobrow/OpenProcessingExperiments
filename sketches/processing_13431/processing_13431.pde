
int Leye=220;
int Reye=420;
int eyeH= 193;
color bg=color(64,64,65);
color g1=color(112,137,35);
color g2=color(130,157,50);
color g3=color(147,177,64);
color g4=color(154,182,75);
color g5=color(161,187,87);
color g6=color(168,192,98);
color g7=color(175,197,110);
color g8=color(182,202,121);
color b1=color(73,73,74);
color b2=color(81,81,82);
color b3= color(90,90,91);
color b4=color(99,99,99);
color b5=color(107,107,108);
color b6=color(116,116,116);
color b7=color(124,124,125);
color b8=color(133,133,133);
PImage skin;
float dl;
float dr;


void setup()
{
  size(640,480);
  smooth();
  skin=loadImage("eye.png");
}


void draw()
{
  background(bg);
//  //  float Lx=constrain(mouseX,204,235);
//  //  float Ly=constrain(mouseY,177,208);
//  //  float Rx=constrain(mouseX,404,435);
//  //  float Ry=constrain(mouseX,177,208);
  if(mousePressed==true)
  {//static left eye
  noStroke();
  fill(b1);
  ellipse(Leye, eyeH, 146,146);
  fill(b2);
  ellipse(Leye,eyeH, 130,130);
  fill(b3);
  ellipse(Leye,eyeH,114,114);

  //static right eye
  noStroke();
  fill(b1);
  ellipse(Reye, eyeH, 146,146);
  fill(b2);
  ellipse(Reye,eyeH, 130,130);
  fill(b3);
  ellipse(Reye,eyeH,114,114);

  //texture
 image(skin,147,119);
 tint(255,75);
 image(skin,348,119);
 tint(255,75);
 
  

  if (mouseX<220)
  {
    //left pupil moving
    noStroke();
    dl= dist(mouseX,mouseY,Leye, eyeH);
    float d= dist(mouseX,mouseY,Leye,eyeH);
    d= constrain(d,0,20);
    float a=atan2(mouseY-eyeH,mouseX-Leye);
    float Lx=Leye + cos(a)*d;
    float Ly= eyeH + sin(a)*d;
    fill(b4);
    ellipse(Lx,Ly,84,84);
    fill(b5);
    ellipse(Lx,Ly,64,64);
    fill(b6);
    ellipse(Lx,Ly,56,56);
    fill(b7);
    ellipse(Lx,Ly,50,50);
    fill(b8);
    ellipse(Lx,Ly,38,38);
    fill(0);
    ellipse(Lx,Ly,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Lx,Ly,22,22);

    //right pupil moving
    noStroke();
    float dr= dist(mouseX,mouseY,Reye,eyeH);
    dr= constrain(d,0,20);
    float ar=atan2(mouseX-eyeH,mouseY-Reye);
    float Rx=Reye + cos(ar)*d;
    float Ry= eyeH + sin(ar)*d;
    fill(b4);
    ellipse(Rx,Ry,84,84);
    fill(b5);
    ellipse(Rx,Ry,64,64);
    fill(b6);
    ellipse(Rx,Ry,56,56);
    fill(b7);
    ellipse(Rx,Ry,50,50);
    fill(b8);
    ellipse(Rx,Ry,38,38);
    fill(0);
    ellipse(Rx,Ry,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Rx,Ry,22,22);
  }
  if(mouseX>420)
  {//left pupil moving
    noStroke();
    float d= dist(mouseX,mouseY,Leye,eyeH);
    d= constrain(d,0,20);
    float a=atan2(mouseX-eyeH,mouseY-Leye);
    float Lx=Leye + cos(a)*d;
    float Ly= eyeH + sin(a)*d;
    fill(b4);
    ellipse(Lx,Ly,84,84);
    fill(b5);
    ellipse(Lx,Ly,64,64);
    fill(b6);
    ellipse(Lx,Ly,56,56);
    fill(b7);
    ellipse(Lx,Ly,50,50);
    fill(b8);
    ellipse(Lx,Ly,38,38);
    fill(0);
    ellipse(Lx,Ly,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Lx,Ly,22,22);

    //right pupil moving
    noStroke();
    float dr= dist(mouseX,mouseY,Reye,eyeH);
    dr= constrain(d,0,20);
    float ar=atan2(mouseY-eyeH,mouseX-Reye);
    float Rx=Reye + cos(ar)*d;
    float Ry= eyeH + sin(ar)*d;
    fill(b4);
    ellipse(Rx,Ry,84,84);
    fill(b5);
    ellipse(Rx,Ry,64,64);
    fill(b6);
    ellipse(Rx,Ry,56,56);
    fill(b7);
    ellipse(Rx,Ry,50,50);
    fill(b8);
    ellipse(Rx,Ry,38,38);
    fill(0);
    ellipse(Rx,Ry,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Rx,Ry,22,22);
  }
  if(mouseX<=420 & mouseX>=220 & mouseY<=293 & mouseY>=93)
  {
    //left pupil moving
    noStroke();
    float d= dist(mouseX,mouseY,Leye,eyeH);
    d= constrain(d,0,20);
    float a=atan2(mouseY-eyeH,mouseX-Leye);
    float Lx=Leye + cos(a)*d;
    float Ly= eyeH + sin(a)*d;
    fill(b4);
    ellipse(Lx,Ly,84,84);
    fill(b5);
    ellipse(Lx,Ly,64,64);
    fill(b6);
    ellipse(Lx,Ly,56,56);
    fill(b7);
    ellipse(Lx,Ly,50,50);
    fill(b8);
    ellipse(Lx,Ly,38,38);
    fill(0);
    ellipse(Lx,Ly,60,60);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Lx,Ly,44,44);

    //right pupil moving
    noStroke();
    float dr= dist(mouseX,mouseY,Reye,eyeH);
    dr= constrain(d,0,20);
    float ar=atan2(mouseY-eyeH,mouseX-Reye);
    float Rx=Reye + cos(ar)*d;
    float Ry= eyeH + sin(ar)*d;
    fill(b4);
    ellipse(Rx,Ry,84,84);
    fill(b5);
    ellipse(Rx,Ry,64,64);
    fill(b6);
    ellipse(Rx,Ry,56,56);
    fill(b7);
    ellipse(Rx,Ry,50,50);
    fill(b8);
    ellipse(Rx,Ry,38,38);
    fill(0);
    ellipse(Rx,Ry,60,60);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Rx,Ry,44,44);
  }
   if(mouseX<=420 & mouseX>=220 & mouseY>293 || mouseX<=420 & mouseX>=220 & mouseY<93)
  {
      noStroke();
    float d= dist(mouseX,mouseY,Leye,eyeH);
    d= constrain(d,0,20);
    float a=atan2(mouseY-eyeH,mouseX-Leye);
    float Lx=Leye + cos(a)*d;
    float Ly= eyeH + sin(a)*d;
    fill(b4);
    ellipse(Lx,Ly,84,84);
    fill(b5);
    ellipse(Lx,Ly,64,64);
    fill(b6);
    ellipse(Lx,Ly,56,56);
    fill(b7);
    ellipse(Lx,Ly,50,50);
    fill(b8);
    ellipse(Lx,Ly,38,38);
    fill(0);
    ellipse(Lx,Ly,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Lx,Ly,22,22);

    //right pupil moving
    noStroke();
    float dr= dist(mouseX,mouseY,Reye,eyeH);
    dr= constrain(d,0,20);
    float ar=atan2(mouseY-eyeH,mouseX-Reye);
    float Rx=Reye + cos(ar)*d;
    float Ry= eyeH + sin(ar)*d;
    fill(b4);
    ellipse(Rx,Ry,84,84);
    fill(b5);
    ellipse(Rx,Ry,64,64);
    fill(b6);
    ellipse(Rx,Ry,56,56);
    fill(b7);
    ellipse(Rx,Ry,50,50);
    fill(b8);
    ellipse(Rx,Ry,38,38);
    fill(0);
    ellipse(Rx,Ry,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Rx,Ry,22,22);}
}
    else{
  //static left eye
  noStroke();
  fill(g1);
  ellipse(Leye, eyeH, 146,146);
  fill(g2);
  ellipse(Leye,eyeH, 130,130);
  fill(g3);
  ellipse(Leye,eyeH,114,114);

  //static right eye
  noStroke();
  fill(g1);
  ellipse(Reye, eyeH, 146,146);
  fill(g2);
  ellipse(Reye,eyeH, 130,130);
  fill(g3);
  ellipse(Reye,eyeH,114,114);

  //texture
 image(skin,147,119);
 tint(255,75);
 image(skin,348,119);
 tint(255,75);
 

  if (mouseX<220)
  {
    //left pupil moving
    noStroke();
    float d= dist(mouseX,mouseY,Leye,eyeH);
    d= constrain(d,0,20);
    float a=atan2(mouseY-eyeH,mouseX-Leye);
    float Lx=Leye + cos(a)*d;
    float Ly= eyeH + sin(a)*d;
    fill(g4);
    ellipse(Lx,Ly,84,84);
    fill(g5);
    ellipse(Lx,Ly,64,64);
    fill(g6);
    ellipse(Lx,Ly,56,56);
    fill(g7);
    ellipse(Lx,Ly,50,50);
    fill(g8);
    ellipse(Lx,Ly,38,38);
    fill(0);
    ellipse(Lx,Ly,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Lx,Ly,22,22);

    //right pupil moving
    noStroke();
    float dr= dist(mouseX,mouseY,Reye,eyeH);
    dr= constrain(d,0,20);
    float ar=atan2(mouseX-eyeH,mouseY-Reye);
    float Rx=Reye + cos(ar)*d;
    float Ry= eyeH + sin(ar)*d;
    fill(g4);
    ellipse(Rx,Ry,84,84);
    fill(g5);
    ellipse(Rx,Ry,64,64);
    fill(g6);
    ellipse(Rx,Ry,56,56);
    fill(g7);
    ellipse(Rx,Ry,50,50);
    fill(g8);
    ellipse(Rx,Ry,38,38);
    fill(0);
    ellipse(Rx,Ry,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Rx,Ry,22,22);
  }
  if(mouseX>420)
  {//left pupil moving
    noStroke();
    float d= dist(mouseX,mouseY,Leye,eyeH);
    d= constrain(d,0,20);
    float a=atan2(mouseX-eyeH,mouseY-Leye);
    float Lx=Leye + cos(a)*d;
    float Ly= eyeH + sin(a)*d;
    fill(g4);
    ellipse(Lx,Ly,84,84);
    fill(g5);
    ellipse(Lx,Ly,64,64);
    fill(g6);
    ellipse(Lx,Ly,56,56);
    fill(g7);
    ellipse(Lx,Ly,50,50);
    fill(g8);
    ellipse(Lx,Ly,38,38);
    fill(0);
    ellipse(Lx,Ly,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Lx,Ly,22,22);

    //right pupil moving
    noStroke();
    float dr= dist(mouseX,mouseY,Reye,eyeH);
    dr= constrain(d,0,20);
    float ar=atan2(mouseY-eyeH,mouseX-Reye);
    float Rx=Reye + cos(ar)*d;
    float Ry= eyeH + sin(ar)*d;
    fill(g4);
    ellipse(Rx,Ry,84,84);
    fill(g5);
    ellipse(Rx,Ry,64,64);
    fill(g6);
    ellipse(Rx,Ry,56,56);
    fill(g7);
    ellipse(Rx,Ry,50,50);
    fill(g8);
    ellipse(Rx,Ry,38,38);
    fill(0);
    ellipse(Rx,Ry,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Rx,Ry,22,22);
  }
  if(mouseX<=420 & mouseX>=220 & mouseY<=293 & mouseY>=93)
  {
    //left pupil moving
    noStroke();
    float d= dist(mouseX,mouseY,Leye,eyeH);
    d= constrain(d,0,20);
    float a=atan2(mouseY-eyeH,mouseX-Leye);
    float Lx=Leye + cos(a)*d;
    float Ly= eyeH + sin(a)*d;
    fill(g4);
    ellipse(Lx,Ly,84,84);
    fill(g5);
    ellipse(Lx,Ly,64,64);
    fill(g6);
    ellipse(Lx,Ly,56,56);
    fill(g7);
    ellipse(Lx,Ly,50,50);
    fill(g8);
    ellipse(Lx,Ly,38,38);
    fill(0);
    ellipse(Lx,Ly,60,60);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Lx,Ly,44,44);

    //right pupil moving
    noStroke();
    float dr= dist(mouseX,mouseY,Reye,eyeH);
    dr= constrain(d,0,20);
    float ar=atan2(mouseY-eyeH,mouseX-Reye);
    float Rx=Reye + cos(ar)*d;
    float Ry= eyeH + sin(ar)*d;
    fill(g4);
    ellipse(Rx,Ry,84,84);
    fill(g5);
    ellipse(Rx,Ry,64,64);
    fill(g6);
    ellipse(Rx,Ry,56,56);
    fill(g7);
    ellipse(Rx,Ry,50,50);
    fill(g8);
    ellipse(Rx,Ry,38,38);
    fill(0);
    ellipse(Rx,Ry,60,60);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Rx,Ry,44,44);
  }
  if(mouseX<=420 & mouseX>=220 & mouseY>293 || mouseX<=420 & mouseX>=220 & mouseY<93)
  {
      noStroke();
    float d= dist(mouseX,mouseY,Leye,eyeH);
    d= constrain(d,0,20);
    float a=atan2(mouseY-eyeH,mouseX-Leye);
    float Lx=Leye + cos(a)*d;
    float Ly= eyeH + sin(a)*d;
    fill(g4);
    ellipse(Lx,Ly,84,84);
    fill(g5);
    ellipse(Lx,Ly,64,64);
    fill(g6);
    ellipse(Lx,Ly,56,56);
    fill(g7);
    ellipse(Lx,Ly,50,50);
    fill(g8);
    ellipse(Lx,Ly,38,38);
    fill(0);
    ellipse(Lx,Ly,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Lx,Ly,22,22);

    //right pupil moving
    noStroke();
    float dr= dist(mouseX,mouseY,Reye,eyeH);
    dr= constrain(d,0,20);
    float ar=atan2(mouseY-eyeH,mouseX-Reye);
    float Rx=Reye + cos(ar)*d;
    float Ry= eyeH + sin(ar)*d;
    fill(g4);
    ellipse(Rx,Ry,84,84);
    fill(g5);
    ellipse(Rx,Ry,64,64);
    fill(g6);
    ellipse(Rx,Ry,56,56);
    fill(g7);
    ellipse(Rx,Ry,50,50);
    fill(g8);
    ellipse(Rx,Ry,38,38);
    fill(0);
    ellipse(Rx,Ry,30,30);
    strokeWeight(2);
    stroke(g8,75);
    ellipse(Rx,Ry,22,22);
    
}
    }

  
}






