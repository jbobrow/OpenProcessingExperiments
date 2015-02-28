
Chair c;
Chair d;
Chair e;

void setup(){
  size(500,500);
  rectMode(CENTER);
      c = new Chair(50,50,50,.25,0);
     d = new Chair(300,180,150,.5,0);
     e= new Chair (200,300,50,1,0);

}

void draw(){
  
  background(0);
  c.display();
  c.update();
  d.display();
  d.bw();
  e.display();
  e.pulse();
  

}



