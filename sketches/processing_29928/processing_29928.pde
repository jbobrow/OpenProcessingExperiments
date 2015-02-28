


class unite{
  int x,y; 
  int col,ran;
  int[] copains;int[] rectangle = new int[4];
  boolean vive;
  color xcores; //mudança de cores
  unite(int colonne, int rangee , color c){ //colunas que apertam
    copains = getCopains(colonne, rangee);
    col = colonne;
    ran = rangee;
    x=colonne*taille+t2;
    y=rangee*taille+t2;
    rectangle[0]=x-t2;
    rectangle[1]=y-t2;
    rectangle[2]=x+t2;
    rectangle[3]=y+t2;
    xcores = c;
    unites = (unite[]) append(unites, this); 
    vive = false;
  } 
  void dessine(){
    if(vive){

    } 
    else {
      alive+=1;
      fill(colors[xcores]);
      rect(x,y,taille,taille);
    }
  }
  void verifieClic(int mx,int my){
    if (!vive){ 
      if(rectangle[0]<=mx && rectangle[1]<=my && rectangle[2]>=mx && rectangle[3]>=my){
    
        int[] tok=new  int[0];
        vive = true;
        tok = desaparece(tok);
        if(tok.length == 0){
          vive = false;
        }
      }
    }
  }
  void efface(){
    int[] tok=new  int[0];
    vive = true;
    tok = desaparece(tok);
  }
  void tombe(){
    if(!vive ){
      colonnes[col]++;
      if(copains[4] != -1){
        if( unites[copains[4]].vive){
          unites[copains[4]].xcores = xcores;
          vive = true;
          unites[copains[4]].vive=false;
        } 
      } 
    }
  }
  int[] desaparece(int[] tokill){ 
    for(int a=0;a<copains.length;a++){
      if(copains[a]!=-1 && unites[copains[a]].xcores == xcores ){
        if(! unites[copains[a]].vive){
          int[] oldToKill =  tokill ;
          tokill= ajoute(tokill, copains[a]);
          if(tokill != oldToKill){
            unites[copains[a]].efface();  
            scoreprovisoire++; //scoreprovisoire*0.5; 
          }
        }
      }
    }    
    return tokill;
  }
  void decalegauche(int colonne){
    if(vive == false && col>0 && col ==colonne+1){
      unite c = unites[copains[1]]; 
      c.vive = false;
      c.xcores=xcores;
      // xcores = -1;
       vive = true;  
    }
  }
}

int[] getCopains(int c, int r){
  int[] copains = {
    (r)+(c)*nh , -1,-1,-1,-1            };
  if(c>0){
    copains[1] =  (r+(c-1)*nh);
  }
  if(c<(nw-1)){
    copains[2] =  (r)+(c+1)*nh;
  }
  if(r>0){
    copains[3] =  (r-1)+(c)*nh;
  }
  if(r<(nh-1)){
    copains[4] =  (r+1)+(c)*nh;
  }  

  return copains;
}

int[] ajoute(int[] l, int u){
  boolean dont = false;
  for(int a=0;a<l.length;a++){
    if(l[a]==u){
      dont=true;
    }
  } 
  if(!dont){
    l = append(l, u);
  }
  return l;
}







