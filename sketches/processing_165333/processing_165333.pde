
PFont font;
void setup (){
  size (700 , 480 ) ;//set size of srceen 
  background( 90,  247, 235);//sets background colour R,G,B

font =loadFont("AbyssinicaSIL-48.vlw");//loads font


}



void draw (){
  fill(60 , 200 , 120 );
  rect(0,100,900,55);
  
  fill(8,34,44);
  textFont(font,25);
  text("Puisum" ,10,40);

if(mousePressed){
  fill(random(255),random(300),random(255));
}
else{
  noStroke();
  noFill();
}
    ellipse (mouseX,mouseY,700,700);
}

void keyPressed (){
  if(key =='s'){
    saveFrame("Puisum-=====.jpg");
  }
if(key =='x') {
  clear();
  background(random(255) , random (255),random(255));
}
}




















