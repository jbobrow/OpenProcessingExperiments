
void setup() {
  size(600,600);
  frameRate(12);
  strokeWeight(2);
  background(255);
}

void draw() {
  stroke(0);
  
float x= random (width);  
float y= random(height);
float z= random(25,80);
 
ellipse(x,y,z,z);
line(x,y,mouseX,mouseY);


  for(int i=0;i<width; i+=10){
  for(int j=0;j<height;j+=10){
    if(i%20==0 && j%20==0){
      fill(255,0,0,100);
    }else{
        noFill();
      }
  
   }
}
  
  stroke(0,156,255);
  line(random(width),random(height),random(width),random(height));
  stroke(250,0,0);
  line(random(width),random(height),random(width),random(height));
  line(random(width),random(height),random(width),random(height));
  stroke(254,255,3);
  line(random(width),random(height),random(width),random(height));
  stroke(2,203,57);
  line(random(width),random(height),random(width),random(height));
  stroke(0,25,255);
  line(random(width),random(height),random(width),random(height));
  stroke(255);
  line(random(width),random(height),random(width),random(height));
  stroke(232,0,250);
  line(random(width),random(height),random(width),random(height));
  stroke(137,54,255);
  line(random(width),random(height),random(width),random(height));
  stroke(68,255,8);
  line(random(width),random(height),random(width),random(height));
  stroke(252,101,0);
  line(random(width),random(height),random(width),random(height));
  stroke(0,211,142);
  line(random(width),random(height),random(width),random(height));
  stroke(211,0,92);
}
void keyReleased(){
  if (key=='r') setup();
}

