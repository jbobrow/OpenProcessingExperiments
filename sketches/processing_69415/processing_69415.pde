
//code for display
void setup() {
  size(500, 500);
  background(255, 255, 255);
}

int re = 255;
int gr = 255;
int bl = 255;
int re2 = 255;
int gr2 = 255;
int bl2 = 255;
int re3 = 255;
int gr3 = 255;
int bl3 = 255;




void draw() {
  fill(re,gr,bl);
  strokeWeight(0);
  rect(230, 250, 187, 198);
  fill(re2, gr2, bl2);
  rect(100, 113, 130, 140);
  fill(re3,gr3,bl3);
  rect(420, 60, 80, 50);
  
strokeWeight(5);
//borders
line(0, 500, 0, 0);
line(0, 500, 500, 500);
line(500, 0, 0, 0);
line(500, 0, 500, 500);
//lines
line(0, 60, 500, 60);
line(0, 113, 500, 113);
line(0, 250, 500, 250);
line(0, 450, 500, 450);
line(100, 0, 100, 500);
line(230, 0, 230, 500);
line(420, 0, 420, 500);
}


void mouseClicked() {
  
  //turn red
  if ((re == 255)&&(gr == 255)&&(bl == 255)) {
    re = 255;
    gr = 0;
    bl = 0;
     //fill square 2 + 3
    float poo = random(1,2);
    poo = int(poo);
    if(poo == 1)
    {
      re2 = 255;
      gr2 = 255;
      bl2 = 0;
      re3 = 0;
      gr3 = 0;
      bl3 = 255;
    }
    else
    {
      re2 = 0;
      gr2 = 0;
      bl2 = 255;
      re3 = 255;
      gr3 = 255;
      bl3 = 0;
    }
    
    //turn yellow
  } else if ((re == 255)&&(gr == 0)&&(bl == 0)) {
    re = 255;
    gr = 255;
    bl = 0;
         //fill square 2 + 3
    float poo = random(1,2);
    poo = int(poo);
    if(poo == 1)
    {
      re2 = 255;
      gr2 = 0;
      bl2 = 0;
      re3 = 0;
      gr3 = 0;
      bl3 = 255;
    }
    else
    {
      re2 = 0;
      gr2 = 0;
      bl2 = 255;
      re3 = 255;
      gr3 = 0;
      bl3 = 0;
    }
    
  }
    //turn blue
    else if ((re == 255)&&(gr == 255)&&(bl == 0)) {
    re = 0;
    gr = 0;
    bl = 255;
         //fill square 2 + 3
    float poo = random(1,2);
    poo = int(poo);
    if(poo == 1)
    {
      re2 = 255;
      gr2 = 255;
      bl2 = 0;
      re3 = 255;
      gr3 = 0;
      bl3 = 0;
    }
    else
    {
      re2 = 255;
      gr2 = 0;
      bl2 = 0;
      re3 = 255;
      gr3 = 255;
      bl3 = 0;
    }
  }
    else if((re == 0)&&(gr == 0)&&(bl == 255)){
    re = 255;
    gr = 0;
    bl = 0; 
         //fill square 2 + 3
    float poo = random(1,2);
    poo = int(poo);
    if(poo == 1)
    {
      re2 = 255;
      gr2 = 255;
      bl2 = 0;
      re3 = 0;
      gr3 = 0;
      bl3 = 255;
    }
    else
    {
      re2 = 0;
      gr2 = 0;
      bl2 = 255;
      re3 = 255;
      gr3 = 255;
      bl3 = 0;
    }
    }
    
    
    
}
