
float x;
float y;

int azul;
int rojo;
int negro;

PFont mitipo;

void setup(){
   size(700,500);
   
  mitipo=loadFont("NewsGothicMT-Bold-48.vlw");

azul=0;
rojo=0;
negro=0;

}

void draw(){

    background(255);
  smooth();
  noFill();
  strokeWeight(15);
  
x=int (random(0,800));
y=int (random(0,500));

textFont(mitipo,100);

  //blue ring
if ((x!=175) && (y!=200) && (azul!=1)){
      fill(0,0,300);
  text("A",x,y);
}

else{
      fill(0,0,300);
   text("A",200,200);
  azul=1;
}

  //black ring
if ((x!=350) && (y!=200) && (negro!=1)){
      fill(0,200,200);
  text("L",x+50,y);
}

else{
      fill(0,200,200);
   text("L",300,200);
  negro=1;
}

  //red ring
if ((x!=525) && (y!=200) && (rojo!=1)){
     fill(50,200,220);
  text("E",x+100,y);
}

else{
      fill(50,200,220);
  text("E",400,200);
  rojo=1;
  }

 
}

