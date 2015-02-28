
 
float q,w; 
float r = 1.0; 
float theta = 0.0; 
float t = 0.0; 
float inc = 0.01; 
 
void setup(){ 
  size(1000,500); 
  background(55); 
  smooth();  
  frameRate(200); 
 
} 
 
void draw(){ 
 
 float k = noise(t*3)*4; 
 float s = random(2);
  float x = r*sin(theta); 
  float y = r*cos(theta);
  colorMode(RGB);
  color c1=color(0,255,45,10);
  color c2= color(255,188,14,15 );
  
 
   
 color c3 = blendColor(c1,c2,SUBTRACT);
  //fill(c3);
  //noStroke(); 
  noFill();
 stroke(c3);
 strokeWeight(1);
  // rect(k*x+width/2,y+height/2,tan(theta)*k,tan(theta)); 
   ellipse(x,y+100,tan(theta),tan(theta));
  
  ellipse(x+100,y+height-100,tan(theta),tan(theta));
 
  ellipse(x+200,y+100,tan(theta),tan(theta));
  
  ellipse(x+300,y+height-100,tan(theta),tan(theta));
  
  ellipse(x+400,y+100,tan(theta),tan(theta));
  
  ellipse(x+500,y+height-100,tan(theta),tan(theta));
  
  ellipse(x+600,y+100,tan(theta),tan(theta));
  
  ellipse(x+700,y+height-100,tan(theta),tan(theta));
  
  ellipse(x+800,y+100,tan(theta),tan(theta));
  
  ellipse(x+900,y+height-100,tan(theta),tan(theta));
  
  ellipse(x+1000,y+100,tan(theta),tan(theta));
  theta += .01; 
  r+=inc*1; 
  t+=inc; 
} 
 

