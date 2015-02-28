
void setup(){
 size(400,400, P3D); 
 background(255);
}
void draw(){
  creature(width/2, height/2, random(500));
  
}

void creature(float x, float y, float radius){
  fill(random(255),random(255),random(255));
  ellipse(x,y,radius,radius);
  if (radius>2){
    fill(random(255),random(255),random(255));
   creature(x+radius/random(10), y, radius/2);
   fill(random(255),random(255),random(255));
   creature(x-radius/random(10), y, radius/2);
   fill(random(255),random(255),random(255));
   creature(x, y+radius/random(10), radius/2);
   fill(random(255),random(255),random(255));
   creature(x, y-radius/random(10), radius/2);
  
  }
}

