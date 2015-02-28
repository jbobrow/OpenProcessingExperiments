

goutte[] gouttes = new goutte[0];




void setup(){
  size(400,400);
  background(0);
  stroke(255);noFill();
}


void draw(){
  background(0);
  int n = int(random(1,4));
  for(int a=0;a<n;a++){
  new goutte();
  }
  for(int a=0; a<gouttes.length;a++){
    gouttes[a].dessine();
  }
  while (gouttes[0].l>245){
     gouttes = (goutte[]) subset(gouttes, 1);
  }
}


class goutte{
  int x, y;float l;
  goutte(){
    x = floor(random(width));
    y = floor(random(height));
    l=0;
    line(x,0,x,y);
    gouttes = (goutte[]) append(gouttes, this);
  }
  void dessine(){
    l+=1; l*=1.08;
    stroke(255,  (255-l));
    ellipse(x,y, l, l*0.3);
  }
  
}

