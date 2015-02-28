
float cx,cy;
float cx2,cy2;

float ang = 0;


//........................

void setup(){
 
 size(500,500);
 background(90,75,210);
 
 
 cx=width/2;
 cy=height/2;
  
}

//.........................

void draw(){
  
  noStroke();
  fill(90,75,210,10);
  rect(0,0,width,height);
  
  noFill();
  stroke(125,255,180);
  ellipse(cx,cy,50,50);
  
  cy=100*sin(cx*0.1)+height/2;
  
  cx2=sin(ang)*100+cx;
  cy2=100*cos(ang)+cy;
  
  stroke(0);
  line(cx,cy,cx2,cy2);
  
  fill(125,0,125);
  ellipse(cx2,cy2,90,90);
  
  vuelta(cx2,cy2,20,ang*2);
  
  vuelta(cx+100,cy,90,ang*.25);
  
  ang+=PI/90;
  
  cx ++;
  cx %= width;
  
}

//............................

void vuelta(float x, float y, float radio, float a){
  float px, py;
  
  px=radio*sin(a)+x;
  py=radio*cos(a)+y;
  
  stroke(255);
  line(x,y,px,py);
  
  fill(125,245,34);
  ellipse(px,py,20,20);
  
}

