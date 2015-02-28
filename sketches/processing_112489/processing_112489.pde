
float x,y,a,b;
int g;


void setup(){
  size(600,600);

}

void draw(){
   if (mousePressed){
   g=255;
 }else{
   g=100;}
  background(150);
  for(x=7.5;x<width;x=x+10){//vertical part
    for(y=2.5;y<height;y=y+10){
     stroke(0,g,0);
      line(x,y,x,y+5);
    }
  }
 for(a=5;a<height;a=a+10){//horizontial part
  for(b=5;b<height;b=b+10){
   stroke(0,g,0);
   line(a,b,a+5,b);
  }
 }

float c=pmouseX;
float d=pmouseY;
 ellipseMode(CENTER);
 
 noStroke();
 ellipse(c,d-30,35,35);
 fill(200,0,0);
 ellipse(c,d,60,70);
 fill(0);
 ellipse(c,d,20,25);


 
 

}
