
int pNum =16;
public color [] pop = new color[pNum];
int ca(color c) {
  return (c >> 24) & 255; 
}
int cr(color c) {
  return (c >> 16) & 255; 
}
int cg(color c) {
  return (c >> 8) & 255;
}
int cb(color c) {
  return c & 255; 
}
public boolean constant = true;
public color paw;
public int w=255;
public int h = 255;
public int inc;
public float _x,_y;
void setup(){
  size(255,255);
  for (int x=0;x<pop.length-1;x++){
    paw=color(w/2,h/2,255);
    mouseX=(int)cr(paw);
    mouseY=(int)cg(paw);
    pop[x]=color(mouseX,mouseY,255);
  }
}
void keyPressed(){
  if(key=='c')constant=!constant; 
}
void draw(){
  background(-1);
 
  pop[inc]=color(mouseX,mouseY,255);
  if (!constant)if (inc<pop.length-1)inc++;
  if (constant) inc++;
  if (inc >pop.length-1)inc=0;
  if (pmouseX==mouseX && !constant)
  {
    inc=0;
  }
  for (int x=0;x<pop.length-1;x++){
    _x = cr(pop[x]);
    _y = cg(pop[x]);
    fill(_x,_y,255);
    ellipse(_x,_y,15,15);
  }
}


                
                
