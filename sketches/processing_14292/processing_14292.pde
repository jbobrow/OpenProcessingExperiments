
int x;int dir=20;   void setup(){   smooth();
  size(600,600); noCursor(); strokeWeight(15) ;
  x = width/2;

stroke(0,120);
smooth();
  noStroke();
  noStroke();
  fill(255);
}
void draw(){
  background(70);
stroke(255);
ellipse(mouseX,mouseY,5,5);
println("X;"+mouseX+"Y;"+ mouseY);
  if ((mouseX >120) && (mouseX <300)&&
  (mouseY > 120) && (mouseY < 300)) {
    fill(175,210,214);
  }else{fill(252,208,161);
  }
  ellipse(300,500,200,200);quad(300,0,320,0,600,320,600,380);
  
  line(40,0,40,600);line(60,0,60,600);rect(0,320,320,20);
   if (mousePressed == true) {
    if(mouseButton == LEFT) fill(75,75,64);  
  else if (mouseButton == RIGHT) 
      fill(183,183,179); 
 } else {
    fill(232,199,230);
 }rect(0,100,600,20);
rect(420,0,80,600);

fill(124,95,122);
ellipse(40,160,40,40);
fill(238,240,174);
ellipse(50,330,20,20);

ellipse(600,250,100,100);


ellipse(600,600,400,400);fill(205);
ellipse(600,600,300,300); 

ellipse(200,200,200,200);}

                
                
