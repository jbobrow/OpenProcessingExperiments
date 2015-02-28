
// basic loop and pattern sketch

float count = 1;

void setup(){
  background(255);
  size(600,600);
  smooth(); 
}

void draw(){
  fill(map(mouseX, 0, height, 0, 255));
  rect(0,0,width,height);
    for(int i = 0; i < width; i+=10){
    for(int j = 0; j < height; j+=10){
      if(i%20 == 0 && j%20 ==0){
        stroke(random(0,255),random(0,255),random(0,255),128);
      }
      else {
        noFill(); 
      }
       //fill(0, 80); noStroke();
       line(i,j,width/2,height/2);
     }
   } 
   
  if(count%20==0){
   textSize(40);
   fill(255,128);
   text("HAIL SATAN",(width/2)-100,height/2);
  }
   
   count++;
 }


