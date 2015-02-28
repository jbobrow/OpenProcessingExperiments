
float u=0;

void setup(){ size(800,2000);

background(250);
frameRate(200);
}

void draw() {
  
  for(float z=0; z<0.01; z=z+0.001) {
  if(random(10)>9.99) {background(250);}
  strokeWeight(random(0.2));
  fill(cos(u)*400+100,cos(u*0.5)*20,tan(u*0.5)*20,sin(u)*0.8);
  u=u+z;
  beginShape();
  
  curveVertex(sin(u)*200+100,300);
  
    curveVertex(sin(u)*300+500,cos(u)*700+700);


  curveVertex(sin(u*0.5)*100+400,sin(u)*200+500);

  curveVertex(sin(u*0.4)*500+200,sin(u)*200);

  curveVertex(sin(u*0.9)*100,100);

  curveVertex(sin(u*0.2)*200,500);
  
  endShape();}

}
