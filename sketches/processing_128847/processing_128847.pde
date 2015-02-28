
/* @pjs crisp=true; 
 */


int nbeCol, nbeRang;
float ecartX, ecartY;
float rayon;
boolean qua=false;
boolean back=false;
static float multiplier=3;
particle[] partArray;
int decalage;
float multiplier=5;

void setup() {
  size(800, 800);
  smooth();
  decalage=this.y;
  strokeWeight(0);
  nbeCol=90;
  nbeRang=90;
  ecartX=1.5*(int)(width/(nbeCol+1));
  ecartY=1.5*(int)(height/(nbeRang+1));
  partArray=new particle[nbeCol*nbeRang];
  for (int i=0;i<nbeCol;i++) {
    for (int j=0;j<nbeRang;j++) {
      partArray[i*nbeRang+j]=new particle(-(int)(width/4)+ecartX*(i+1), -(int)(height/4)+ecartY*(j+1));
    }
  }
  rayon=10*multiplier+30*multiplier*int(!qua);
  updateArray();
}
void draw() {

  if (mousePressed) {  
    for (int i=0;i<partArray.length;i++) {
      if (mouseButton==LEFT) {
        partArray[i].moveToMouse();
      }
      else if (mouseButton==RIGHT) {
        partArray[i].moveToHome();
      }
    }
  }

  if (back) {
    background(255);
    for (int i=0;i<partArray.length;i++) {
      partArray[i].backToOrigin(10);
    }
  }
  updateArray();
}
void updateArray() {
  background(255);
  noStroke();
  fill(255, 0, 255*int(!qua), 50);
  ellipse(mouseX, mouseY, 2*rayon,2* rayon);
  stroke(0);
  for (int i=0;i<nbeCol-1;i++) {
    for (int j=0;j<nbeRang-1;j++) {
      line(partArray[i*nbeRang+j].x, partArray[i*nbeRang+j].y, partArray[i*nbeRang+j+1].x, partArray[i*nbeRang+j+1].y);
      line(partArray[i*nbeRang+j].x, partArray[i*nbeRang+j].y, partArray[(i+1)*nbeRang+j].x, partArray[(i+1)*nbeRang+j].y);
    }
  }
}
void mousePressed() {  

  if (mouseButton==CENTER) {
    qua=!qua;
    rayon=40*multiplier;
  }
}
void mouseScrolled()
{
  if (mouseScroll > 0)
  {
    if (multiplier<12.5) {
      multiplier+=1;
      rayon=40*multiplier;
      updateArray();
    }
  }
  else
  {
    if (multiplier>1) {
      multiplier-=1;
      rayon=40*multiplier;
      updateArray();
    }
  }
}

void keyPressed() {
  switch (keyCode) {
  case 32:
    back=true;
    break;
  case 81:
    qua=!qua;
    break;
  case 88:
    if (multiplier<12.5) {
      multiplier+=.1;
      rayon=40*multiplier;
      updateArray();
    }
    break;
  case 67:
    if (multiplier>1) {
      multiplier-=.1;
      rayon=40*multiplier;
      updateArray();
    }
    break;
  }
}

void keyReleased() {
  if (keyCode==32) {
    back=false;
  }
}

class particle {
  float x, y, x0, y0;
  particle(float X, float Y) {
    x=x0=X;
    y=y0=Y;
    display();
  }
  void display() {
    point(x, y);
  }
  void moveToMouse() {
    float distance=dist(mouseX, mouseY, x, y);
    
    float rate=2*(rayon-distance)*int(distance<=rayon)/(rayon);//50*multiplier/(50+distance);
    float angle=atan2(mouseY-y, mouseX-x);
    float c=cos(angle);
    float s=sin(angle);
    float p=abs(abs(c)+abs(s));
    if (qua) {
      rate*=rate/5;
    }
      x+=rate*c*p;
      y+=rate*s*p;

  }
  void moveToHome() {
    float distance=dist(mouseX, mouseY, x, y);
    float rate=multiplier*multiplier/(multiplier*multiplier+distance-multiplier*int(distance<=rayon));
    if (qua) {
      rate*=rate/5;
    }
    x-=rate*(x-x0)/multiplier;
    y-=rate*(y-y0)/multiplier;
  }
  void backToOrigin(int vit) {
    x-=(x-x0)/vit;
    y-=(y-y0)/vit;
  }
}



