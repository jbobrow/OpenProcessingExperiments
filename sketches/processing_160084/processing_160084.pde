
size(500,500);
int y=0;
int x=0;
while(x<width){
    while(y<height){
    float d=random(255);
    float q=random(255);
    float g=random(255);
    if(mousePressed){
    background(d,q,g);
    }
    fill(d,q,g);
    rect(x,y,10,10);
    y=y+10;
    }
    x=x+10;
  y=0;
}
