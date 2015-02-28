
//collaborative sketch

//i dont work!!! yay!!
float x, y, angle, glow, speed;

void setup(){
  size(800,800);
  x = 100;
  y = 200;
  angle = 0;
  speed = 1;
  glow= 0;
  smooth();
  background(0);
}

void draw(){
  stroke(12,175,32);
  x = radians(angle);
  
  glow = map(glow, -15,125,10, 100);
  for(int i = 0; i <800; i++){
    fill(i++,i++,mouseX, glow);
    x = tan(radians(angle) + 100 + width/2);
    y = random(radians(angle) + 100 + height/2);
      fill(random(glow),angle,100,50);
    ellipse(400, 400, random(mouseY), random(mouseX));
    rect(i,angle,glow,x);
    angle += speed;
    
    if (x>width && y>height){
   fill(glow,angle,47,50);
    x = cos(radians(glow) * 500 + width/2);
    y = sin(radians(glow) * 100 + height/2);   
  }
}
}

