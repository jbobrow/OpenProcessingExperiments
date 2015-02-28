
slideBar[] controls;
PFont maTypo;

void setup(){
  size(500,500); 
  // creating a type using arial
  maTypo=createFont("arial",10, false);
  textFont(maTypo,10);
  // instancing of the three slidebars
  controls=new slideBar[3];
  controls[0] = new slideBar(10,10,300,16,0,255);
  controls[1] = new slideBar(10,30,300,16,0,255);
  controls[2] = new slideBar(10,50,300,16,0,255);
}

void draw(){
  background(controls[0].val,controls[1].val,controls[2].val);
  for(int a=0;a<controls.length;a++){
    controls[a].dessine();
  }
}

void mouseReleased(){
  for(int a=0;a<controls.length;a++){
    controls[a].lache();
  }
}


