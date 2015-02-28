
float ypos = 299;
void setup(){
  size(300,300);
  smooth();
  colorMode(HSB);  
}
void draw(){
  fill(50,50,200,50);
  rect(0,0,width,height);
  fill(ypos,200,170);
  rect(0,ypos,width,ypos);
  ypos = ypos-1;
  strokeWeight(2);
  stroke(0);
  bezier(0,ypos,50,ypos+sin(ypos)*5,250,ypos+sin(ypos)*5,width,ypos);
   if(ypos <=0){
    ypos = 299 ;
   
   }if(mousePressed){
   noFill();
   stroke(0,50);
   bezier(mouseX,mouseY,pmouseX+sin(ypos)*10,mouseY-10,pmouseX+sin(ypos)*10,mouseY-20+sin(ypos)*10,pmouseX,pmouseY-35);
   ellipse(mouseX,mouseY,10,10);
   }else{
     noFill();
     stroke(0);
    bezier(mouseX,mouseY,pmouseX+sin(ypos)*10,mouseY-10,pmouseX+sin(ypos)*10,mouseY-20+sin(ypos)*10,pmouseX,pmouseY-35);
   ellipse(mouseX,mouseY,10,10); 
   }
}

