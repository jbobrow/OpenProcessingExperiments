
//import processing.opengl.*;

void setup(){
  if(online){
    size(640,480,P3D);
  } 
  else {
    int screensize = min(screen.width,screen.height);
    //screensize *= 0.8;
    size(screen.width,screen.height,P3D);
  }
  smooth();
}

int t = 1;
int seed = 0;
float speed = 2;
float rotxspeed = 0;
float rotyspeed = 0;
float rotzspeed = 0;
boolean rot3D = true;
boolean animate = true;
boolean rotBackColor = false;
boolean displayHelp = false;
int graphcount = 1;

void draw(){
  randomSeed(seed);

  if (animate) t++;
  if (rotBackColor)
    background(sin(t*0.01)*255,sin(t*0.02)*255,sin(t*0.03)*255);
  else
    background(0);


  fill(150);
  int p = 10; // pos
  int l = 15; // lineheight
  int c = 1; // linecounter
  text("(h)elp",p,l*c++);
  if (displayHelp){
    text("(d/D)epth:"+depth,p,l*c++);
    text("(s/S)eed:"+seed,p,l*c++);
    text("s(t/T)ep:"+step,p,l*c++);
    text("(r/R)ot:"+rot,p,l*c++);
    text("ro(3)D:"+rot3D,p,l*c++);
    text("size(x/X):"+sizex,p,l*c++);
    text("size(y/Y):"+sizey,p,l*c++);
    text("(b/B)ranches:"+branches,p,l*c++);
    text("(z/Z)oomstep:"+zoomstep,p,l*c++);
    text("s(p/P)eed:"+speed,p,l*c++);
    text("(g/G)raphcount:"+graphcount,p,l*c++);

    text("(a)nimate:"+animate,p,l*c++);
    text("rotBack(c)olor:"+rotBackColor,p,l*c++);
    text("rotxspeed<left/right>:"+rotxspeed,p,l*c++);
    text("rotyspeed<up/down>:"+rotyspeed,p,l*c++);
  }

  translate(width/2,height/2);

  rotateX(t*rotxspeed*speed);
  rotateZ(t*rotyspeed*speed);

  for (int g = 0; g < graphcount; g++){
    pushMatrix();
    // rotate 3D
    if (rot3D){
      if (animate){
        rotateX(radians(random(-180,180)));
        rotateY(radians(random(-180,180)));
        rotateZ(radians(random(-180,180)));
      }
      if (animate)
        rot = sin(radians(t*speed*random(-1,1)))*360/(float)branches;
      if (animate)
        rot2 = cos(radians(t*speed*random(-1,1)))*360/(float)branches;
      else
        rot2 = 0; 
    }
    graph();
    popMatrix();
  }

}

int depth = 5;
int step = 100;
float rot = 5.0;
float rot2 = 5.0;
int sizex = 50;
int sizey = 50;
float zoomstep = 0;
float branches = 8.0;

void graph(){

  for (int j = 0; j < branches; j++){
    // branch
    fill(random(255),random(255),random(255),random(255));
    int type = (int)random(4);
    float angle = 360.0 / (float)branches;
    rotateZ(radians(angle));
    //if (rot3D)
    //  rotateX(radians(10));
    //rotateZ(radians(rot2/10));
    pushMatrix();
    float zoom = 1;
    for (int i = 0; i < depth; i++){
      // step within a branch
      rotateZ(radians(rot));
      if (rot3D) rotateX(radians(10));
      translate(step,1,(rot3D?10:1));
      scale(zoom);
      form(type,sizex, sizey);
      zoom += zoomstep;
    }
    popMatrix();
  }
}

void form(int type, float sx, float sy){
  switch(type){
  case 0:
    quad(0,0,sx,0,sx-10,sy,0-10,sy);
    break;
  case 1:
    rect(0,0,sx,sy);
    break;
  case 2:
    ellipse(0,0,sx,sy);
    break;
  case 3:
    quad(0,0,sx,0,sx+10,sy,0+10,sy);
    break;
  default:
    triangle(0,0,sx*0.5,sy,sx,0);

  }
}

void keyPressed(){
  if (key == 'r') rot -= 1;
  if (key == 'R') rot += 1;
  if (key == 't') step -= 1;
  if (key == 'T') step += 1;
  if (key == 's') seed -= 1;
  if (key == 'S') seed += 1;
  if (key == 'x') sizex -= 1;
  if (key == 'X') sizex += 1;
  if (key == 'y') sizey -= 1;
  if (key == 'Y') sizey += 1;
  if (key == 'b') branches -= 1;
  if (key == 'B') branches += 1;
  if (key == 'z') zoomstep -= 0.001;
  if (key == 'Z') zoomstep += 0.001;
  if (key == 'd') depth -= 1;
  if (key == 'D') depth += 1;
  if (key == 'p') speed -= 0.1;
  if (key == 'P') speed += 0.1;
  if (key == 'g') graphcount = max(1,graphcount - 1);
  if (key == 'G') graphcount += 1;

  // toggles
  if (key == 'h') displayHelp = !displayHelp;
  if (key == '3') rot3D = !rot3D;
  if (key == 'a') animate = !animate;
  if (key == 'c') rotBackColor = !rotBackColor; 

  if (key == CODED) {
    if (keyCode == UP) {
      rotyspeed += 0.001;
    }
    if (keyCode == DOWN) {
      rotyspeed -= 0.001;
    } 
    if (keyCode == LEFT) {
      rotxspeed += 0.001;
    }
    if (keyCode == RIGHT) {
      rotxspeed -= 0.001;
    }
  }
}

















