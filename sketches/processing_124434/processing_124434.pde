
int r =120,count =0,corners =20;
float[][] xyz;
float[] col;

void setup(){
  colorMode(HSB);
  size(384,384,P3D);
  smooth();
  frameRate(30);
  setCorners();
  fill(0,50);
}

void draw(){
  if(mousePressed){
    int m =int( (mouseY - pmouseY) /8) *2;
    corners = constrain(corners+m,8,512);
    setCorners();
  }
  
  background(150,100,50);
  translate(width/2,height/2);
  
  count ++;
  rotateX(-0.005*count);
  rotateY(0.01*count);
  stroke(255);
  box(50,250,50);
    
  for(int i =0; i<corners; i++){
    
    stroke(col[i],255,255);
    
    if(i<corners-1)line(xyz[i][0],xyz[i][1],xyz[i][2],xyz[i+1][0],xyz[i+1][1],xyz[i+1][2]);
    else line(xyz[i][0],xyz[i][1],xyz[i][2],xyz[0][0],xyz[0][1],xyz[0][2]);
  }
}

void setCorners(){     
   xyz = new float[corners][3];
   col = new float[corners];
   for(int i = 0; i<corners; i++){
     int ra = TWO_PI/corners*i;
     xyz[i][0] = r*cos(ra);
     xyz[i][2] = r*sin(ra);
     if(i%2==0)xyz[i][1] = -25;
     else xyz[i][1] = 25;
     
     col[i] = 255/corners*i;
   }
}
