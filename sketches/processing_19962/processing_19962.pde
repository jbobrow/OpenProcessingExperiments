
color Red1=color(254,67,101,99);
color Red2=color(252,157,154,99);
color Red3=color(249,205,173,99);
color Blue1=color(131,175,155,99);
color Blue2=color(200,200,169,99);

void setup() {
  size(500, 500);
  background(0);
}

//custom function:strokecolor
void strokecolor(){
  int strokecolor=floor(random(1,6));
  if(strokecolor==1){
    stroke(Red1);
  };
  if(strokecolor==2){
    stroke(Red2);
  };
  if(strokecolor==3){
    stroke(Red3);
  };
  if(strokecolor==4){
    stroke(Blue1);
  };
  if(strokecolor==5){
    stroke(Blue2);
  };
}

//custom function:pointline
void pointline(float y,float z){
  for(int x=0;x<width;x+=z){
  strokeWeight(0.5);
  stroke(200,200,200,75);
  line(x,y-random(-height/15,height/15),x,y+random(-height/15,height/15));
  noLoop();
  strokecolor();
  strokeWeight(random(2,12));
  point(x,y);
  
  }
}
  
 void draw() {
  for(int countY=0;countY<height/20;countY++){
    pointline(countY*20,random(5,20));   
    if(countY>15){
      line(random(0,width),countY*20,random(0,width),countY*20);
    }
} 
}

void mousePressed(){
  background(0);
  loop();
}




 





