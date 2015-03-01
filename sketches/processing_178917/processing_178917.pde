

 float theta = 0;
 float rad;
 float al = 10;

void setup(){
 size(500, 500);
 smooth();
 frameRate(200);
 background(0);
 rad = random(10); 
  stroke(240, 240, 150, al);
}

void draw(){
  //for(int i = 100; i < width ; i += 100){
  star(width/2, height/2, 300, 300);
  star(width/2, height/2, 50, 50);
  //star(width/2, height/2, 100, 100);
  
  //star(random(500), i, 30);
  //star(i, random(500), mouseY);
  //}

}

void star(float xpos, float ypos, float xsize,float ysize){ 

 rad += 0.05;
 float x = xpos + ((noise(rad)*xsize)*cos(theta));
 float y = ypos + ((noise(rad)*ysize)*sin(theta));

 line( xpos, ypos, x, y);
// line(xpos+200, ypos+100, x, y);
// line(xpos-200, ypos-100, x, y);
// fill(100, 10);
 //ellipse(x, y, 10, 10);
 
 theta+=0.01;
 al += 0.01;
 if(al > 30){
   
   stroke(random(255), random(255), random(255), al);
   al = -1;
 }
 if(al<0){
   al = 1;
 }
}


