
void setup(){
  size(800,600);
  background(150);
  frameRate(30);
  
}


float b=10;
float a=10;
float c=0;
float d=0;
float e=0;
float f=5;
float g=5;
void draw() {
  background(150);
  noStroke();
  //if(mousePressed){
    //float a=mouseX/6;
    //float b=mouseY/4;
    //float c=mouseY/30;
    //float d=mouseX/40;
  
for(float y=0;y<625;y=y+b){
     //fill(random(0,255));
   for(float x=0;x<800;x=x+a){
    fill(c,d,e);
 
  rect(x,y,f,g);
  
 

}
}  
  }
  void mousePressed(){
    b=mouseY/3;
    a=mouseX/5;
    c=mouseX;
    d=mouseY;
    e=mouseX*mouseY/100;
   
  }
  
  void keyPressed(){
  if (keyCode == RIGHT){
  f=f+5;
  }  
  else if (keyCode==LEFT){
  f=f-5;
  }
  else if(keyCode==DOWN){
   g=g+5;  
  }
  else if(keyCode==UP){
   g=g-5;  
  }
  } 

