
void setup(){
  size (500,500);
  background (255);
  smooth();
}

void draw () {
  splatter ();
  erase();
}


void splatter ()
{
  smooth();

  //variables for splat (main splatter body)
  float splatSize = random (25,75);
  int splatX = mouseX;
  int splatY = mouseY;
  float x = splatX;
  float y = splatY;

  //variables for splick (smaller drops)
  float splickSize = random (1,15);
  float splickX = splatX + random (-50,75);
  float splickY = splatY + random (-50,75);

  //variables for splatter trail
  float r = splatSize/2;
  float vx1 = splatX-random(r,25); //x-15; 
  float vx2 = splatX+(random(r,25)); //x+12;
  float vy2 = splatY+random(100,225);//y+225;
  float vx3 = splatX+r-15; //x+ 21;
  float vy3 = splatY+random(-11,10);//y-11;
  float cx3 = vx2+10; //x+22;
  float cy3= vy2;//y+225;

  //variables for splatter spikes

  float tx1= splatX+random(-r,25);
  float ty1= splatY+random(25);
  float tx2= tx1-15;
  float ty2= ty1+15;
  float tx3= splatX+r;
  float ty3= splatY+r;



  if (mousePressed == true) {
    fill (0);
    //splat
    ellipse(splatX,splatY,splatSize,splatSize);

    //splick
    ellipse (splickX,splickY,splickSize,splickSize);
    // Why is it creating more than one splick?

    //splatter trail
    beginShape();
    vertex (vx1,splatY+14);
    bezierVertex (splatX,splatY+35,splatX+25,splatY+38,vx2,vy2);
    bezierVertex (cx3,cy3,splatX+25,splatY+300,vx3,vy3);
    endShape();

    //splatter spikes

    triangle(tx1,ty1,tx2,ty2,tx3,ty3);
    triangle(tx1,ty1,tx2,ty2,tx3,ty3);

  }
}

void erase () {
  //how to recognize the delete key?
  if (keyPressed == true){
    if (key == 'e') {
      noStroke();
      fill (255);
      rect(0,0,500,500);
    }
  }
}





