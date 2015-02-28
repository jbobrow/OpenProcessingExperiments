
int i=0;
int j=0;
boolean b = true;
PFont tryFont;
boolean c = true;


void setup() {
  size(500,500);
  frameRate(360);
  tryFont = loadFont("TurntablzBB-48.vlw");
  colorMode(HSB,600);
}

void draw() {
 //Primary Bounce Rhythm   
  if(b){
    if(i<500){
      i=i+1;
    }
    else{
      b=!b;
    }
  }
  if(!b){
    if(i>40){
      i=i-1;;
      fill(random(0,600),600,600);
    }
    else{
      b=!b;
    }
  }
  
//Secondary Bounce Rhythm
  if(c){
    if(j<475){
      j=j+1;
    }
    else{
      c=!c;
    }
  }
  if(!c){
    if(j>25){
      j=j-1;;
      fill(random(0,600),600,600);
    }
    else{
      c=!c;
    }
  }
//End of Secondary Bounce
 
  background(0);
  smooth();
  noStroke();
  textFont(tryFont);
  text(">    b  u  c     <",20,i);
  text("        o  n  e    ",20,j);
  
  
  
}
  
    

