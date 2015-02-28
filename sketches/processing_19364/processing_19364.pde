

int x=20;
PFont jake;

void setup(){
  size(250,250);
  jake=createFont("ariel", 36);

}

void draw(){
  background(120,200,120,80);
  textFont(jake,46);
  
  if(keyPressed){
     if(key=='a' || key=='A'){
   x=x+5;
if (x>250)
        fill(20,90,200);
        text("a",random(width),random(height)); 
     }
      if(key=='b' || key=='B'){
   x=x+5;
if (x>250) {x=5;}
        fill(200,0,0);
        text("b",random(width),random(height)); 
     }
      if(key=='c' || key=='C'){
   x=x+5;
if (x>250) {x=200;}
        fill(20,90,0);
        text("c",random(width),random(height)); 
     }
  }
  }

