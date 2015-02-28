

int a;
int b;


void setup(){
  size(800,800);
  a=width/2; //mouseX  
  b=height/2; //mouseY

}


void draw(){
  background(255,255,255);

//oreja izquierda
  strokeWeight(5);
  stroke(19,21,12);
  fill(135,185,34);
  ellipse(mouseX-width/8,mouseY-(height/4.5),width/11,height/10);

//oreja derecha
  ellipse(mouseX+width/15,mouseY-(height/4),width/11,height/10);

//cuerpo
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,a,(2*height)/4.5);

//orejas
  noStroke();
  ellipse(mouseX-width/8,mouseY-(height/4.5),width/11,height/10);
  ellipse(mouseX+width/15,mouseY-(height/4),width/11,height/10);
  fill(56,149,43);
  ellipse(mouseX-width/8,mouseY-(height/4.5),width/22,height/25);
  ellipse(mouseX+width/15,mouseY-(height/4),width/25,height/22);

//boca
  fill(30,59,29);
  ellipse(mouseX,mouseY+height/25,(2*width)/10,b/2);

//cejas
  fill(32,91,39);
  arc(mouseX-(width*3)/16,mouseY-height/20,(width*3)/30,(height*3)/30,PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  arc(mouseX+(width*3)/16,mouseY-height/20,(width*3)/30,(height*3)/30,PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  fill(135,185,34);
  ellipse(mouseX-(width*3)/16,mouseY-height/23,(width*3)/28,(height*3)/28);
  ellipse(mouseX+(width*3)/16,mouseY-height/23,(width*3)/28,(height*3)/28);
  
//ojos
  strokeWeight(3);
  stroke(65,112,43);
  fill(255,255,255);
  ellipse(mouseX-(width*3)/16,mouseY,(width*3)/30,(height*3)/30);
  ellipse(mouseX+(width*3)/16,mouseY,(width*3)/30,(height*3)/30);
  noStroke();
  fill(0,0,0);
  ellipse(mouseX-(width*3)/15,mouseY,(width*2)/75,(height*2)/75);
  ellipse(mouseX+(width*3)/16.5,mouseY,(width*2)/75,(height*2)/75);

//dientes
  fill(68,114,38);
  ellipse(mouseX,mouseY+(height/9),width/20,height/15);
  ellipse(mouseX-width/20,mouseY+(height/10),width/20,height/15);
  ellipse(mouseX+width/20,mouseY+(height/10.5),width/20,height/15);
  fill(255,255,255);
  ellipse(mouseX,mouseY+(height/9),width/25,(height*4)/75);
  ellipse(mouseX-width/20,mouseY+(height/10),width/25,(height*4)/75);
  ellipse(mouseX+width/20,mouseY+(height/10.5),width/25,(height*4)/75);

//nariz
  stroke(87,134,39);
  strokeWeight(5);
  fill(179,201,2);
  ellipse(mouseX,mouseY,a/2,(2*height)/10);
  noStroke();
  fill(30,59,29);
  ellipse(mouseX-width/20,mouseY,width/25,width/15);
  ellipse(mouseX+width/20,mouseY,width/25,width/20);
}


