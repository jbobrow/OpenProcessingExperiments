
void setup(){
size(600,600);
background(255);
strokeWeight(10);
smooth();
noLoop();
createFont("EdwardianScriptITC-72", 72);

}

void draw(){
  thesquares(); 
  thecircles();
  thetriangles();
  thefont();
 
 
  }
  
 void thesquares(){
   colorMode(RGB, 100);
      for (int x=0;x<width;x+=35){
       for (int y=0;y<width;y+=35){
         fill(random(100),random(300),random(200));
         rect(x,y,100,100);
       }
     }
 }
 
  void thecircles(){
   colorMode(RGB, 100);
    for (int x=0;x<width;x+=50){
      for (int y=0;y<width;y+=40){
        fill(random(200),random(100),random(300));
        ellipse(x,y,30,30); 
 }
    }
 }
 
 void thefont(){
  fill(255,255,255);
  
  PFont ourfont;

  ourfont = loadFont("EdwardianScriptITC-72.vlw");
  textFont(ourfont, 300);
  text("1", 290, 550);
  textFont(ourfont, 300);
  text("9", 400, 550);
}
 
 void thetriangles(){
   colorMode(RGB, 100);
   strokeWeight(5);
    for (int x=0;x<width;x+=150){
      for (int y=0;y<width;y+=100){
        fill(random(200),random(100),random(300));
        triangle(x,y,100,100,200,200);  
   
  
 }
 }
 }
 


