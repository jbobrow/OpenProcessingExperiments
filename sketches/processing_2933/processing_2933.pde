
/*
build onto Jean-no's 'Quick and dirty color selector'
at
http://www.openprocessing.org/visuals/?visualID=2932
*/
slideBar[] controls;
PFont maTypo;

void setup(){
  size(350,500); 
  // creating a type using arial
  maTypo=createFont("arial",10, false);
  textFont(maTypo,10);
  // instancing of the three slidebars
  controls=new slideBar[6];
  controls[0] = new slideBar(10,10,300,16,0,255);
  controls[1] = new slideBar(10,30,300,16,0,255);
  controls[2] = new slideBar(10,50,300,16,0,255);
  controls[3] = new slideBar(10,434,300,16,0,255);
  controls[4] = new slideBar(10,454,300,16,0,255);
  controls[5] = new slideBar(10,474,300,16,0,255);
}

void draw(){
  noStroke();

  for(int a=0;a<5;a++){
    fill(
    round((controls[0].val * (5-a) + controls[3].val * a )/5)
      ,
    round((controls[1].val * (5-a) + controls[4].val * a )/5)
      ,
    round((controls[2].val * (5-a) + controls[5].val * a )/5)
      );
    rect(0,a*100,350,100);
  }
  for(int a=1;a<4;a++){
    for(int b=0;b<3;b++){
    fill(0);
    rect(50,a*100+22+b*20,28,16);
    fill(255);
    text(round((controls[0+b].val * (5-a) + controls[3+b].val * a )/5),54,a*100+34+b*20);
    }
  }
  

  stroke(0);
  for(int a=0;a<controls.length;a++){
    controls[a].dessine();
  }
}

void mouseReleased(){
  for(int a=0;a<controls.length;a++){
    controls[a].lache();
  }
}



