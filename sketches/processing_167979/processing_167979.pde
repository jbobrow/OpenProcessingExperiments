
int o= #FFFFFF;
int s= #FC0898;
int c= #D908ED;
int a= #8B00F8;
int r= #0800F8;
int n= #00F888;
int i= #08F800;
int e= #F6FC16;
int t= #FC9016;
int v=255;
void setup()
{
  size(600,600);
  background(0);
}

void draw()
{
  if(mousePressed){
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  if(keyPressed){
    if(key=='o'){
      stroke(o);
    }
    if(key=='s'){
      stroke(s);
    }
    if(key=='c'){
      stroke(c);
    }
    if(key=='a'){
      stroke(a);
    }
    if(key=='r'){
      stroke(r);
    }
    if(key=='n'){
      stroke(n);
    }
    if(key=='i'){
      stroke(i);
    }
    if(key=='e'){
      stroke(e);
    }
    if(key=='t'){
      stroke(t);
    }
    if(key=='v'){
      stroke(v);
    }
  }
}
