
int kolor=0;
float Xmono,Ymono,Xojo1,Yojo1,Xojo2,Yojo2;
void setup(){
  size(600,600);
  background(0);
  rectMode(CENTER);
  Xmono=width/2;
  Ymono=height/2;
}
void draw(){
      background(0);
      for(int i=0;i<width+20;i+=10){
      line(i,mouseY,mouseX,i);
      stroke(kolor,mouseY,mouseX);
      strokeWeight(4);
      smooth();
      if (kolor>256)kolor=10;
      else
      kolor= kolor + 4;
      }
   
   
   
  Xojo1=map(mouseX,-width,width,Xmono-51,Xmono-9);
  Yojo1=map(mouseY,-height,height,Ymono-51,Ymono-9);
  Xojo2=map(mouseX,width,-width,Xmono+31,Xmono-12);
  Yojo2=map(mouseY,-height,height,Ymono-51,Ymono-9);
  fill(240);
  ellipse(Xmono,Ymono,120,120);
  fill(0);
  rect(width/2-20,height/2-20,30,30);
  rect(width/2+20,height/2-20,30,30);
  fill(255);
  rect(Xojo1,Yojo1,9,9);
  rect(Xojo2,Yojo2,9,9);
  fill(0);
  rect(Xmono,Ymono+27,30,10);

}
