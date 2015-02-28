

void setup(){
  size(400,400);
  background(0);
  fill(0);
}

void draw(){
 
      background(0);
      noStroke();

  if(mousePressed){
    if(mouseButton==LEFT){
     fill(255,0,0); 
     ellipse(200,200,400,400);
     fill(255,85,0);
     ellipse(200,200,360,360);
     fill(255,166,0);
     ellipse(200,200,300,300);
     fill(255,213,0);
     ellipse(200,200,260,260);
     fill(233,255,0);
     ellipse(200,200,200,200);
     save("circulos.jpg");
    }
    

    if(mouseButton==RIGHT){
 
     fill(0,255,0);
     rect(20,20,360,360);
     fill(0,198,54);
     rect(40,40,320,320);
     fill(0,211,121);
     rect(60,60,280,280);
     fill(0,252,208);
     rect(80,80,240,240);
     fill(0,215,255);
     rect(100,100,200,200);
     fill(0,0,255);
     rect(120,120,160,160);
        save("cuadro.png");
    }
  
    if(mouseButton==CENTER){
  strokeWeight(15);

  stroke(255,0,0);
  line(0,0,400,0);
  stroke(255,0,89);
  line(20,20,380,20);
  stroke(255,0,196);
  line(40,40,360,40);
  stroke(224,0,255);
  line(60,60,340,60);
  stroke(195,0,255);
  line(80,80,320,80);
  stroke(145,0,255);
  line(100,100,300,100);
  stroke(63,0,255);
  line(120,120,280,120);
  stroke(16,0,255);
  line(140,140,260,140);
  stroke(0,53,255);
 line(160,160,240,160);
  stroke(0,176,255);
  line(180,180,220,180);
  
  stroke(0,255,232);
  line(200,200,200,200);
  
  stroke(0,255,142);
  line(180,220,220,220);
  stroke(0,255,57);
  line(160,240,240,240);
  stroke(20,255,0);
  line(140,260,260,260);
  stroke(118,255,0);
  line(120,280,280,280);
  stroke(148,255,0);
  line(100,300,300,300);
  stroke(224,255,0);
  line(80,320,320,320);
  stroke(255,247,0);
  line(60,340,340,340);
  stroke(255,175,0);
  line(40,360,360,360);
  stroke(255,85,0);
  line(20,380,380,380);
  stroke(255,43,0);
  line(0,400,400,400);
     save("linea.gif");
  }
  }
  }  






