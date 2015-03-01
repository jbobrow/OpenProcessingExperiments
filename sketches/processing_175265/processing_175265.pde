

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
 stroke(242, 242, 130, al);
 rad += 0.05;
 float x = width/2 + ((noise(rad)*300)*cos(theta));
 float y = height/2 + ((noise(rad)*300)*sin(theta));

 line( width/2, height/2, x, y);
 
 theta+=0.01;
 al += 0.01;
 if(al > 30){
   al = -1;
 }
 if(al<0){
   al = 1;
 }
}


