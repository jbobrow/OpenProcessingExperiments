
square[] squares;

void setup(){  
  size(500,500, P2D);
  colorMode (HSB, 1, 1,1,1);
  background(1);
  squares = new square[0];
  for(int a=0;a<50;a++){
    for(int b=0;b<50;b++){
      new square(a*10,b*10);
    }
  }
  noStroke();
}

void draw(){ 
 for(int a=0;a<squares.length;a++){
   squares[a].dessine();
 }
}

class square{
  float c,x,y,v;
  square(float _x, float _y){ 
    x= _x; y=_y;
    c = random(1);v=random(-0.008,0.008);
  squares =(square[]) append(squares, this);
  }
  void dessine(){
    c+=v;if(c>1){c=0;}
    if(c<0){c=1;}
    if(random(50)<1){v=-v;}
    fill(c,0.95,0.95,0.4); 
    rect(x+random(-2,2),y+random(-2,2),10,10); 
 
  }
}


