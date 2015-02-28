
void setup(){
  size(400,300);
  colorMode(HSB,100);
  for(int a=0;a<3;a++){
    C[a]=color(#cccccc);
  }
}

int pickX=150;int pickY=210;
color[] C=new color[3];int idx;

void draw(){
  background(#ffffff);
  
  strokeWeight(2);
  for(int a=0;a<25;a++){
    for(int b=0;b<100;b++){
      stroke(b,a*5-10,100);
      point(b+pickX,a+pickY);
      stroke(b,125,100-a*4);
      point(b+pickX,a+25+pickY);
    }
  }
  
  if(mousePressed){
    for(int a=0;a<3;a++){
      if(80+80*a<mouseX && mouseX<a*80+78+80 && 50<mouseY && mouseY<170){idx=a;}
    }
  }
  noStroke();
  if(mousePressed && pickX<mouseX && mouseX<pickX+100 && pickY<mouseY && mouseY<pickY+50){C[idx]=get(mouseX,mouseY);}
  for(int a=0;a<3;a++){
    fill(C[a]);
    rect(80+80*a,50,78,120);
  }
  
  fill(50);
  textAlign(CENTER);textSize(12);
  text("color picker",width/2,pickY+70);
  textSize(15);fill(70);
  text("▼",120+idx*80,40);
}


