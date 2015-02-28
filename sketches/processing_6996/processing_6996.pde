
int XS = 10;
int YS = 10;
int WS = 20;
color carray[] = new color[XS*YS];

void setup(){
  size((XS*WS)+1, (YS*WS)+1);  
  randomize();
}

void randomize(){
  for(int i=0;i<carray.length;i++){
    carray[i]=color(random(256),random(256),random(256));
  }
  boxes_update();
}

void boxes_update(){
  int a,b,i=0,c,d;
  for(b=0;b<(YS*WS);b+=WS){
    for(a=0;a<(XS*WS);a+=WS){
      fill(carray[i]);
      c=a+WS;
      d=b+WS;
      quad(a,b,c,b,c,d,a,d);
      i++;
    }
  }
}

void check(){
  for(int i=1;i<carray.length;i++){
    if( carray[0] != carray[i] ){
      return;
    }
  }
  randomize();
}


void draw(){
  if( !mousePressed || mouseX > (XS*WS) || mouseY > (YS*WS) || mouseX < 0 || mouseY < 0 ){ 
    carray[(int)random(XS*YS)] = carray[(int)random(XS*YS)];
  } 
  else {
    carray[(int)random(XS*YS)] = carray[abs(((XS*((int)(mouseY/WS)))+((int)(mouseX/WS)))%(XS*YS))];
  }  
  boxes_update();
  check();
}

