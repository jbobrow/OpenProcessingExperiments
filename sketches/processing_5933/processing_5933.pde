

color bg=color(20,10,0);
color fg=color(65,60,50);
float deckung=180;//alpha-wert, mit dem die neue farbe die alte überdeckt
float deckung2=100;//alpha-wert mit der das zeichen vor dem neumalen mit dem hintergrund überdeckt wird
boolean bw=false ;

void setup(){
  size(640,640);
  background(bg);
  noStroke();
  fill(fg);
  frameRate(30);
}



void malmuster(int zeile,int spalte){
  int  zufall;
  int startx,starty;
  fill(bg,deckung2);
  rect(80*zeile,80*spalte,80,80);
  if(bw==false){
    fg=color(65+random(-65,140),60+random(-60,120),50+random(-50,100));
  }
  fill(fg,deckung);
  for(int i=0;i<3;i++){
    for (int j=0;j<3;j++){
      zufall=round(random(-0.5,5.5));
      startx=80*zeile+7+i*22;
      starty=80*spalte+7+j*22;
      switch(zufall){
      case 0:
        rect(startx,starty,22,22);
        break;
      case 1:
        break;
      case 2:
        rect(startx,starty,22,11);
        break;
      case 3:
        rect(startx,starty+11,22,11);
        break;
      case 4:
        rect(startx,starty,11,22);
        break;
      case 5:
        rect(startx+11,starty,11,22);
        break;
      }
    }  
  }
}

void draw(){
  int i=round(random(-0.5,7.5));
  int j=round(random(-0.5,7.5));
  malmuster(i,j);
  delay(100);
}
void keyReleased(){
  switch(key){
  case '1':
    bw=false ;
    bg=color(20,10,0);
    fg=color(65,60,50);
    background(bg);
    deckung=180;
    deckung2=100;
    break;
  case '2':
    bw=false ;
    bg=color(20,10,0);
    fg=color(65,60,50);
    background(bg);
    deckung=180;
    deckung2=255;

    break;
  case '3':
    bw=false ;
    bg=color(20,10,0);
    fg=color(65,60,50);
    background(bg);
    deckung=255;
    deckung2=100;
    break;
  case'4':
    bw=true ;
    deckung2=190;
    bg=color(255,255,255);
    fg=color(0,0,0);
    background(bg);
    break;
  }
}




