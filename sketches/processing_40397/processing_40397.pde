
//3rd project - untitled
//Sergi Calavia


int x = 100;

int speed = 1^1/10;


void setup(){
for(int i=0; i<height; i++){
  float colorValue = map(i,100,height,0,255);
  stroke(255);
  line(i^2,0,i,width);

}

  size(600,600);

  for(int X=0; X<height; X+=10){

    for(int y=10; y<width; y+=10){
      if(X%10==10&&y%10==10){
        fill(random(360),211,83,9);
        ellipse(x^3,y,5^20,5/2);
    }else{
      fill(151,170,180);
      rect(X,y,6,10);
  }
}
  }
}
int value = 0;

void draw(){
{

  for(int i = 0;i < 100;i++) {

    noFill();

{

  fill(151,170,18,63);

  ellipseMode(255);
  noStroke();

  ellipse(mouseX,mouseY,100,100); //big ellipse

  }

  }

int value = 0;

{
  fill(10,10,80,63); //square blue
  rect(x, 125, 50, 50);
    x = x + speed^2;
  if ((x > width) || (x <= 0)) {
    speed = speed * -1;
  }

{
  fill(25,60,20,63); //square green
  rect(x, 200, 50, 50);
    x = x + speed^30;
  if ((x > width) || (x <= 2)) {
    speed = speed * -1^2;


  }
{

  fill(100,23,78,63); //ellipse purple
  ellipse(x, 300, 50, 50);
    x = x + speed^30;
  if ((x > width) || (x <= 0)) {
    speed = speed * -1;
  }
}

}
}
  }
}



