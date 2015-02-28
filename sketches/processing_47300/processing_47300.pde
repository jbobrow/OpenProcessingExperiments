
PImage img1, mole, mouse, mouse2;
float s = 70;
float mS = 70;
float hS = 105;
float hS2 = 105;
float f1 = 0;
float f2 = 0;
float f3 = 0;
float f4 = 0;
float f5 = 0;
float f6 = 0;
float f7 = 0;
float f8 = 0;
float f9 = 0;
float f10 = 0;
float f11 = 0;
float f12 = 0;
float f13 = 0;
float f14 = 0;
float f15 = 0;
float f16 = 0;
float sp1 = 10;
float sp2 = 12;
float sp3 = 14;
float sp4 = 16;
float sp5 = 10;
float sp6 = 12;
float sp7 = 14;
float sp8 = 16;
float sp9 = 10;
float sp10 = 12;
float sp11 = 14;
float sp12 = 16;
float sp13 = 10;
float sp14 = 12;
float sp15 = 14;
int count = 0;
  
void setup() {
  size(400, 400);
  background(0);
  smooth();
  frameRate(10);
  img1 = loadImage("back.jpg"); 
  mole = loadImage("mole.gif");  
  mouse = loadImage("ham.gif");  
  mouse2 = loadImage("ham2.gif");    
  noStroke();
  fill(0);
}
  
void draw() {
  count++;
    image(img1, 0, 0, 400, 400); 
    for (int x = 65; x < 400; x+=90){
      for (int y = 65; y < 400; y+=90){
      fill(0);
      ellipse(x,y,s,s); 
      pushMatrix();
      translate(-(mS/2),-(mS/2));    
      image(mole,x,y,mS,mS); 
      popMatrix();
    }
    }
    fill(0,f1);
    ellipse(65,65,s,s);
    fill(0,f2);
    ellipse(65,155,s,s);
    fill(0,f3);
    ellipse(65,245,s,s);
    fill(0,f4);
    ellipse(65,335,s,s);
    fill(0,f5);
    ellipse(155,65,s,s);
    fill(0,f6);
    ellipse(245,65,s,s);
    fill(0,f7);
    ellipse(335,65,s,s);
    fill(0,f8);
    ellipse(155,155,s,s);
    fill(0,f9);
    ellipse(155,245,s,s);
    fill(0,f10);
    ellipse(155,335,s,s);
    fill(0,f11);
    ellipse(245,155,s,s);
    fill(0,f12);
    ellipse(245,245,s,s);
    fill(0,f13);
    ellipse(245,335,s,s);
    fill(0,f14);
    ellipse(335,155,s,s);
    fill(0,f15);
    ellipse(335,245,s,s);
    fill(0,f16);
    ellipse(335,335,s,s);
    f1+=sp1;
    f2+=sp4;
    f3+=sp3;
    f4+=sp2;
    f5+=sp4;
    f6+=sp1;
    f7+=sp2;
    f8+=sp3;
    f9+=sp2;
    f10+=sp1;
    f11+=sp2;
    f12+=sp4;
    f13+=sp1;
    f14+=sp3;
    f15+=sp2;
    f16+=sp4; 
  
  if (count >20){  //Cue the next leaf, load it, begin to shrink it
     fill(0,f10);
     ellipse(155,335,s,s);
     f10-=2*sp1;
  }
  if (f10 < 10){ //if leaf size hits a certain size, stop it
     sp1=0;
     f10=250;
  } 
  if (count>25){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f14);
    ellipse(335,155,s,s);
    f14-=2*sp2;
  }
  if (f14 < 10){ //if leaf size hits a certain size, stop it
     sp2=0;
     f14=250;
  }   
  if (count >30){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f8);
    ellipse(155,155,s,s);
     f8-=2*sp15;
  }
  if (f8 < 10){ //if leaf size hits a certain size, stop it
     sp15=0;
     f8=250;
  } 
  
  if (count>40){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f3);
    ellipse(65,245,s,s);
    f3-=2*sp3;
  }
  if (f3 < 10){ //if leaf size hits a certain size, stop it
     sp3=0;
     f3=250;
  }  
    if (count >50){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f1);
    ellipse(65,65,s,s);
     f1-=2*sp4;
  }
  if (f1 < 10){ //if leaf size hits a certain size, stop it
     sp4=0;
     f1=250;
  } 
  if (count>60){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f11);
    ellipse(245,155,s,s);
    f11-=2*sp5;
  }
  if (f11 < 10){ //if leaf size hits a certain size, stop it
     sp5=0;
     f11=250;
  }   
  if (count >70){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f5);
    ellipse(155,65,s,s);
     f5-=2*sp6;
  }
  if (f5 < 10){ //if leaf size hits a certain size, stop it
     sp6=0;
     f5=250;
  } 
 
  if (count>80){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f12);
    ellipse(245,335,s,s);
    f12-=2*sp7;
  }
  if (f12 < 10){ //if leaf size hits a certain size, stop it
     sp7=0;
     f12=250;
  }  
  
    if (count >90){  //Cue the next leaf, load it, begin to shrink it
     fill(0,f2);
     ellipse(155,335,s,s);
     f2-=2*sp8;
  }
  if (f2 < 10){ //if leaf size hits a certain size, stop it
     sp8=0;
     f2=250;
  } 
  if (count>100){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f4);
    ellipse(335,155,s,s);
    f4-=2*sp9;
  }
  if (f4 < 10){ //if leaf size hits a certain size, stop it
     sp9=0;
     f4=250;
  }   
  if (count >110){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f7);
    ellipse(155,155,s,s);
     f7-=2*sp10;
  }
  if (f7 < 10){ //if leaf size hits a certain size, stop it
     sp10=0;
     f7=250;
  } 
  
  if (count>120){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f15);
    ellipse(335,245,s,s);
    f15-=2*sp11;
  }
  if (f15 < 10){ //if leaf size hits a certain size, stop it
     sp11=0;
     f15=250;
  }  
    if (count >130){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f9);
    ellipse(155,245,s,s);
     f9-=2*sp12;
  }
  if (f9 < 10){ //if leaf size hits a certain size, stop it
     sp12=0;
     f9=250;
  } 
  if (count>140){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f6);
    ellipse(245,65,s,s);
    f6-=2*sp13;
  }
  if (f6 < 10){ //if leaf size hits a certain size, stop it
     sp13=0;
     f6=250;
  }   
  if (count >150){  //Cue the next leaf, load it, begin to shrink it
    fill(0,f14);
    ellipse(335,155,s,s);
     f14-=2*sp14;
  }
  if (f14 < 10){ //if leaf size hits a certain size, stop it
     sp14=0;
     f14=250;
  } 
    pushMatrix();
    if (mousePressed == true){
    translate(-(hS2/2),-(hS2/2));
    hS=0;
    image(mouse2,mouseX,mouseY,hS2,hS2);
    }
    else{   
    hS=105;
    translate(-(hS/2),-(hS/2));
    image(mouse,mouseX,mouseY,hS,hS);
    }
    popMatrix();
    
    
}  



