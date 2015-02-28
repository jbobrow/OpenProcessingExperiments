
//variavel usada para desenhar o diagrama do fe3c
String[] nomesprec;
float Alavanca(){
  color c=-1;
  // nomesprec guarda o nome das duas fases( caso bifásico 
  // 0 é fase alfa + L, 1 é L, 2 é alfa
  //tomando um ponto(x,y), checa os pontos de x a composicao 0
  // e de x a composicao 100 em busca da linha vermelha ou preta
  //precisa tratar os diagramas antes
  if(tipo == 1){ 
    c = nicu.pixels[int(ycursor)*nicu.width+int(xcursor)];
    t =false;
    xinicio = linha1 = 70;
    xfim = linha2 = 678;
    for(float x = xcursor; x>xinicio; x-=5){
      c = nicu.pixels[int(ycursor)*nicu.width+int(x)];
      if((c==-5172969)||(c==-14475488)){
        if(t==false){
          linha1 = x;
        }
        t=true;
      }
    }
    t =false;

    for(float x = xcursor+5; x<xfim; x+=4){
      c = nicu.pixels[int(ycursor)*nicu.width+int(x)];
      if((c==-5172969)||(c==-14475488)){
        if(t==false){
          linha2 = x;
        }
        t=true;
      }
    }
    t =false;
  }

  if(tipo == 2){
    c = pbsn.pixels[int(ycursor)*pbsn.width+int(xcursor)];
    t =false ;
    xinicio = linha1 = 70;
    xfim = linha2 = 678;
    for(float x = xcursor; x>xinicio; x-=4){
      c = pbsn.pixels[int(ycursor)*pbsn.width+int(x)];
      if((c==-5172969)||(c==-14475488)){
        if(t==false){
          linha1 = x;
        }
        t=true;
      }
    }
    t =false;
    for(float x = xcursor; x<xfim; x+=4){
      c = pbsn.pixels[int(ycursor)*pbsn.width+int(x)];
      if((c==-5172969)||(c==-14475488)){
        if(t==false){
          linha2 = x;
        }
        t=true;        
      }
    }
    t =false;
  }

  if(tipo == 3){ 
    c = aco.pixels[int(ycursor)*aco.width+int(xcursor)];
    t =false;
    xinicio = linha1 = 70;
    xfim = linha2 = 678;

    for(float x = xcursor; x>xinicio; x-=4){
      c = aco.pixels[int(ycursor)*aco.width+int(x)];
      if((c==-5172969)||(c==-14475488)){
        if(t==false){
          linha1 = x;
        }
        t=true;
      }
    }
    t =false;

    for(float x = xcursor; x<xfim; x+=4){
      c = aco.pixels[int(ycursor)*aco.width+int(x)];
      if((c==-5172969)||(c==-14475488)){
        if(t==false){
          linha2 = x;
        }
        t=true;      
      }
    }
    t =false;
  }
    
  
  //aplicando a regra da alavanca
  //Sendo 1 o componente cuja linha fica a esquerda e 2 
  //o componente cuja linha fica a direita, e X,Y as 
  //coordenadas do ponto temos:
  //W2= (X-linha1)/(linha2-linha1)
  //(não precisando converter o comprimento em pixels
  //para composição, por ser uma fração)
  if(fase=="PERLITA"){
    if(xcursor<139){
      //achando a porcentagem de Fe3C na fase perlitica
      W2 = (139-xcursor)/(139-78);
      W1 = (-(xcursor-linha1)/(linha2-linha1) + (xcursor-78)/(139-78))/
        ((xcursor-78)/(139-78));
      if(W2>1) W2=1;
    }
    else{
      W1 = (-(linha2-xcursor)/(linha2-linha1) + (687-xcursor)/(687-139))/
        ((687-xcursor)/(687-139));
      W2 = (687-xcursor)/(687-139);
    }
  } 
  else  W2= (xcursor-linha1)/(linha2-linha1);  
    
 
  return W2;
}

void composicao(){
  if((tipo == 1)||(tipo == 2)){
    composicao = ((xcursor-xinicio)*100/(xfim-xinicio));
  }
  else{
    composicao = (xcursor-xinicio)*6.7/(xfim-xinicio);
  }
}

void temperatura(){
  if(tipo == 1){
    temperatura =600*(ycursor-539)/(70-539)+1000;
  }
  if(tipo == 2){
    temperatura = (300)*(ycursor-539)/(137-539);
  }
  if(tipo == 3){
    temperatura = (1200)*(ycursor-539)/(70-539)+400;
  }
}



