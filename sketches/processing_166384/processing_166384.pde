
void setup(){
  
 size(700,700);
 noCursor();
   
}
 
void draw(){
  
 if (mousePressed){
  
  noStroke();  
fill(0,mouseX/5,255);
ellipse(mouseX/2,200,300,2000);

noStroke();
 fill(0,mouseX/4,255);
ellipse(350+mouseX/10,100,150,150);

noStroke();  
fill(0,mouseX/4.5,255);
ellipse(700-mouseX/2,200,300,2000);

 }
  
else{ 
noStroke();  
fill(255,mouseX/5,0);
ellipse(mouseX/2,200,300,2000);

noStroke();
 fill(255,mouseX/4,0);
ellipse(350+mouseX/10,100,150,150);

noStroke();  
fill(255,mouseX/4.5,0);
ellipse(700-mouseX/2,200,300,2000);
}






}
