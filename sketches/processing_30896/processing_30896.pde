
float n = 0, inc = .01, imod;

void setup(){
  translate(50,50);
  background(0);
  noStroke();
  ellipse(0,0,100,100);
}

void draw(){
  imod = mouseY * .003;
  float theta = n;
  float dx = sin(theta);
  float dy = cos(theta);
  float l = 50;
  
  for(float i = 0; i < l; i++){
    set((int)(i*dx)+width/2,(int)(i*dy)+width/2,color(noise(n,i*imod)*255));
  }
  n+=inc;
}


//not as interesting:

/*void keyPressed(){
  if(key == '=' || key == '+'){
    imod += .05;
  }else if(key == '-' || key == '_'){
    imod -= .05;
  }else if(key == 'r'){
    imod = .01;
  }
}*/

