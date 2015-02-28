

void keyPressed(){
   if (key ==' '){
      doColors();
   } 
}


void setup(){
   size(250,250,P3D); 
      doColors();   
}
  float c1r ;//= random(128,255);
  float c1g ;//= random(128,255);
  float c1b ;//= random(128,255);
  float c2r ;//= random(128,255);
  float c2g; //= random(128,255);
  float c2b; //= random(128,255);

void       doColors(){
   c1r = random(128,255);
   c1g = random(128,255);
   c1b = random(128,255);
   c2r = random(128,255);
   c2g = random(128,255);
   c2b = random(128,255);
}
float xspeed,yspeed,zspeed;
float xa,ya,za;  

void draw(){
  background(128);

   directionalLight(255, 255, 255, 0, 0, -1);
//ambientLight(102, 102, 102);

pushMatrix();
  translate(125,125);

xa += xspeed;
ya += yspeed;
za += zspeed;
xspeed *= .99;
yspeed *= .99;
zspeed *= .99;


//  rotateX(-.4);
  rotateX(xa);
  rotateY(ya);
  rotateZ(za);
noStroke();
  
  //stroke(c1r*3/4,c1g*3/4,c1b*3/4);  
  //strokeWeight(2);
  fill(c1r,c1g,c1b);  

  box(100,100,100);
  fill(c2r,c2g,c2b);  
    stroke(c2r,c2g,c2b);  

  pushMatrix();
  translate(0,-60,0);
  sphere(20); 
  popMatrix();
  noStroke();
  //top
  pushMatrix();
  translate(0,-51,0);
  box(101,1,30);
  box(30,1,101);
  popMatrix();
  //bottom
  pushMatrix();
  translate(0,51,0);
  box(101,1,30);
  box(30,1,101);
  popMatrix();
//side
  pushMatrix();
  translate(-51,0,0);
  box(1,101,30);
  popMatrix();
  pushMatrix();
  translate(51,0,0);
  box(1,101,30);
  popMatrix();

//side
  pushMatrix();
  translate(0,0,-51);
  box(30,101,1);
  popMatrix();
  pushMatrix();
  translate(0,0,51);
  box(30,101,1);
  popMatrix();
  
popMatrix();

  
}

void mouseDragged(){
   yspeed = (mouseX-pmouseX)/20.0;
  zspeed = (pmouseX-screenX(mouseX,0,0))/50.0;
  xspeed = (pmouseY-mouseY)/20.0;
//  println(xspeed+" "+yspeed+" "+zspeed);
}
void mousePressed(){
xspeed = yspeed = zspeed = 0;
}
void doMove(){
 
}

