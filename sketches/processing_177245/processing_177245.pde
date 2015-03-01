

 float theta = 0;
 float rad;
 float al = 10;

void setup(){
 size(500, 500);
 smooth();
 frameRate(60);
 background(0);
 rad = random(10); 
}

void draw(){
  for(int i = 100; i < width ; i += 100){
  star(i+50, height-i, 50);
  star(random(500), i, 30);
  star(i, random(500), mouseY);
  star(i, i+50, 20);
  }

}

void star(float xpos, float ypos, float size){ 
 stroke(242, random(255), random(255), al);
 rad += 0.05;
 float x = xpos + ((noise(rad)*size)*cos(theta));
 float y = ypos + ((noise(rad)*size)*sin(theta));

 line( xpos, ypos, x, y);
 
 theta+=0.01;
 al += 0.01;
 if(al > 30){
   al = -1;
 }
 if(al<0){
   al = 1;
 }
}


