
tree t1;
tree2 t2;
PImage bg, leaves; 
ParticleSystem ps;
boolean mouse=false;

void organicLine(float x1, float y1, float x2, float y2, float strokeW)
{
  strokeWeight(strokeW);

  float numSections =5;                              // vary the # of sections? 

  float cx = x2-x1;         // change in x
  float cy = y2-y1;         // change in y

  float nx1 = x1;
  float ny1 = y1;

  for (int i = 1; i <= numSections; i++)       
  {
    float nx2 = x1+random(5) + i/numSections * cx;               // add variation here
    float ny2 = y1+ random(5)+ i/numSections * cy;               // and here

    line(nx1, ny1, nx2, ny2);

    nx1 = nx2;
    ny1 = ny2;
  }
}

void setup()
{ frameRate(0.5);
  ellipseMode(CENTER);
  translate(width/2, height);
  size(1000, 600);
  bg = loadImage("1.jpg");
  leaves = loadImage("leaves.png");


  //frameRate(5);
  t1 = new tree(100, 255); 
  t2 = new tree2(100, 255);
  ps = new ParticleSystem(new PVector(400, -350));
  image(bg, 0, 0);
  
   // fill(255);
    //image(bg, 0, 0);
 
  
      //ps.addParticle();
      //ps.run();
    
    
  
}

void draw() {
  image(bg, 0, 0); 
  translate(200, 550);
 // ps.addParticle();
  ps.run();
 // t2.split2(130, 255);
   print("123");
      pushMatrix();
      translate(500, -160);
      t1.split(50, 255);
      popMatrix();
      t2.split2(150, 255);

 
} 



class tree {


  float theta = radians(25);
  float len, tra;

  float c2=random(200, 140);

  tree(float len, float tra) {
  }

  void split(float len, float tra) {

    stroke(142, 100, 70, tra);
   // strokeWeight(len/15);
     organicLine(0,0, 0, -len, len/10);

    translate(0, -len+random(3));

    if (len > 5) { 

      // no inf. loop


      if (len<30) {
        noStroke();

        fill(random(230, 255), random(220, 240), 139, tra+5);
        ellipse(random(0, -5), random(0, -5), len/8+random(15), -len+random(5));
        fill(random(30, 50), random(100, 140), 109, tra+5);
        ellipse(random(0, -5), random(0, -5), len/8+random(15), -len+random(5));
      //   translate(random(400,450), -len);
      }

      pushMatrix();
      rotate(-theta*random(2));
      split(len*.75, tra*.85);
      popMatrix();

      pushMatrix();
      rotate(-theta/1.5);
      split(len*.5, tra*.55);
      popMatrix();


      pushMatrix();
      rotate(theta*random(2));
      split(len*.75, tra*.85);
      popMatrix();
    }
    //  translate(0, len);
  }
}

class tree2 extends tree {


  tree2(float x, float y) {
    super(x, y);
  }




  void split2(float len, float tra) {


    stroke(142, 100, 70, tra);
    strokeWeight(len/11);
    organicLine(0,0, 0, -len, len/10);

    translate(0, -len+random(3));

    if (len > 5) { // no inf. loop


      if (len<30) {
        noStroke();
        fill(random(30, 50), random(100, 140), 109, tra);
        ellipse(random(0, -5), random(0, -5), len/8+random(15), -len+random(5));
        //translate(350,-len);
      }

      pushMatrix();
      rotate(-theta*random(2));
      split(len*.75, tra*.85);
      popMatrix();

      pushMatrix();
      rotate(-theta/1.5);
      split(len*.5, tra*.55);
      popMatrix();


      pushMatrix();
      rotate(theta*random(2));
      split(len*.75, tra*.85);
      popMatrix();
    }
  }
}


