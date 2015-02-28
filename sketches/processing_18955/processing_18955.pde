

void setup(){
  size(200,200);
  frameRate(50);

}

int x=0;
int y=20;
int z=0;

void draw(){
  if(x < width/2){
    colorMode(RGB,100);
    fill(x,10,10);
    ellipse(width/2,height/2,x,x);
    x++;
  }
  if(x < width*.75){
    colorMode(RGB,100);
    fill(x,10,y);
    ellipse(width/2,height/2,50,50);
    y++;
  }
  if(x < 175){
    colorMode(RGB,100);
    fill(0);
    ellipse(width*.1,height*.1,20,20);
    z++;
  }
  else{
    fill(0);
    ellipse(z,z,20,20);
  }
}

    


