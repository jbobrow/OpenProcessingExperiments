
float vel=0;
void setup(){
  background(34,100,5);
  background(34,108,10);
  fill(30,50);
  size(500,500);
}
void draw(){
  //background(40,99,160);
  fill(80,50);
  if(mousePressed){
  background (245,105,17);
}
  vel=dist(mouseX,mouseY,pmouseX,pmouseY);
  println(vel);

  //ellipse(width,px,px,50,50);
  fill(19,214);
  ellipse(width/2,height/3,vel,vel);
  fill(78,45);
  ellipse(width/4,height/6,vel,vel);
  line(width/2,height/2,width/2,height);
  ellipse(width/2,height/2,vel,vel);
  fill(214,19);
  ellipse(width/7,height/10,vel,vel);
  ellipse(width/8,height/30,vel,vel);
  fill(100,65,1);
  ellipse(width/14,height/12,vel,vel);
  ellipse(width/20,height/14,vel,vel);
  fill(50,76);
  fill(50,89);
   ellipse(width/26,height/20,vel,vel);
   ellipse(width/30,height/26,vel,vel);
    vel=dist(mouseX,mouseY,pmouseX,pmouseY);
  println(vel);
if(mousePressed){
  background (245,105,17);
}
   if(mousePressed||mouseY<200){
   fill(70);
}else{
  fill(50);
ellipse(mouseX,mouseY,30,30);
fill(32,80);

  ellipse(width/15,height/34,vel,vel);
  ellipse(width/30,height/25,vel,vel);
}}
