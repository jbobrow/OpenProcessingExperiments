
 import processing.pdf.*;
Chaos ch[] = new Chaos[2000];

void setup () {
  size (1000,600);



  smooth();
  noFill();
  
  
  strokeWeight(5);
  stroke(255,255,255,20);
  rect(100,100,400,400);
  
  noStroke();
  fill(255,255,255,5);
  triangle(902, 302, 502, 102, 502, 502);
  fill(255,255,255,50);
  rect(882,295,12,12);

  strokeWeight(0.1);
  //rectMode(CENTER);

  for (int i=0; i < ch.length; i++) {
    float x = random(100,500);
    float y = random(100,500);
    ch[i] = new Chaos (x, y);
  }
  
 
  
  for (int k=0; k < ch.length; k++) {
    float x = random(900,901);
    float y = random(300,301);
    ch[k] = new Chaos (x, y);
  }
}

void draw () {
  
  
    background (0,5);
  for (int i=0; i < ch.length; i++) {
    ch[i].move ();

    /* stroke (100,100,100,10);
     ellipse (ch[i].position.x, ch[i].position.y,5,5);
     stroke (255,255,255,10);
     rect (ch[i].position.x, ch[i].position.y,25,25);
     rect (ch[i].position.x, ch[i].position.y,15,15);*/
    stroke (255,255,255,20);
    ellipse (ch[i].position.x, ch[i].position.y,3,3);
    
  } 
    
    
  
  for (int k=0; k < ch.length; k++) {
    ch[k].move ();
    stroke (255,255,255,20);
    ellipse (ch[k].position.x, ch[k].position.y,3,3);

  }
  
  
   
   
}

void keyPressed () {
  if (key == 'a') {
    saveFrame ("capture ####.png");
  }
}


