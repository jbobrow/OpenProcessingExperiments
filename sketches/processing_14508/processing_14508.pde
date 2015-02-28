
float len = 100;
float theta; 
float sides = 5;
float angle = radians(360/sides);
void setup(){
  size(400,400);
  background(0xFFFFFF);
  smooth();
  noFill();
}

void draw(){
translate(width * .5, height * .5);
background(0xFFFFFF);
float a = (mouseX / (float) width) * 90;
theta = radians(a);
for(int i = 0 ; i < sides; i++){
  pushMatrix();
  translate(cos((TWO_PI/sides)*i) * len * .15,sin((TWO_PI/sides)*i) * len * .15);
  rotate(angle * i);
  recurse(len);
  popMatrix();
}
}

void keyReleased() {
 switch(keyCode){//check for key input
   case 65://a
   if(len < 400) len+= 5;//increase the number of circles
   break;
   case 90://z
   if(len > 40) len-= 5;//decrease the number of circles
   break;
   case 83://s
   if(sides < 32) sides++;//increase the initial radius
   angle = radians(360/sides);
   break;
   case 88://x
   if(sides > 3) sides--;//decrease the initial radius
   angle = radians(360/sides);
   break;
 }
}

void recurse(float len){
  len /= 1.66;
  boolean flip = false;
  if(len > 10){
    pushMatrix();
    translate(0,len * 1.33);
    flip = !flip;
    if(flip)rotate(theta + radians(90)); 
    else rotate(theta);
    arc(0,0,len,len, -HALF_PI, HALF_PI);
    recurse(len);
    popMatrix();
    
    pushMatrix();
    translate(0,len * 1.33);
    rotate(-theta);
    arc(0,0,len,len, -HALF_PI, HALF_PI);
    recurse(len);
    popMatrix();
  }
}

