

float counter = 0;
float zaehler = 0; 
void setup()
{
  size(500, 450);
}
 
void draw()
{
  background(0);
 
  translate(width/2, height/2);
 
  pushMatrix();
  if(cos(counter)>0){
  translate(sin(counter)*100,-cos(counter)*100);
  }else{
    translate(sin(counter)*100,cos(counter)*100);
  }
  
  if(sin(counter)>0.99){
  rotate(sin(counter)+0.3);
  }
  rotate(sin(counter));
  colorMode(HSB, 360, 100, 100);
  fill(0, 100, 100);
  rotate(radians(-50));
  ellipse(40, 0, 110, 20);
  rotate(radians(10));
  ellipse(40, 0, 180, 30);
  rotate(radians(10));
  ellipse(50, 0, 200, 30);
  rotate(radians(10));
  ellipse(50, 0, 190, 30);
  rotate(radians(20));
  ellipse(0, 20, 100, 40);
  popMatrix();
  resetMatrix();
  
  pushMatrix();
  translate(300,300);
  translate(-zaehler,0);
  fill(61,100,100);
  ellipse(0,0,40,40);
  fill(36,100,100);
  ellipse(5,30,40,40);
  if(sin(counter)>0.999){
    zaehler =0;
    }
    if(zaehler>170){
    zaehler=0;
    }
      popMatrix();
      resetMatrix();
if(cos(counter)>0){
  zaehler +=0;
  zaehler =0;
}else{
  if(sin(counter)>0){
  zaehler +=3;
  }else{
  zaehler +=0;
  zaehler =170;
  }
}
translate(20,350);
fill(37,99,37);
ellipse(0,-100,40,40);
  ellipse(20,-80,40,40);
  ellipse(15,-40,40,40);
  ellipse(30,-50,40,40);
  
  fill(278,99,66);
  rect(0,0,100,60);
  rotate(radians(20));
  rect(30,-20,100,60);
  counter += 0.03;
}
