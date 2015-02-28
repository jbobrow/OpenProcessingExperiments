
float y = 180;
float z =180;

void setup (){
  size(200,200);
  noStroke();
  frameRate(30);


}

void draw(){
  background(0);
  
  fill (255);//identificação
  strokeWeight(2);
textSize(8);
text("Luana Vedovello- 2S=2012", 100, 197);
  
  int x=110;
  fill(230,230,230); //quadras
  rect(20,20,70,70);
  rect(x,20,70,70);
  rect(20,x,70,70);
  rect(x,x,70,70);
  
  fill(200,200,200); //1a quadra
  rect(25,25,25,35);
  fill(120,120,120);
  rect(25,65,60,20);
  fill(180,180,180);
  rect(55,25,30,35);
  
  
  fill(180,180,180);
  rect(5+x,25,25,35);//2a quadra
  fill(200,200,200);
  rect(5+x,65,60,20);
  fill(120,120,120);
  rect(35+x,25,30,35);
  
  fill(100,100,100);
  rect(25,5+x,25,35);//3a quadra
  fill(200,200,200);
  rect(25,45+x,60,20);
  fill(180,180,180);
  rect(55,5+x,30,35);
  
  fill(200,200,200);
  rect(5+x,5+x,25,35);//4a quadra
  fill(180,180,180);
  rect(5+x,45+x,60,20);
  fill(120,120,120);
  rect(35+x,5+x,30,35);
  
  for(int i=15; i<180; i=i+20) {//faixas
   noStroke();
    fill(255,255,0);
    rect(i,8,10,2);
    rect(8,i,2,10);
    rect(100,i,2,10);
    rect(190,i,2,10);
    rect(i,100,10,2);
    rect(i,190,10,2);
  }
  
  fill(0);//quadrado preto ao meio
  rect(95,95,10,10);
  
  y=y-1;//animação carros
  if (y<0) {
    y=height;
  }
  fill(0,100,0);
  rect(10,y,10,15); //carros subindo
  fill(100,0,0);
  rect(100,y,10,15);
  fill(0,0,200);
  rect(190,y,10,15);

}
