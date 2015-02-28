
void setup(){
  size(600,600);
  background(0);
  smooth();
}

void draw(){
  pushMatrix();
  translate(width/2,height/2);
  
  //Cara
  fill(255,0,0);
  rect(-100,-100,200,300);
  
  //Ojos
  fill(#987D0F);
  ellipse(-150,-100,150,100);
  fill(0);
  ellipse(-150,-100,140,90);
  fill(#987D0F);
  ellipse(-150,-100,130,80);
  fill(0);
  ellipse(-150,-100,120,70);
  fill(#987D0F);
  ellipse(-150,-100,110,60);
  fill(0);
  ellipse(-150,-100,100,50);
  fill(#987D0F);
  ellipse(-150,-100,90,40);
  fill(0);
  ellipse(-150,-100,80,30);
  fill(#987D0F);
  ellipse(-150,-100,70,20);
  fill(0);
  ellipse(-150,-100,60,10);
  
  
  fill(#987D0F);
  ellipse(150,-100,150,100);
   fill(0);
  ellipse(150,-100,140,90);
  fill(#987D0F);
  ellipse(150,-100,130,80);
  fill(0);
  ellipse(150,-100,120,70);
  fill(#987D0F);
  ellipse(150,-100,110,60);
  fill(0);
  ellipse(150,-100,100,50);
  fill(#987D0F);
  ellipse(150,-100,90,40);
  fill(0);
  ellipse(150,-100,80,30);
  fill(#987D0F);
  ellipse(150,-100,70,20);
  fill(0);
  ellipse(150,-100,60,10);
  
  //Boca
   fill(255);
   stroke(20);
      
   for(int i=-96; i<=97; i=i+18){
   rect(i,140,10,50);
  }
  
  
 //Nariz
  noStroke();
  triangle(0,50,-20,-20,20,-20);
  
  popMatrix();
}
  

