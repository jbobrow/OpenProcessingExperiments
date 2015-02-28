
float a=1;

float d=1;

void setup() {
  
  size(2000,2000);
      background(240);


}
  void draw(){ 
    
strokeWeight(30);
    
  fill(sin(a*0.04)*60,sin(a)*50,a*49,tan(a*0.7)*200+10);
      background(240);

      
   beginShape(QUADS);

vertex(400,300);

vertex(tan(a)*40+1000,tan(a*0.004)*50+10);


vertex(1500,sin(d)*70+1400);

vertex(mouseY,cos(d)*80+400+sin(a)*70+1400);

vertex(tan(a)*30+500,sin(a)*10-300+sin(d)*70+1400);
vertex(tan(a)*30+500,mouseX);
vertex(400,300);


endShape();

  fill(a*40,cos(a*0.94)*70,sin(d)*50,tan(a-2)*200+500);
      
   beginShape(QUADS);

vertex(300,700);

vertex(sin(d)*400+1000,mouseY);

vertex(cos(a*0.5)*50+2000,300);

vertex(sin(a*0.2)*10+1300,cos(a*0.6)*20+700);

vertex(tan(a)*30+2,sin(a*0.5)*10+1400);

vertex(0,tan(a)*10+1400);
vertex(mouseX,tan(a)+700);


endShape();

a=a+0.03;

d=d+0.01;
}
