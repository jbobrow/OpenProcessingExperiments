
//init moverline
moverline[] mvr;
int nmb=100;

void setup(){
  size(500,500);
  
  //initialize here
  background(255);
  mvr=new moverline[nmb];
  
  for(int a=0;a<mvr.length;a++){
    mvr[a]=new moverline(width/2,height/2);
  }
}

void draw(){
  //draw it
  for(int a=0;a<nmb;a++){
    mvr[a].interact();
    mvr[a].trail();
  }
}

void mousePressed(){
  //generated by clicks
  background(255);
  
  for(int a=0;a<mvr.length;a++){
    mvr[a]=new moverline(width/2,height/2);
  }
}

/*
void keyPressed(){
  //save that
  if(key == 's'){
    String gal="dreamerly_"+day()+month()+year()+hour()+minute();
    save(gal);
  }
}
*/

