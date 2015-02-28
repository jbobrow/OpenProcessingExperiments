
class Draw{
  float x,y;
  int tamanho;
  PImage pi;
  Draw(float x, float y,int tamanho,PImage pi){
    this.x = x;
    this.y = y;
    this.tamanho = tamanho;
    this.pi = pi;
  }
  
  void renderRect(int alphaC){
    for(int i = 0; i<num; i+= tamanho){
      fill(getColor(pi,getx1+i,gety1),alphaC);
     // stroke(getColor(pi,mouseX+i,mouseY),cAlpha1);
      noStroke();
      rect(x+i,y,tamanho,tamanho);
      rect(x,y+i,tamanho,tamanho);
    }
  }
    
  void renderRect2(int alphaC){
    for(int i = 0; i<num; i+= tamanho){
      fill(getColor(pi,getx2,gety2+i),alphaC);
     // stroke(getColor(pi,mouseX,mouseY+i),cAlpha2);
      noStroke();
      rect(x,y+i,tamanho,tamanho);
      rect(x+i,y,tamanho,tamanho);
    }
  }
  
}
 

