
PImage imgag,video;
PImage paleta;
boolean newFrame=false;
float t = 1,br =0;
float thr = 50;
float peAx,peAy;
float max_distance;
PVector  v1;
PVector  v2;
float d ;
int col = 32;
void setup(){
  
  size(400,300);
  colorMode(HSB,100);
  background(55,0,0);
   
    max_distance = dist(0, 0, width, height);

}



void draw(){
  fill(100,0,0,6);
  noStroke();
  rect(0,0,width,height);
  t = t+5;
  br = br+1;
  smooth();
fuego(mouseX,mouseY);
 
  if(mousePressed){
  fill(100,0,0,100);
  noStroke();
  rect(0,0,width,height);
  int t = 0; 
  t = t + TWO_PI/50.0;
  for(int i =0; i < 100; i++){
  fuego(pmouseX*cos(t*random(0,PI*2)),pmouseY*tan(t*i*random(0,PI*2)));
  }
  col= random(30,60);
 
  }
}

void fuego(float x, float y){
  //ellipseMode(CORNER);
    // strokeWeight(3);
    // float size = dist(x,y,px,py);
 for(int i =0; i< 20; i++){
   fill(col,i,350-i,5);
   stroke(62,i,350-i,5);
   line(x,y,pmouseX,pmouseY);
   line(y,x,pmouseY,pmouseX);

 // line(x,y,size,size);
  noStroke();
  ellipse(x,y,i,i);
  ellipse(y,x,i,i);
  
  

    }
       // px = x; py = y;

  if(t>= 100){t =0;} 
  if(br>= 100){br =0;}  
}


void keyPressed() {

  if (key == '+') {
    col = col+1;
    if(col> 100) col= 0;
  }
  
   if (key == '-') {
    col = col-1;
    if(col < 1) col= 100;
  }


}
