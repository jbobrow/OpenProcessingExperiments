
int mode=1;

int numLoops;


void setup(){
  size(800,800);
  smooth();
  background(0);
numLoops=1;

}

void draw(){
translate(width/2,height/2);

for(int i = 0 ; i < numLoops ; i++){

rotate(radians(10));

line(0, 0,200, 200);

}
  
  for(int x=0;x<width;x+=60){
    for(int y=0;y<height;y+=60){
       if(mouseX>x&&mouseX;<x+20&&mouseY;>y&&mouseY;<y+60){
         fill(random(255),random(90),random(80));
       }  else{
         noFill();
       }
       stroke(random(255),random(90),random(80));
      rect(x,y,60,60);
    line(200,200,mouseX,mouseY);

    }
  }
  }

void mouseReleased(){
 
background(random(255),random(90),random(80));
 
}

void keyPressed(){
  if(key=='1'){
  mode=1;
}  else if(key=='2'){
  mode=2;
}
 if(mode==1){
numLoops++;
 } else if(mode== 2){
  numLoops--;
 
}
 
}

