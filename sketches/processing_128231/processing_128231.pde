
// Talk to Him_ Final Project
// a program to draw dust and clean after
// suhsiupai@gmail.com

PImage img;
int _num = 600;     
Circle[] _circleArr = {
}; 

import ddf.minim.*;

Minim minim;
AudioInput in;


void setup() {
  size(1000, 650);
  
  
  
  img = loadImage("22-1.jpg");
  image(img, 0, 0, width, height);

  minim = new Minim(this);
  in = minim.getLineIn();

  strokeWeight(1);
  fill(150, 50);
  //drawCircles();
  
   //"Marriage: Love is the reason.  Lifelong friendship is the gift.  Kindness is the cause.  Til' death do us part is the length." -Fawn Weaver
 textSize(30);
 textFont(createFont("Centaur",20));
 fill(50);
 text("“Summer afternoon—summer afternoon; to me those have always been",width/2-250,height/4-30);

 text(" the two most beautiful words in the English language.”  ",width/2-250,height/4);
 //text("If you want them to be more intelligent, ",width/2,height/4 + 25);
// text("read them more fairy tales.",width/2,height/4 + 50);
 
 textSize(20);
 fill(50);
 text("-Henry James",width/2 + 140,height/4 + 100);
  
}

void draw() {   
    float alph; 
  
  //background(255);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
   drawCircles();
  
  


  //stroke(255, 20);
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
   alph = random(200,255);
   stroke(255,alph);
   line(i, 30 + in.left.get(i)*50, i+1, 30 + in.left.get(i+1)*50);
   line(i, 30 + in.right.get(i)*50, i+1, 30 + in.right.get(i+1)*50);
   
  }
}







 


/*
void drawImage() {
  for (int i = 0; i < in.bufferSize() - 1; i++) {
    if (i>0) { 
      //ellipse(50,50,50,50);
      image(img, 0, 0, width, height);
      tint(255, 26);
    }
  }
}
*/



void mouseReleased() {
 
  tint(255, 60);
  image(img, 0, 0, width, height);
  
  //"Marriage: Love is the reason.  Lifelong friendship is the gift.  Kindness is the cause.  Til' death do us part is the length." -Fawn Weaver
 textSize(30);
 textFont(createFont("Centaur",20));
 fill(50);
 text("“Summer afternoon—summer afternoon; to me those have always been",width/2-250,height/4-30);

 text(" the two most beautiful words in the English language.”  ",width/2-250,height/4);
 //text("If you want them to be more intelligent, ",width/2,height/4 + 25);
// text("read them more fairy tales.",width/2,height/4 + 50);
 
 textSize(20);
 fill(50);
 text("-Henry James",width/2 + 140,height/4 + 100);
  
  
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}


class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  //float xmove, ymove;


  Circle() {
    x = random(width);
    y = random(height);
    radius = random(1);
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);

    //  xmove = random(10) - 5;
    //  ymove = random(10) - 5;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    //stroke(linecol, 150);
    fill(150, alph);
    ellipse(x, y, 1, 1);
  }

  void updateMe() {
    //  x += xmove;
    //   y += ymove;



    drawMe();
  }
}



