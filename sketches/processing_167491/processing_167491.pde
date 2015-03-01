

float x, y, x2, y2;
float angle = 0;
float r=100;
float d=100;
float angle2 = 0;
float r2=100;
float d2=10;
float p=1;
float s;
//float w=0;
//float h=0;
void setup() {
  size(600, 600);
  background(0);

}


void draw() {

  x = r*sin(angle);

  y = r*cos(angle);

  angle += 10;
  r = r-d;
  if ( r==0 || r==400) {
    d = d* -1;
   
  }


  x2 = r2*sin(angle2);
  y2 = r2*cos(angle2);

  angle2 +=10;
  r2 = r2-d2;
  if ( r2==0 || r2==1000) {
    d2 = d2* -1;
    
  }


  translate(width/2, height/2);
  rotate(angle);


  noStroke();
 // for (float y2;) {
  //  fill(255, 1);
   /* if (d<0) {
      fill(0, 1);
    }
     if (d>0) {
      fill(255,255,0, 1);
    }*/
    ellipse(0, 0, y2, x2);
    
//  }
  
  // if (x==100) {
  //   p = p -900;
  // }
  //rect(0, 0, -y+100, -x+100);

  float r = random(0, 255); 
  float r2 = random(100, 200); 
  // float r2 = random(0, 100);
  //float r3 = random(0, 100);
 
 
  if (r>100){
 s=0;
 }
  if (r<100){
    s=100;}
    
    
  stroke(r2-50, r2/4, r, 50);//(r, r2, r/3, 55);r, r2-30, r2+30, 55
  strokeWeight(1);
  fill(0,1);
 
  rect(0, 0, x-10, y-10);
  rect(0, 0, -x+100, -y+100);
  noFill();
  stroke(0, r2, r-30, 1);
  strokeWeight(20);
   line(0, 0, x2-20, y2);
   line(0, 0, -x2-40, -y2);
  //line(0,0,x,y); 
  ellipse(0,0,x+300,y+300);
  //println(x + " : " + y);

//fill(0,1);
//rect(0,0,800,800);
}


