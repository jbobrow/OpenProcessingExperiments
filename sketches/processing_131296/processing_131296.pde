
int j=80;
int k=0;
boolean nachRechtsGelaufen=true;
 
void setup(){
  size(600,600);
}
 
void draw(){
  background(mouseX,mouseY,0);
  fill(200,0,0);
   if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  rect(100+20+j,100+k,10,10);
  if(nachRechtsGelaufen){
    j=j+3;
  }else{
    j=j-3;
  }
  if(j>200){
    nachRechtsGelaufen=false;
    k=k+10;
  }
  if(j<80){
    k=k+10;
    nachRechtsGelaufen=true;
  }
}
