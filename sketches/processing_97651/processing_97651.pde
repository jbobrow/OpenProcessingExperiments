
float mida=random(2,300);
float reduccio=300;
void setup(){
  size(2000,1000);
}

void draw(){
text("HEY DUDE!  TRY TO HOLD MOUSE PRESSED",200,20);
 noStroke();
  fill(0,20);
  rect(0,0,width,height);
 
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,mida,mida);
  if(mousePressed){
  mida=random(1,reduccio);
  reduccio-=1;
}else{
  mida=random(300);
  reduccio=300;
}
if (mida<2){
  mida=0;
}
}
