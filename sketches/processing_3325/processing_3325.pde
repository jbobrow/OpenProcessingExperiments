
/* TAKEN FROM  Simple rain
by Jean-no */
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
    x = floor(random(second()*random(0,20)));//determino el desplazamiento en x de las gotas a partir del tiempo tomado de los segundos
    y = floor(random(second()*random(0,20)));//determino el desplazamiento en y de las gotas a partir del tiempo tomado de los segundos
    l=0;
    line(x,0,x,y);//linea que cae y determina la posicion de la gota
    gouttes = (goutte[]) append(gouttes, this);
  }
  void dessine(){
    smooth();
    l+=1; l*=1.08;
    stroke(255,  (255-l));
    ellipse(x,y, l, l*0.3);
  }
  
}

