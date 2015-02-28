
//Owaun Scantlebury
//Spectrum Draw
//December 1st 2011

PImage spectrum;

int w=255;
int h =255;
PVector over=new PVector(w/2,h/2,0);
boolean firstrun = true;
void setup(){

  size(510,255);
  smooth();
if(firstrun)
 {spectrum=loadImage("http://3.bp.blogspot.com/-HjkKn49YHVQ/Tte_e78eoaI/AAAAAAAAAbc/2voCkyTs9J4/s1600/spectrum.png");
  //"c:\\data\\spectrum.png");
  spectrum.resize(w,h);
 }
  background(255);
  image(spectrum,0,0);
firstrun = false;
}
PVector [] cc  = new PVector [w*h];
color nowcol = 1;

void draw(){
  if(mousePressed)image(spectrum,0,0);
  noStroke();
  fill(setcol);
  rect(25,25,25,25); 
  stroke(255);
  ellipseMode(CENTER);

  fill(setcol,111);
  ellipse(over.x,over.y,25,25);
}


void mouseReleased(){

  if(mouseX<w)setcol = get(mouseX,mouseY);
  justmousedown= false;
}
color setcol=1;
boolean justmousedown= false;
void mousePressed(){
  justmousedown=true;

  lx=mouseX; //kicker A
  ly=mouseY; //kicker B
}

void mouseDragged(){
  if(mouseX>w){
    nowcol = setcol;
    if(mouseX!=lx || mouseY !=ly && justmousedown){
      justmousedown=false;
      stroke(nowcol);
      line(lx,ly,mouseX,mouseY); 
    }
    set(mouseX,mouseY,nowcol);

  }
  if(mouseX<w){

    over = new PVector(mouseX,mouseY,0);

  }
  lx = pmouseX;
  ly=pmouseY;
}
float lx;
float ly;


void keyPressed(){
  if(key=='c')setup(); 
}


