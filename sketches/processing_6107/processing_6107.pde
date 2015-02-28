
class Bear{
  PShape leftarm, rightarm, body, head, snose, bnose, tail;
  float s, y, x, xs, ap, tp, hr, p, bx, by;
  int direction = -1;
  float e, targetE, easingE = 0.029; 
  float h, targetH, easingH = 0.03; 
  float a, targetA, easingA = 0.025; 
  float au = 0.0, targetAU, easingAU = 0.02; 


  //constructor
  Bear(float shead, float xpos, float xspeed, float armpos, float tailpos, float headrotate, int path){
    s = shead;
    x = xpos;
    xs = xspeed;
    ap = armpos;
    tp = tailpos;
    hr = headrotate;
    p = path;

    leftarm = loadShape("leftarm.svg");
    //  rightarm = loadShape("rightarm.svg");
    body = loadShape("body.svg");
    head = loadShape("head.svg");
    snose = loadShape("smallnose.svg");
    bnose = loadShape("bignose.svg");
    tail = loadShape("tail.svg");

    strokeWeight(3);
    strokeCap(ROUND);
    smooth();
  }

  void path(){
    x = x - xs;
    if (x< -240){
      x= width+40;
    } 
    translate(x, 100);
    a += (targetA - a) * easingA; 
    targetAU = mouseX; 
    au = targetAU * easingAU; 
  }
    

  void move(){
    
    targetE = mouseX; 
    e += (targetE - e) * easingE; 
    targetH = mouseX; 
    h += (targetH - h) * easingH; 
    targetA = mouseX; 
    a += (targetA - a) * easingA; 
    targetAU = mouseX; 
    au = targetAU * easingAU; 

    translate(mouseX, 100);

  }

  void display(float bxp, float byp){
    bx = bxp;
    by = byp;
    translate(bx, by);


    scale(.6);
    shapeMode(CENTER);

    //body
    shape(body, 220+h, 235);
    shape(tail, tp+h, 250-au);

    //arms
    shape(leftarm, ap+a, 220+au); 
    // shape(rightarm, 300, 240);

    //face
    pushMatrix();
    translate(220+e, 105);
    scale(s);
    if(x < mouseX-250){
      rotate(hr*-.3);
    } else {
    rotate(hr);
    }
    shape(head);
    popMatrix();
    
    pushMatrix();
    if(x < mouseX-250){
      rotate(hr*-.3);
    } else {
    rotate(hr);
    }
    shape(bnose, e+220, 120);
    shape(snose, e+220, 110);
    fill(0);
    ellipse(e+180, 95, 15, 15);
    ellipse(e+260, 95, 15, 15);
    popMatrix();
  }



}






















