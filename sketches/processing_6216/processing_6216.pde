
class Bear{
  PShape leftarm, rightarm, body, head, snose, bnose, tail;
  float x, xs, y, s;
  int xp, mouse;
  float mouseE;

  //constructor
  Bear(float ypos){

    y = ypos;

    leftarm = loadShape("leftarm.svg");
    rightarm = loadShape("rightarm.svg");
    body = loadShape("body.svg");
    head = loadShape("head.svg");
    snose = loadShape("smallnose.svg");
    bnose = loadShape("bignose.svg");
    tail = loadShape("tail.svg");

    x = int(random(201));

    strokeWeight(3);
    strokeCap(ROUND);
    smooth();


  }

  void path(float yspeed){
    
    float ys = yspeed;
    
    y = y - (ys-mouseE);
    
    if (y< 0){
      y= height;
    } 
    pushMatrix();
    translate(x, y);
  }
  
  void mouseE(){
   if(mousePressed && (mouseButton == LEFT)){
    mouseE= mouseE + .5;
   } else if (mousePressed && (mouseButton == RIGHT)){
     mouseE= mouseE - .5;
   }
    
  }
  
  void mouseM(int m){
    int move = m;
    if (mouseX<width/2){
      x=x-move;
    } else {
      x=x+move;
    }
    
    
  }

  void display(float headscale){
    s = headscale;

    pushMatrix();
    scale(.3);
    shapeMode(CENTER);

    //arms
    shape(leftarm, 150, 220); 
    shape(rightarm, 300, 220);


    //body
    shape(body, 220, 235);

    //face
    pushMatrix();
    translate(220, 105);
    scale(s);
    shape(head);
    popMatrix();



    shape(bnose, 220, 120);
    shape(snose, 220, 110);
    fill(0);
    ellipse(180, 95, 15, 15);
    ellipse(260, 95, 15, 15);

    popMatrix();
    popMatrix();
  }

}




