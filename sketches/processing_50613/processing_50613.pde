
int vertical;
int mano;


void setup(){
  size (600,600);
  smooth();
  strokeWeight(3);
vertical=0;
mano=0;
  background(random(255),random(255),random(255));
  stroke(random(255),random(255),random(255));
  
}

void draw(){
  
  line(0,vertical,599,vertical);
  
  if (mano==0){  //cuando la linea baja
  vertical=vertical+1;
  }
  if(vertical>599) { //cuando la linea llega hasta abajo
    stroke(random(255),random(255),random(255));
    mano=1;
  }
  if (mano==1){ //cuando la linea sube
    vertical=vertical-1;
  }
  if (vertical<=0){ //cuando la linea llega hasta arriba
    stroke(random(255),random(255),random(255));
    mano=0;
  }
}             
