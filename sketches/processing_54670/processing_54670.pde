

PFont myfont;
PFont serve;

void setup(){
  size(600,600);
  background(255,255,255);
  myfont = loadFont("BebasNeue-48.vlw"); 
 serve = loadFont("BebasNeue-25.vlw");  
}

void draw(){
  fill(17,53,57,90);
  textSize(48);
  textFont(myfont);
  text("Become the Office Hero",mouseX,mouseY);
  
  fill(54,129,137,80);
  textSize(25);
  textFont(serve);
  text("to serve those who save",mouseX+30,mouseY+30);


  
}


