
float margen, sp;
void setup(){
margen = 20;
sp = 25;
size(500, 500);
smooth();
stroke(0);
}
void draw(){
background(255);
fill(252,241,115,100);
for(float y =margen; y <= height-margen; y += sp){
for(float x = margen; x <= width-margen; x += sp){
float d; //distacia
d= sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y)); 

strokeWeight(1);
   
smooth();
stroke(0,20);
fill(147, 7, 68, 100);
triangle(y, x , d, d, d, d);

stroke(0,25);
fill(0);
ellipse(mouseX,y, 100/d, 100/d);
   

fill(147,7,68,100);
rect(x,mouseY, 100/d, 100/d);
strokeWeight(1); //tamaño trazo
smooth(); 


    }

  }

}



