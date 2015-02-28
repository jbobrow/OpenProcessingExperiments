
int x=0;
int y=0;
int wateva=0;

void setup(){
 size(500,500);
 background(255); 
 frameRate(30);
}

void draw(){
  if(wateva==0){
    exxpand();}
  else
    shrink();
}

void shrink(){
  if(x<1||y<1){
    wateva=0;
    randomFill();
  }
  else
    background(255);
    ellipse(mouseX,mouseY,x-1,y-1);
    x--;
    y--;
}


void exxpand(){
  if((x/2)+mouseX>500||(y/2)+mouseY>500||mouseX-(x/2)<0||mouseY-(y/2)<0){
    wateva=1;
    randomFill();
  }
  else
    background(255);
    ellipse(mouseX,mouseY,x+1,y+1);
    x++;
    y++;
}
void randomFill(){
   int r = (int)random(256);
   int g = (int)random(256);
   int b = (int)random(256);
   fill(r,g,b);
}


