
int mode=1;
PImage animal;



void setup(){
   animal = loadImage("animal.jpg");
  noLoop();
  size(500,500);
  noFill();
  noStroke();
}



void draw(){
image(animal, 0, 0);
}


void keyPressed(){
  if(key=='1'){
  mode=1;
}  else if(key=='2'){
  mode=2;
}else if(key=='3'){
  mode=3;
}
  
 if(mode==1){
   fill(239,132,247);
ellipse(50,50,70,70);
 } else if(mode== 2){
   fill(239,240,60);
   ellipse(120,120,70,70);
 }else if(mode== 3){
   fill(79,245,127);
   ellipse(180,180,70,70);


}

}
