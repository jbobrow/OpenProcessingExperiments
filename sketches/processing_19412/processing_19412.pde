
Hamburger[] hamburgers = new Hamburger[10];

int hamburgerTemp = 50;

void setup(){
  size(400,400);
  smooth();
  
  for(int i = 0; i < hamburgers.length; i++){
    hamburgers[i] = new Hamburger(hamburgerTemp,0,0,random(1,3),random(0,255),random(0,255),random(0,255));
  }
  
  }


void draw(){
  background(245);
  
  for(int i = 0; i < hamburgers.length; i++){
    hamburgers[i].display();
    hamburgers[i].move();
    hamburgers[i].change();
  }
  
  for(int j = 1; j < 8; j = j+2){
    stroke(100,50,5);
    strokeWeight(hamburgerTemp/12);
    line(0,j*hamburgerTemp,width-hamburgerTemp,j*hamburgerTemp);
  }
  
  for(int l = 2; l < 8; l = l+2){
    stroke(100,50,5);
    strokeWeight(hamburgerTemp/12);
    line(hamburgerTemp,l*hamburgerTemp,width,l*hamburgerTemp);
  }
    
}

void mousePressed(){
  Hamburger yummy = new Hamburger(hamburgerTemp,0,0,random(1,2),random(0,255),random(0,255),random(0,255));
  hamburgers = (Hamburger[]) append(hamburgers,yummy);
}

