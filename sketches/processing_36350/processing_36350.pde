
void setup(){ 
  size(300,300);
}

void draw(){
      background(93,137,255);
      fill(37,85,10);
      rect(0,height*.67,width,height); //guy a
      fill(255,0,0);
      quad(.5*width-75,height*.75,.5*width-25,height*.75,.5*width-15,height*.3,.5*width-85,height*.3);
      fill(211,150,84);  
      ellipse(.5*width-50, height*.3-25,45,48);
      fill(245,191,84);
      ellipse(.5*width+50, height*.3-25,45,48);
      fill(255,255,0);  //guy b
      quad(.5*width+75,height*.75,.5*width+25,height*.75,.5*width+15,height*.3,.5*width+85,height*.3);
  if(mouseX < width/2) {
    fill(245,191,84);  //guy a
    ellipse(.5*width+10, height/3, 50, 10); 
    fill(211,150,26);   // guyb
    ellipse(.5*width-30,height/3,10,10); 
  }
  else {
     fill(245,191,84);  //guy a
     ellipse(.5*width+30,height/3,10,10);
     fill(211,150,26);  //guy b
     ellipse(.5*width-10,height/3,50,10);

}}

void mousePressed(){
    if(mouseX > width/2) {

  fill(142,5,0);
  ellipse(.5*width+50, height*.3-25,5,8);
  ellipse(.5*width+45, height*.3-20,3,6);
}else{
  fill(142,5,0);
  ellipse(.5*width-50, height*.3-25,5,8);
  ellipse(.5*width-45, height*.3-20,3,6);}}



