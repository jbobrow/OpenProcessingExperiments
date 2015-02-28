

int a =10;
int b =10;
int c =10;
int i=0;
int j=0;
int x=5;
int y=5;
int z=130;
void setup(){
  size(255,255);
    textFont(createFont("Myriad Pro Light Italic", 11));
  textAlign(CENTER, CENTER);
}
void draw () {
  background(0);
  for (i=0;i<250;i=i+a){
    for (j=0;j<a*22;j=j+a){
       stroke(255,255,0);
       point(i,j);
       a = constrain(a,5,50);
    }
  }
  for(x=5;x<255;x=x+b){
    for (y=z/20;y<c*25;y=y+b){
      stroke(255,0,255);
      point(x,y);
      b = constrain(b,5,50);
      z = constrain(z,130,3000);

    }
  }
  if(mousePressed){
      a=a-1;
      z=z+1000;
      b=b-1;
      c=c+1;
      fill (255);
      text("cohesion | apo",width/2,height/2);

     
  } else {
    a=10;
    b=10;
    z=130;
    c=10;
  }
    
}
  



