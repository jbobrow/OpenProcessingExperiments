
void setup(){
  
  size(700,400);
  background(5,5,20);
  smooth();
  translate(width/2,height/2);

}

void draw(){
    

 
  
}

void mouseClicked(){
  translate(mouseX,mouseY);
  int mx = 0;
  int my = 0;
  int x = 0;
  float xt = 12;

  fill(255,127,0,30);
  noStroke();
  
  int y = 0;
  
  while (y < 10){
    quad(0,0,xt/2+xt/2,0,xt+xt,xt/12+(xt/11),xt/2,xt/12+(xt/11));
    rotate(radians(10));
    
    x = x+10;
    if(x==360){y=y+1;x=0;xt=xt*1.2;rotate(radians(1));}}
}

