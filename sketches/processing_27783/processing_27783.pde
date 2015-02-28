
float x,y,cor,r;
void setup(){
  size(screen.width,screen.height,P2D); 
  background(0);
  smooth();
x=0;
y=0;
}

void draw(){

  translate(x,y);
  repeteco(r,cor, 0.5 );
  
if(x>width){
  x=-100; 
  y=y+200;
}

if(y>height){
  y=height-width;
  x=width-height;
  }
 x=x+200;
 
 //velocidade
 noStroke();
 fill(0,0,0,mouseY/10);
 ellipse(0,0,width*2,height*3);
}
void repeteco(float r,float cor, float s){
  scale(s); 
  fill(255,random(45),0);
  ellipse(-100,-100,200,200);
  
  fill(255,random(45),0);
  ellipse(70,-100,200,200);
  
  fill(255,0,0);
  triangle(-173,-30,143,-30,-20,150);
  }
  
  void mouseClicked(){
  save("tela" + hour()+second()+ ".jpg"); 
}

