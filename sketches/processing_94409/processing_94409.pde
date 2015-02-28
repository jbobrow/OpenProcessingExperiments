
tree t1;
tree2 t2;
PImage bg, leaves; 
ParticleSystem ps;
boolean mouse=false;

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
      t1.split(60, 255);
      popMatrix();
      t2.split2(130, 255);

 
} 



class tree {


  float theta = radians(25);
  float len, tra;

  float c2=random(200, 140);

  tree(float len, float tra) {
  }

  void split(float len, float tra) {

    stroke(142, 100, 70, tra);
    strokeWeight(len/15);
    line(0, 0, 0, -len+random(3));

    translate(0, -len+random(3));

    if (len > 5) { 

      // no inf. loop


      if (len<30) {
        noStroke();

        fill(random(230, 255), random(220, 240), 139, tra+5);
        ellipse(random(0, -5), random(0, -5), len/8+random(15), -len+random(5));
        fill(random(30, 50), random(100, 140), 109, tra+5);
        ellipse(random(0, -5), random(0, -5), len/8+random(15), -len+random(5));
         translate(random(400,450), -len);
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
    line(0, 0, 0, -len+random(3));

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


