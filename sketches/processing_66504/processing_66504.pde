
float X=0;
float Y=0;
PFont f;
//tried to make a second font for the "More Circles"
//kept changing both instead of just one
PFont g;

void setup(){
background(255);
size(600,600);
f= loadFont("Mistral-48.vlw");
  textFont(f,32);
 
}

void draw(){
    fill(0,10);
  rect(0,0,width,height);
  
  //adding noise reduces possible color combos
  //for full psychedelia, make them all random!
  
  fill(random(255),random(255),noise(255));
  ellipse(X,Y,50,50);
  X=X+mouseX/40;
  Y=Y+random(1,5);
   ellipse(Y,X,50,50);
  
  if(Y>height){
    
    Y=0;
    
    text("MORE CIRCLES",width/2,height/2);
   
  }
  if(X>width){
    X=0;
    text("MORE CIRCLES", width/4,height/2);
  }
   
  println(Y);
  

  
  fill(255,0,0);
if(mouseX < width/2)
{ text("SLOWER",mouseX,mouseY);}
else {fill(255,255,41);text("FASTER!!!",mouseX,mouseY);}
}

