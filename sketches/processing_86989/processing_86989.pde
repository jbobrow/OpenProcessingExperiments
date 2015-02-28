
void setup(){
  size(300,300);
  ellipseMode(CORNER);
}
 
boolean[][] lgt=new boolean[20][20];
void draw(){
  background(#ffffff);
   
  for(int a=0;a<20;a++){
    for(int b=0;b<20;b++){
      if(a*15<mouseX && mouseX<a*15+12 && b*15<mouseY && mouseY<b*15+12){
        lgt[a][b]=true;
      }
      if(lgt[a][b]==true){stroke(50);fill(random(255));}else{fill(#ffffff);stroke(90);}
      ellipse(a*15,b*15,12,12);
    }
  }
}
