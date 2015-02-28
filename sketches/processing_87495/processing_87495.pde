
 void setup(){
size(920,580);
stroke(255,0,0,200);
frameRate(60);
}
float x=950,y=550,xn=950,yn=550; 
void draw(){
//background(255);
//x = x + random(-10,10);
//y = y + random(-10,10);

 if(random(1.)>0.5)
 x = x + random(-30,30); 
 else
 y = y + random(-30,30);
  x = round(x/10.)*10; //snap 
  y = round(y/10.)*10;


  x = constrain(x,50,width-50);
  y = constrain(y,50,height-50); 
  
  strokeWeight(2*x/y);
  stroke((x/5),y/3,y/2,255);
  line(x,y,xn,yn);
  //xn = xn+400;
  //yn = yn-400;
  line(y,x,yn,xn);
  xn = x;
  yn = y;
 }



//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
