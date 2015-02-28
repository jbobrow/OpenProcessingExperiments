

//Eye myEye;
//Eye myOtherEye;


Eye[] eyeballs = new Eye[12];

float body_x, body_y;


void setup(){
  size(600,600);
  smooth();
  
  body_x= width/2;
  body_y= height*0.8;
  
  
  for(int i=0; i < eyeballs.length; i++) {
    color eyeColor= color(random(10,70));
    eyeballs[i]= new Eye (random(0,width), random(0,height),eyeColor);
  }
}

void draw() {
  
  background(120);
  
  body_x+=random(-1,1);
  body_y+=random(-1,1);
  
  for(int i=0; i<eyeballs.length; i++){
  eyeballs[i].draw();
  }
  
}

class Eye {
  float x;
  float y;
  float pupil_x;
  float pupil_y;
  color eye_color;
  
  
 Eye(float init_x, float init_y, color init_color){
   
  x=init_x;
  y=init_y;
  eye_color=init_color;
 }
 
 void draw(){
   x=x+random(-1,1);
   y=y+ random(-1,1);
   
   //draw stakl
   stroke(200,0,100);
   strokeWeight(20);
   line(body_x, body_y, x, y);
   
   //draw eyeball
   pushMatrix();
   translate(x,y);
   noStroke();
   fill(0,100,100);
 
   ellipse (0,0,120,100);
   
   float angle= atan2(mouseY-y, mouseX-x);
   pupil_x=lerp(pupil_x, 25*cos(angle), 0.1);
   pupil_y=lerp(pupil_y, 25*cos(angle), 0.1);
   rotate(angle);

   
   
   translate(25,0);
   fill(eye_color);
   ellipse(0,0,70,80);
   popMatrix();
 } 
}

