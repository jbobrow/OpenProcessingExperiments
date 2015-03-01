
float c=0;
void setup(){
  size(500,500);
  smooth();
  noStroke();
  noFill();
  
}

void draw(){
  for(int i=0;i<100;i+=100){
    if((mouseX<250)&&(mouseY>250))  {
  fill(c);
  ellipse(mouseX,mouseY,i+20,i+20);
}else if((mouseX<250)&&(mouseY<250)){
  fill(c);
  ellipse(mouseX,mouseY,i+5,5+i);
}else if ((mouseX>250)&&(mouseY<250)){
  fill(c);
  ellipse(mouseX,mouseY,i+10,i+10);
}else{
  fill(c);
  ellipse(mouseX,mouseY,i+15,i+15);
  c+=1;
}
  }
}


