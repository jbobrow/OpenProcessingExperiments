
void setup(){
 size(500, 500);
 background(255);
 smooth();
 snowman();
}

void snowman(){
  translate(width/2,width/2);
  noStroke();
  fill(160,150,240,200);
  ellipse(0,0,30,30);
  ellipse(0,30,40,40);
  strokeWeight(3);
  stroke(0);
  point(-6,-4);
  point(6,-4);
  strokeWeight(2);
  curve(0,-2,-6,5,6,5,0,-2);
  line(-27,15,-15,25);
  line(27,15,15,25);
  //snow
  stroke(220,130,145,100);
  for (int i=0;i<360;i+=80){
  
   rotate(radians(30));
   line(-40,0,-32,0);
   line(-38,-3,-34,3);
   line(-38,3,-34,-3);
 }
}


