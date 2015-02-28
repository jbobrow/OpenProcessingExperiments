
int passos =10;

size(400,400);
rectMode(CENTER);
//noStroke();

stroke(27,160,148);

translate(width*.5,height*.5);

for(float i = 10; i > 0; i--){
  fill(250,200*i/10,100*i/10);
  rect(0,0,width*i/10,height*i/5);
}

