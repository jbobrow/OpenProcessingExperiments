
float x,y,z,angle,c;

void setup (){
  size (600,600);
  x=0;
  y=0;
  angle=10;
  c=0;
  smooth ();
 noStroke();
 
}

void draw (){
  background (0,20,c,20);
  c++;
  if(c==400){
    c=20;
  }
  
  float glowLight = sin(radians (angle));
  glowLight = map (glowLight,-3,1,255,0);
  fill (glowLight);
  bezier (mouseX,mouseY,200,200,mouseX,mouseY,200,200 );
  arc(mouseX,mouseY,13,13,height/2,mouseY);
  bezier(mouseY,mouseX, 50, 50,width/2,mouseX,mouseX,mouseY);
  rect(200,200,mouseX,mouseY,mouseX,mouseY);
  angle++;
}

void mouseDragged(){
  c=mouseX;
}

