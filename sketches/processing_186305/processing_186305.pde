
void setup(){
size(400,400);
background(140);
noCursor();
}
int p=0;
void draw(){
  
  basichead();
  eyes();
  mouth();
  if (p>500){
    p=0;}
    
    if(p<-79){
      bonus();}
    
}
void mouseDragged(){
  p+=10;}
   
  void mouseReleased(){
  p-=10;}
   
  void basichead(){
 
    background(180,180,180+p);
   
    fill(255,255,255-p,p-100);
    ellipse(mouseX,0+p,130+p/2,100+p);
  }
   
  void mouth(){
    strokeWeight(2);
    fill(0);
  arc(mouseX, 35+p, 60, p, 0, PI);
  }
   
   void eyes(){
     float a=random(255);
     float b=random(255);
     float c=random(255);
    
      fill(150+a-p,150-p+b,150+c-p,130+p);
    ellipse(mouseX-20-p/45,10+p-(p/5),15+p/45,15+p/45);
        ellipse(mouseX+20+p/45,10+p-(p/5),15+p/45,15+p/45);
   }
   
 void bonus(){
   text("this is a gross shade of green", 200,200);}
