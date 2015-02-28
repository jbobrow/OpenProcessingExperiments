
float angle = 0.0;
float speed = 0.05;
float radius = 30.0;
float sx = 2.0;
float sy = 2.0;


//
void setup (){
size(1000,520,P3D);
background (0);
noStroke();
}


//
void draw(){
  if(mousePressed == true){
    lights();
  } 
  
  // 3D X + O
  noStroke();
  pushMatrix();
  translate (1000, 550, -550);
  rotateY(PI/9);
  box(1710,90,100);
  box(100,90,800);
  pushMatrix ();
  popMatrix();
  translate(0,-400,0);
  sphere(260);
  popMatrix();
  
  
 //
 fill (0,5);
 rect(0,0,width, height);
 angle += speed;
 float sinval = sin(angle);
 float cosval = cos (angle);
 float x= 50 + (cosval * radius);
 float y= 50 + (sinval * radius);
 fill(255);
 ellipse (x,y,2,2);
 float x2= x + cos (angle * sx)* radius / 2;
 float y2= x + sin (angle * sx)* radius / 2;
 ellipse (x2, y2, 8, 8);
 
 
//
rect(850,40,random(-35), 320);
rect(570,200,random(15), 100);


//
smooth();
rotate(-PI/8);
float v = random(100);
float inc=0.1;
noStroke();
fill(random(250));
noiseSeed(20);
for(int i=0; i< width; i = i+6){
  float n=noise(v) * 600.0;
  rect(i,random(20+n), 3, 5);
  v=v+inc;
}

}

