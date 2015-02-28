
int a = 400;

void setup(){
    background(random(0,255),random(0,255),random(0,255));
    stroke(random(255),random(0,255),random(0,255));
    fill(0,random(255),random(255),25);
  size(400,400);
  smooth();
  frameRate(8);
}
void draw(){   
  if(mousePressed){

    background(random(0,255),random(0,255),random(0,255));
     stroke(random(255),random(0,255),random(0,255));
    fill(0,random(255),random(255),25);
    
  }else if(a<401&&a>-401){
   
    ellipse(mouseX,mouseY,a,a);
      a=a-20;
    }else if(a<-401){
      a=a+400;
    }else{
    }

}                                                               
