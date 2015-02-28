
partsystem ps1;
PVector pos, vel;
PVector mouse;
PVector dura_loc,dura_dir;

PFont font1;

  boolean mouse1 = true;
  boolean mouse2 = true;
  
  void setup()
  {
    
    size(600,600,P2D);
    background(255);
    pos=new PVector(100,100);
    vel=new PVector(0,0);
    mouse = new PVector(mouseX,mouseY);
    
    font1=loadFont("Candara-24.vlw");
    
    dura_dir = new PVector(0,0);
    dura_loc = new PVector(width/2,height/2);

    ps1=new partsystem(50,40,2);
    smooth();
    frameRate(30);
  }
  
  void draw()
  {
    background(255);
    mouse.set(mouseX,mouseY,0);
    //fill(255,50);
    //rect(0,0,width,height);
    if (mouse1 ==true) {
      if (mouse2 ==true) {float d = dura_loc.dist(mouse);
      dura_dir = PVector.sub(mouse,dura_loc);
      dura_dir.normalize();
      dura_dir.mult(constrain(d/20,0.01,8)*20);
      dura_loc.add(dura_dir);}
      fill(#F0A000);
      ellipse(dura_loc.x,dura_loc.y,15,15);
      ps1.calc(dura_loc);
    }
    ps1.display();
    
    fill(0,140);
    textFont(font1,16);
    text("number",30,30);
    text("size",30,42);
    text("radius",30,54);
    text(str(ps1.number),90,30);
    text(str(ps1.p_size),90,42);
    text(str(ps1.radius),90,54);
    
    text("controls: q,w,s,d,f",460,560);
    
    if (mousePressed==true && mouseButton==LEFT)
    {
      ps1.add_p(mouse.x,mouse.y);
    }
  }
  
  void mousePressed()
  { 
    //ps1.calc(mouse);
    if (mouseButton==RIGHT)
    {
      ps1.add_p_weight(mouse.x,mouse.y);
    }
  }
  
   void keyPressed()
  { 
    if (key=='q') {
      if (ps1.lines1 != true) {ps1.lines1 = true;} else {ps1.lines1 = false;}
    }
    if (key=='w') {
      if (ps1.lines2 != true) {ps1.lines2 = true;} else {ps1.lines2 = false;}
    }
    if (key=='s') {
      if (mouse1 != true) {mouse1 = true;} else {mouse1 = false;}
    }
    if (key=='d') {
      if (mouse2 != true) {mouse2 = true;} else {mouse2 = false;}
    }
    if (key=='f') {
      ps1.update(int(random(10,350)), random(30,200),random(1,2));
    }
  }
  

