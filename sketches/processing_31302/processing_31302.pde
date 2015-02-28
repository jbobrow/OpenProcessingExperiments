
float x;
float y;
float dia = 50;
float radius = dia/2;
color col = color(200);
 
 
void setup() {  //setup function called initially, only once
  size(500,500);
  background(255);  //set background white
  frameRate(99999999);
   
}
 
void draw() {  
float x = width/2;
float y = height/2;
  fill(col);
  ellipse(x,y,dia,dia);
   fill(200,20,5);
text("Button", 230,254);
   
  
  if(mousePressed == true) { //add some interaction
    if(mouseX > x-radius && mouseY< x+radius && mouseY > y-radius && mouseY < y+radius){
    background(255);
 
  fill(240,90,0);
noStroke();
ellipse(250,250,dia,dia);
fill(0);

col=color(random(255));
fill(200,20,5);
text("Button", 230,254);
    }
    }
    }
 
                


  


