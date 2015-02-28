
float theta, s, low, high, br, col, drop, control, thick, test;
int cola=137;
int colb=209;
int colc=200;


int bga=116, bgb=239, bgc=252;
PImage img;
float si=1;

void setup() {
  size(600, 600);
  frameRate(7);



  //background(255);
  //background(255);
  // translate(width/2, height);
  img = loadImage("rabb.png");
}


void draw()
{ 
  noStroke();

  if (bga<90)
  {
    for (i=0; i<10;i++)
    {
      fill(255, drop);   
      ellipse(random(0, width), random(0, 300), 1+sin(frameCount)*random(6), 1+sin(frameCount)*random(6));
    }
  }                                                        //bg splatter *****


  fill(bga, bgb, bgc, 10);
  rect(0, 0, width, height); 
  bga-=1;
  bgb-=20;
  bgc-=20;
  if (bga<=12)
  {
    bga=12;
    bgb=19;
    bgc=43;
  }



  // col=noise(0, 255);
  drop++;
  cola++;
  colb++;
  colc--;
  low+= 0.01; 
  high += 0.01;
  translate(width/2, height);

  branch(100);

  s=noise(low, high);
  test= noise(random(-0.75, 0.8))*2;

  si+=0.1;
}



void branch(float len) {


  control+=0.05;
  theta =s*(radians(random(10, 15)));
  // strokeWeight(len/2+random(1.2, 6));
  stroke(random(cola, colb), random(68, 209), colc );   ////line color
  // fill(len+random(20), 30+len, 4, len+10);
  image(img, 10, 0, si, si);

  if (si>=10)
  {
    si=10;
  }





  //stroke(len+120, len+40, 80);
  thick=len/10;
  if (thick<0)
  {
    thick=1;
  }
  strokeWeight(thick);




  line(-1, 0, sin(drop)*len/10, -len-br/100);   /////////////////////
  ellipse(-10, 10, 2, 3);





  //line(-1, 0, 0, -len-br/100);
  // strokeWeight(len/90+random(1.2, 1.2));
  //line(5, 0, 0, -len+7);

  if (br>=3000)
  {
    br=3000;
  }
  else
  {
    br+=0.5;
  }

  translate(sin(drop)*len/10, -len-br/100);  ////////////////////


  if (len >3) { // no inf. loop



    pushMatrix(); ////////push

    rotate(radians(-random(10, 40)));
    rotate(theta-noise(50)+random(-0.8+len/100));
    branch(len*random(0.5, 0.7));

    popMatrix();  //

    translate(0, random(len*.3));

    pushMatrix();     ////////push

    rotate(theta+test); 
    branch(len*.55);

    popMatrix();   //


    if (control%2==0)
    {
      pushMatrix();    ////////push
      rotate(theta-noise(-50)+s);
      branch(len*.35);
      popMatrix();  //
    }
  }
}



