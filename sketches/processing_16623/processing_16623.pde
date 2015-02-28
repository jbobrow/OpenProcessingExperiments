
float x,y,Lx,Ly;
void setup(){
  size(800,600);
  background(0);
  smooth();
  x=+200;
  y=+250;
  Lx=0;
  Ly=0;
}

void draw(){
  background(0);
  translate(x,y);

 if (mousePressed==true){
    if (dist(x,y,mouseX,mouseY)<50){
      Lx=0;
      Ly=0;
      x=mouseX;
      y=mouseY;
    }
 }
  teste();

  x=x+Lx*50;
  y=y+Ly*20;

  if(x>750){
    fill(255,13,13);
    Lx=-Lx;
  }
  if(y>550){
    fill(0,211,195);
    Ly=-Ly;
  }
  if(x<50){
    fill(8,255,38);
    Lx=-Lx;
  }
  if(y<50){
     fill(255,245,8);
    Ly=-Ly;
  }

}

void teste(){

  ellipse(0,0,100,100);

}


void mousePressed(){
 
}

void mouseReleased(){
  Lx=(mouseX-pmouseX)/50.0;
  Ly=(mouseY-pmouseY)/50.0;
}




