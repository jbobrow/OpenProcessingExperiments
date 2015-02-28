
int partes= 15;
int division= 1200/partes;
int coldiv= 255/partes;  
boolean parte = false;
boolean noseleccionado = false;
int [] col;
int auxiliar;
int [] background;

void setup() {
  size(1200, 400);
  noStroke();
  fill(0);
 col = new int[partes+1];
 background = new int[partes+1];
 for (int i=0;i<partes;i++){
   if (partes==i){
    col[i]=255;
    background[i]=255;
   }
  else{ 
    col[i]=i*coldiv;
    background[i]=i*coldiv;
  }
 } 
}

void draw() {
  for(int j=0;j<partes;j++){
    fill(background[j]);
    rect(j*division,0,division,400);
  }
  for(int i=0;i<partes;i++){
    if(mouseX>=i*division && mouseX<=(i+1)*division){
      auxiliar=i;
      parte = true;  
      if(!noseleccionado) { 
        fill(background[auxiliar]);
        rect(auxiliar*division,0,division,400);
      } 
     else {
        fill(255,col[auxiliar],0);
        rect(auxiliar*division,0,division,400);
      parte = false;
    }
    }
  }
}

void mousePressed() {
  if(parte) { 
    noseleccionado = true; 
    fill(255,col[auxiliar],0);
    rect(auxiliar*division,0,division,400);
  } else {
    noseleccionado = false;
  } 
println("255, "+col[auxiliar]+",0"); 
}

void mouseReleased() {
  noseleccionado = false;
}
