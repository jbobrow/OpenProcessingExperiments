
void setup(){
  setCanvas();

}

void draw(){
  for (int i=0;i<8;i++){
    for(int j=0;j<8;j++){
      drawRect(i*60-10, j*60-10,40,10,70+i*15,j*20);
    }
  }
  if (mousePressed==true){
    for (int t=0;t<8;t++){
    for(int s=0;s<8;s++){
      
      drawRect(t*60-10, s*60-10,40,0,255-t*25,255-s*25);
    }
  }
}
}

void drawRect(int x,int y,int l,int r,int g,int b){
  fill(r,g,b);
  rect(x,y,l,l);
  noStroke();
}
  
void setCanvas(){
  size(450,450);
  background(0);
}



