
class Writedot {
  float xpos;
  float ypos;
  int trans =0;
  boolean countonoff = true;
  
Writedot (float temp_xpos, float temp_ypos) {
 xpos = temp_xpos;
 ypos = temp_ypos;  
}

void display() {
 stroke (0);
 fill(trans, random(30,255));  //alpha value: 0 -255
 pushMatrix();
 //translate(random(10, 100), random(10, 100));
 ellipse (xpos, ypos, 4, 4); 
 popMatrix();
}

void move() {
  if (countonoff) {
    trans+=5;
    if (trans == 255) {
      countonoff = false;
    }
  }else{
   trans-=5; 
    if (trans == 100) {
      countonoff = true;
     }
 }

 }

}

