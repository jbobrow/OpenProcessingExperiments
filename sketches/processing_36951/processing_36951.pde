
//homework 4
//copyright Andrew Viny, Carnegie Mellon University, Sept 2011, Pittsburgh, Pa

//declare variables
float x,y,wd,ht,ax,ay,bx,by,vx,vy;
boolean Abool, Bbool, Vbool;

void setup() {
  size(400,400);
  smooth();
  background(255);
  noStroke();
  fill(255,0,0);
  Abool=false;
  Bbool=false;
  Vbool=false;
  x=200;
  y=200;
  ax=200;
  ay=200;
  bx=200;
  by=200;
  vx=200;
  vy=200;
  wd=80;
  ht=80;
}

void draw() {
  
    background(255);
  
    fill(0,0,0);
    ellipse(x,y,wd,ht);
    ellipse(x,y,3.05*wd,3.05*ht);
    
    noStroke();
    fill(255,0,0);
    ellipse(x,y,wd,ht);
    ellipse(x,y,3*wd,3*ht);
    
    stroke(1);
    fill(175);
    ellipse(x,y,wd,ht);
    ellipse(x,y,4*wd,2*ht);
    
    fill(100);
    ellipse(x,y,wd,ht);
    ellipse(x,y,4*wd,1*ht);
    
    //b
    fill(255);
    ellipse(bx,by,wd,ht);
    
    //a
    noStroke();
    fill(255);
    ellipse(ax-1.85*wd,ay,1*wd,1*ht);
    
    //v
    fill(255);
    ellipse(vx+1.85*wd,vy,1*wd,1*ht);
    
    //A
    stroke(184,134,11);
    strokeWeight(2);
    beginShape();
    curveVertex(ax-2*wd,ay+.3*ht);
    curveVertex(ax-2*wd,ay+.3*ht);//1
    curveVertex(ax-1.85*wd,ay-.3*ht);//2
    curveVertex(ax-1.7*wd,ay+.3*ht);//3
    curveVertex(ax-1.775*wd,ay+.05*ht);//4
    curveVertex(ax-2.01*wd,ay-.06*ht);//5
    curveVertex(ax-2.01*wd,ay-.06*ht);
    endShape();
    
    //B
    stroke(25,25,112);
    strokeWeight(2);
    beginShape();
    curveVertex(bx-.18*wd,by+.28*ht);
    curveVertex(bx-.18*wd,by+.28*ht);//1
    curveVertex(bx-.16*wd,by-.28*ht);
    curveVertex(bx-.16*wd,by-.28*ht);//2
    curveVertex(bx+.12*wd,by-.28*ht);//3
    //curveVertex(bx+.2*wd,by-.2*ht);//4
    //curveVertex(bx+.2*wd,by-.1*ht);//5
    curveVertex(bx+.12*wd,by-.02*ht);//6
    curveVertex(bx+.0*wd,by-.01*ht);//7
    curveVertex(bx+.20*wd,by-.01*ht);//8
    curveVertex(bx+.2*wd,by+.28*ht);//9
    curveVertex(bx+.0*wd,by+.35*ht);//10
    curveVertex(bx-.18*wd,by+.28*ht);//11
    curveVertex(bx-.18*wd,by+.28*ht);
    endShape();
    
    //V
    stroke(184,134,11);
    strokeWeight(2);
    beginShape();
    curveVertex(vx+2*wd,vy-.3*ht);
    curveVertex(vx+2*wd,vy-.3*ht);//1
    curveVertex(vx+1.85*wd,vy+.3*ht);//2
    curveVertex(vx+1.7*wd,vy-.3*ht);//3
    curveVertex(vx+1.7*wd,vy-.3*ht);
    endShape();
    //saveFrame("hw2.jpeg");
}

void keyPressed() {
    if(keyCode == 'a' || keyCode == 'A')
    {
      Abool = true;
      Bbool = false;
      Vbool = false;
    }
    else if(keyCode == 'b' || keyCode == 'B')
    {
      Abool = false;
      Bbool = true;
      Vbool = false;
    }
    else if(keyCode == 'v' || keyCode == 'V')
    {
      Abool = false;
      Bbool = false;
      Vbool = true;
    }
    
    float tempx=200, tempy=200;
    if(Abool)
    {
      tempx=ax;
      tempy=ay;
    }
    else if(Bbool)
    {
      tempx=bx;
      tempy=by;
    }
    else if(Vbool)
    {
      tempx=vx;
      tempy=vy;
    }
    
    if (keyCode == UP)
          tempy = tempy-10;
    else if (keyCode == DOWN)
          tempy = tempy+10;
    else if (keyCode == RIGHT)
          tempx = tempx+10;
    else if (keyCode == LEFT)
         tempx = tempx-10;

    if(Abool)
    {
      ax=tempx;
      ay=tempy;
    }
    else if(Bbool)
    {
      bx=tempx;
      by=tempy;
    }
    else if(Vbool)
    {
      vx=tempx;
      vy=tempy;
    }
    
    if (keyCode == ' ')
      {
        setup();
        
      }
    
}

