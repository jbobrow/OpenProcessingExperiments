
int x1 = 142;
int y1 = 90;
int fly = 4;
int swim = 3;

void setup(){
  size(700,700);
  background(210);
}
void draw(){
  //background lines
  strokeWeight(2);
  for (int y = -368; y < 1200; y += 180){
    stroke(255);
    line(0,y,700,y+445);
    stroke(200,0,200);
    line(0,y-fly,700,y+445-fly);
    line(0,y+fly,700,y+445+fly);
  }
  for (int y = -320; y < 1200; y += 180){
    stroke(255);
    line(0,y+445,700,y);
    stroke(180,0,0);
    line(0,y+445-fly,700,y-fly);
    line(0,y+445+fly,700,y+fly);
  }
  for (int x = 106; x < 700; x += 142){
    stroke(255);
    line(x,0,x,700);
    stroke(50,100,255);
    line(x-fly,0,x-fly,700);
    line(x+fly,0,x+fly,700);
  }
  strokeWeight(1);
  for (int y = -40; y < 700; y += 180){
    for (int x = -100; x < 700; x += 284){
      stroke(0,230,230);
      line(x,y,x+270,y+101);
      line(x,y+swim,x+270,y+101+swim);
      line(x,y+2*swim,x+270,y+101+2*swim);
      line(x,y+3*swim,x+270,y+101+3*swim);
      stroke(200,200,0);
      line(x+x1,y+y1,x+x1+270,y+y1+101);
      line(x+x1,y+y1+swim,x+x1+270,y+y1+101+swim);
      line(x+x1,y+y1+2*swim,x+x1+270,y+y1+101+2*swim);
      line(x+x1,y+y1+3*swim,x+x1+270,y+y1+101+3*swim);
    }
  }
  for (int y = 191; y < 800; y += 180){
    for (int x = -70; x < 700; x += 284){
      stroke(230,150,0);
      line(x,y,x+200,y-182);
      line(x,y+swim,x+200,y+swim-182);
      line(x,y+2*swim,x+200,y+2*swim-182);
      line(x,y+3*swim,x+200,y+3*swim-182);
      line(x,y+4*swim,x+200,y+4*swim-182);
      line(x,y+5*swim,x+200,y+5*swim-182);
      stroke(255,150,200);
      line(x+x1,y-y1,x+x1+200,y-y1-182);
      line(x+x1,y-y1+swim,x+x1+200,y-y1+swim-182);
      line(x+x1,y-y1+2*swim,x+x1+200,y-y1+2*swim-182);
      line(x+x1,y-y1+3*swim,x+x1+200,y-y1+3*swim-182);
      line(x+x1,y-y1+4*swim,x+x1+200,y-y1+4*swim-182);
      line(x+x1,y-y1+5*swim,x+x1+200,y-y1+5*swim-182);
    }
  }
  for (int y = -90; y < 700; y += 180){
    for (int x = 217; x < 800; x += 284){
      stroke(0,170,170);
      line(x,y,x+54,y+310);
      line(x+swim,y,x+swim+54,y+310);
      line(x+2*swim,y,x+2*swim+54,y+310);
      line(x+3*swim,y,x+3*swim+54,y+310);
      stroke(0,180,50);
      line(x-x1,y-y1,x-x1+54,y-y1+310);
      line(x-x1+swim,y-y1,x-x1+swim+54,y-y1+310);
      line(x-x1+2*swim,y-y1,x-x1+2*swim+54,y-y1+310);
      line(x-x1+3*swim,y-y1,x-x1+3*swim+54,y-y1+310);
    }
  }
  for (int y = 102; y < 700; y += 180){
    for (int x = 10; x < 700; x += 284){
      stroke(100,255,255);
      line(x,y,x+160,y-24);
      line(x,y-swim,x+160,y-swim-24);
      line(x,y-2*swim,x+160,y-2*swim-24);
      line(x,y-3*swim,x+160,y-3*swim-24);
      line(x,y-4*swim,x+160,y-4*swim-24);
      stroke(200,100,200);
      line(x+x1,y-y1,x+x1+160,y-y1-24);
      line(x+x1,y-y1-swim,x+x1+160,y-y1-swim-24);
      line(x+x1,y-y1-2*swim,x+x1+160,y-y1-2*swim-24);
      line(x+x1,y-y1-3*swim,x+x1+160,y-y1-3*swim-24);
      line(x+x1,y-y1-4*swim,x+x1+160,y-y1-4*swim-24);
    }
  }
  for (int y = 180; y < 700; y += 180){
    for (int x = 95; x < 700; x += 284){
      stroke(170,0,250);
      line(x,y,x+50,y-174);
      line(x-swim,y,x-swim+50,y-174);
      line(x-2*swim,y,x-2*swim+50,y-174);
      line(x-3*swim,y,x-3*swim+50,y-174);
      stroke(100,0,180);
      line(x+x1,y-y1,x+x1+50,y-y1-174);
      line(x+x1-swim,y-y1,x+x1-swim+50,y-y1-174);
      line(x+x1-2*swim,y-y1,x+x1-2*swim+50,y-y1-174);
      line(x+x1-3*swim,y-y1,x+x1-3*swim+50,y-y1-174);
    }
  }
  for (int y = 0; y < 700; y += 180){
    for (int x = 85; x < 700; x += 284){
      stroke(255,190,0);
      line(x,y,x+110,y+130);
      line(x,y+swim,x+110,y+swim+130);
      line(x,y+2*swim,x+110,y+2*swim+130);
      line(x,y+3*swim,x+110,y+3*swim+130);
      line(x,y+4*swim,x+110,y+4*swim+130);
      stroke(255,255,0);
      line(x+x1,y-y1,x+x1+110,y-y1+130);
      line(x+x1,y-y1+swim,x+x1+110,y-y1+swim+130);
      line(x+x1,y-y1+2*swim,x+x1+110,y-y1+2*swim+130);
      line(x+x1,y-y1+3*swim,x+x1+110,y-y1+3*swim+130);
      line(x+x1,y-y1+4*swim,x+x1+110,y-y1+4*swim+130);
    }
  }
  for (int y = 54; y < 700; y += 180){
    for (int x = 45; x < 700; x += 284){
      stroke(0,250,0);
      line(x,y,x+160,y-48);
      line(x,y+swim,x+160,y+swim-48);
      line(x,y+2*swim,x+160,y+2*swim-48);
      line(x,y+3*swim,x+160,y+3*swim-48);
      line(x,y+4*swim,x+160,y+4*swim-48);
      stroke(0,240,0);
      line(x+x1,y+y1,x+x1+160,y+y1-48);
      line(x+x1,y+y1+swim,x+x1+160,y+y1+swim-48);
      line(x+x1,y+y1+2*swim,x+x1+160,y+y1+2*swim-48);
      line(x+x1,y+y1+3*swim,x+x1+160,y+y1+3*swim-48);
      line(x+x1,y+y1+4*swim,x+x1+160,y+y1+4*swim-48);
    }
  }
  for (int y = 115; y < 700; y += 180){
    for (int x = 67; x < 700; x += 284){
      stroke(255,0,0);
      line(x,y,x+49,y-174);
      line(x+swim,y,x+swim+49,y-174);
      line(x+2*swim,y,x+2*swim+49,y-174);
      line(x+3*swim,y,x+3*swim+49,y-174);
      line(x+4*swim,y,x+4*swim+49,y-174);
      stroke(220,100,0);
      line(x+x1,y-y1,x+x1+49,y-y1-174);
      line(x+x1+swim,y-y1,x+x1+swim+49,y-y1-174);
      line(x+x1+2*swim,y-y1,x+x1+2*swim+49,y-y1-174);
      line(x+x1+3*swim,y-y1,x+x1+3*swim+49,y-y1-174);
      line(x+x1+4*swim,y-y1,x+x1+4*swim+49,y-y1-174);
    }
  }
  for (int y = 0; y < 700; y += 180){
    for (int x = 25; x < 700; x += 284){
      stroke(255,255,200);
      line(x,y,x+111,y+130);
      line(x+swim,y,x+swim+111,y+130);
      line(x+2*swim,y,x+2*swim+111,y+130);
      line(x+3*swim,y,x+3*swim+111,y+130);
      line(x+4*swim,y,x+4*swim+111,y+130);
      stroke(0,180,180);
      line(x+x1,y-y1,x+x1+111,y-y1+130);
      line(x+x1+swim,y-y1,x+x1+swim+111,y-y1+130);
      line(x+x1+2*swim,y-y1,x+x1+2*swim+111,y-y1+130);
      line(x+x1+3*swim,y-y1,x+x1+3*swim+111,y-y1+130);
      line(x+x1+4*swim,y-y1,x+x1+4*swim+111,y-y1+130);
    }
  }
  //white shapes
  noStroke();
  fill(255);
  for (int y = 0; y < 800; y += 180){
    for (int x = -20; x < 800; x += 284){
      beginShape();
      vertex(x,y);
        vertex(x+65,y+25);
      vertex(x+95,y+60);
        vertex(x+40,y+108);
      vertex(x,y+120);
        vertex(x-12,y+45);
      endShape(CLOSE);
      beginShape();
      vertex(x+x1,y-y1);
        vertex(x+x1+65,y-y1+25);
      vertex(x+x1+95,y-y1+60);
        vertex(x+x1+40,y-y1+108);
      vertex(x+x1,y-y1+120);
        vertex(x+x1-12,y-y1+45);
      endShape(CLOSE);
    }
  }
  for (int y = -90; y < 800; y += 180){
    for (int x = -5; x < 800; x += 284){
      beginShape();
      vertex(x+95,y);
        vertex(x+107,y+75);
      vertex(x+95,y+120);
        vertex(x+30,y+95);
      vertex(x,y+60);
        vertex(x+55,y+7);
      endShape(CLOSE);
      beginShape();
      vertex(x+x1+95,y+y1);
        vertex(x+x1+107,y+y1+75);
      vertex(x+x1+95,y+y1+120);
        vertex(x+x1+30,y+y1+95);
      vertex(x+x1,y+y1+60);
        vertex(x+x1+55,y+y1+7);
      endShape(CLOSE);
    }
  }
  for (int y = 60; y < 800; y += 180){
    for (int x = 93; x < 800; x += 284){
      beginShape();
      vertex(x,y);
      vertex(x+6,y-12);
      vertex(x+21,y-12);
      vertex(x+27,y);
      vertex(x+21,y+12);
      vertex(x+6,y+12);
      endShape(CLOSE);
      beginShape();
      vertex(x+x1,y+y1);
      vertex(x+x1+6,y+y1-12);
      vertex(x+x1+21,y+y1-12);
      vertex(x+x1+27,y+y1);
      vertex(x+x1+21,y+y1+12);
      vertex(x+x1+6,y+y1+12);
      endShape(CLOSE);
    }
  }
}

