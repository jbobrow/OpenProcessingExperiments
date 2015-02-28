
void setup(){
  size(600,600);
  frameRate(10);
}
 
void draw(){
  scale(3);
  background(30,30,240);
   
  stroke(250,100,0);
  strokeWeight(0);
 
  fill(250,100,0);
  rect(20,50,160,60); 
   
  fill(30,30,240);
  textSize(20);
  text("Hello World!",35,90);
  mausZeichnen(); //Erlaubt, weil "berechne()" bekannt ist!
}
 
void mausZeichnen(){
    int x=mouseX;
    int y=mouseY;
    fill(255,0,0);
    text("x: "+x+" & "+"y: "+y,30,30); //Anzeigen von der X und Y Koordinaten
}
