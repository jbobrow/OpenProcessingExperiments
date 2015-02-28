
PFont myfont;
float time=0;
float t=0;
void setup(){
  size(1024,600);
  
  myfont=loadFont ("DODGE-48.vlw");
  background(0);
  noStroke();
  smooth();
}

void draw(){
 fill(10,25,55);
  rect(0,0,width+10,height+10);
  fill(255,255,243);
  textFont(myfont);
  textSize(100);
if(mousePressed){
  println(mouseX); println(mouseY);}
   float x=0;
 float z=0;
String message = "river";
int y=170;

 for (int i=0; i<message.length(); i++){
textSize(250);
//textSize(110*noise(z/25*10,time));
   text(message.charAt(i),y,height/2+(50*noise(z/50,t)));
   z=z+1;
   y+=textWidth(message.charAt(i));
 
 }
 
   t=t+0.004;
//  text("river",width/2+75,height/2+20);

  stroke(0,173,200);
 while(x<width){
   line(x, height/2+ 29*noise(x/100,time), x, height+50);

//  point(x, height*noise(x/100,time));
  x=x+1;
  
}
time=time+0.02;
fill(0,25,55);
noStroke();
}


