
float speed = 20;
int diameter = 300;
float x;
float y;
float rj;
float sp;
float mg;
float gm;

void setup() {
  size(900,700);
  smooth();
  x = width/2;
  y = height/2;
}


void draw() {
  
  x += random(-speed,speed);
  y += random(-speed,speed);
  
  rj += random(-speed,speed);
  sp += random(-speed,speed);
  mg += random(-speed,speed);
  gm += random(-speed,speed);
  
  

  ellipse(x,y,diameter,diameter);
 
  rj += random(-speed,speed);
  rj += random(-speed,speed);
  ellipse(random(rj),random(rj),diameter,diameter);
 
  sp += random(-speed,speed);
  sp += random(-speed,speed);
  ellipse(random(sp),random(sp),diameter,diameter);
  


 mg += random(-speed,speed);
  mg += random(-speed,speed);
  ellipse(random(mg),random(mg),diameter,diameter);
 
 gm += random(-speed,speed);
  gm += random(-speed,speed);
  ellipse(random(gm),random(gm),diameter,diameter); 
 

 
  
  rj = random(200);
  fill(0,random(255),random(250),random(12));
  ellipse(400,350,rj,rj);

  sp = random(600);
  fill(random(242),random(181),random(24),random(32));
  ellipse(800,443,sp,sp);
  
   rj += random(-speed,speed);
  rj += random(-speed,speed);
  ellipse(random(rj),random(rj),diameter,diameter);
 
   
}


                
                
