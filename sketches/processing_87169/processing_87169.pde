
float u=0;

void setup(){ size(2000/3,2000/3);

frameRate(50);
}

void draw() {

  pushMatrix();
  translate(mouseX,mouseY-30);
background(250);

 
  for(float z=0; z<400; z=z+20) {

  strokeWeight(random(1));
  fill(cos(u)*200*z,cos(u*0.5*z)*20,tan(u*0.5)*20,sin(u)*20);
  u=u+0.002;
  
    rotate(sin(z)/2 );
  beginShape(QUADS);
  
  vertex((sin(u)*200+100)/10,(300+z)/10);
  
    vertex((sin(u)*300+500)/10,(cos(u)*700+700)/10);


  vertex((sin(u*0.5)*100+400/10),(sin(u)*200+500+z/10));

  vertex(sin(u*0.4+z)*500+200/10,sin(u)*200+z/10);

  vertex(sin(u*0.9+z)*100/10,100/10);

  vertex(sin(u*0.2)*200/10,500+z/10);
    vertex(sin(u)*200+100/10,305/10);

  
  endShape(CLOSE);}
popMatrix();
}
