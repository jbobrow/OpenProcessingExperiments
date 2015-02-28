
int j=80;
int k=0;
int l=255;
boolean nachRechtsGelaufen=true;

void setup(){
  size(600,600);
}

void draw(){
  background(mouseX,mouseY,0);
  
  //ZÃ�HLSCHLEIFE
  // for(INITIALISIERUNG; FORTSETZUNGSBEDINGUNG; INKREMENT)ANWEISUNGSBLOCK
 /* for(int i=0;i<10;i++){
    rect(100+20*i+j,100+k,10,10);
  }*/
  noStroke();
  fill(l);
  rect(100+20+j,100+k,10,10);
  if(nachRechtsGelaufen){
    j=j+1;
  }else{
    j=j-1;
  }
  //IF-CLAUSE (Bedingte Verzweigung)
  //if(BEDINGUNG)ANWEISUNGSBLOCK
  if(j>200){
    nachRechtsGelaufen=false;
    k=k+10;
  }
  if(j<80){
    k=k+10;
    nachRechtsGelaufen=true;
  }
    if(mouseX==constrain(j, j+5, j-5) && mouseY==constrain(k, k+5, k-5)){
     l=0;
     text("hi",100,100);
  }
//  fill(100);
//  rect(mouseX-10,mouseY-10,20,20,3);
}
