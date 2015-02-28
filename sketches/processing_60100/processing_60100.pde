
int posx= 200;
int posy= 0;
int speed = 1;
int speedy = 3;

void setup(){
  size(400,600);
}

  
void draw(){
  background(random(255), random(255), random(255));
   posx = posx + speed;
  posy = posy + speedy;
  
  if(posx > 265){
    speed = -1;
  }
  
  if(posx < 130){
    speed= 1;
  }
    if(posy > 235){
    speedy = -3;
  }
  if(posy < 113){
    speedy =3;
  }
  
  noStroke();
  //body
  fill(random(255), random(255), random(255));
  rect(70,60, 260,440);
  
  //eye white
  fill(255);
  ellipse(200,172,180,180);
  
  //eye center
  fill (random(255), random(255), random(255));
  ellipse(posx, posy, 60, 60);
  
  //legs and arms
  fill (44,162,134);
  rect(287,287,25,133);
  rect(91,287,25,133); 
  rect(133,500,18,66);
  rect(247,500,18,66);
}

