
void setup(){
  background(128,20,20);
  size(700,700);
  smooth();
}

void draw(){
  folha(255,30,50,70);
  folha(128,50,120,300);
  folha(30,400,600,30);
  folha(50,200,300,300);

for(int i=10;i<400;i=i+20){
    folha(200+i,100,i,300);
    }
}


void folha(int cor,int lado, int posx, int posy){
  strokeWeight(lado/20);
  fill(cor,cor/2,0);
  stroke(cor/2,cor/4,0);
  ellipse(posx,posy,lado,lado);
  line(posx,posy,posx,posy+lado/1.2);
  line(posx,posy,posx+lado/3,posy-lado/6);
  line(posx,posy,posx-lado/3,posy-lado/6);
}
