
//pattern
//homework #3

void setup (){
size (600,600);
smooth ();
background(16,29,90);

}

void draw() {

{
 //colorstuff
 fill(22,23,64,60);
 ellipse(300,300,200,200);
 
   //lighterblue
 fill(57,95,131,70);
 ellipse(80,660,300,300);
 fill(57,95,131,70);
 ellipse(520,660,300,300);
 fill(57,95,131,70);
 ellipse(80,-60,300,300);
 fill(57,95,131,70);
 ellipse(510,-60,300,300);
 
 fill(57,95,131,70);
 ellipse(-50,80,300,300);
 fill(57,95,131,70);
 ellipse(650,80,300,300);
 fill(57,95,131,70);
 ellipse(-50,520,300,300);
 fill(57,95,131,70);
 ellipse(650,520,300,300);
 
 //orange
 noStroke();
 fill(225,165,82,50);
 ellipse(620,620,370,370);
 fill(225,165,82,50);
 ellipse(-20,-20,370,-370);
 fill(225,165,82,50);
 ellipse(-20,620,370,370);
 fill(225,165,82,50);
 ellipse(620,-20,370,370);
 

   //ripplethings
  {
  for(int i = 0;i < 100;i++) {
    noFill();
    strokeWeight(.5);
  stroke(144,157,227);
  ellipse(-30,-30,i*100,i*100);
  ellipse(630,630,i*100,i*100);
  ellipse(-30,630,i*100,i*100);
  ellipse(630,-30,i*100,i*100);
  }
  }
  
    smooth();
  //bluecrecentcircles
  fill(213,228,229);
  ellipse(50,50,100,100);
  fill(213,228,229);
  ellipse(550,550,100,100);
  fill(213,228,219);
  ellipse(50,550,100,100);
  fill(213,228,219);
  ellipse(550,50,100,100);

  //mooncuts
  fill(16,29,90);
  ellipse(15,15,100,100);
  fill(16,29,90);
  ellipse(585,15,100,100);
  fill(16,29,90);
  ellipse(15,585,100,100);
  fill(16,29,90);
  ellipse(585,585,100,100);
  
  
//centerthings
 noStroke();
 fill(96,128,191,20);
 ellipse(width/2,height/2,100,80);
 
 fill(16,29,90,50);
 rect(295,295,10,10);
 
  //overorange
 fill(22,23,64,97);
 ellipse(0,300,200,80);
 fill(22,23,64,97);
 ellipse(600,300,200,80);
 fill(22,23,64,97);
 ellipse(300,0,70,200);
 fill(22,23,64,97);
 ellipse(300,600,70,200);
 
 //orangeellipse's
 fill(225,165,82,50);
 ellipse(0,300,300,90);
 fill(225,165,82,50); 
 ellipse(600,300,300,90);
 fill(225,165,82,50); 
 ellipse(300,0,90,300);
 fill(225,165,82,50);
 ellipse(300,600,90,300);
 
//circles
fill(214,121,58,50);
noStroke();
smooth();
int radius = 100;
for (int deg = 0; deg <360; deg +=20) {
  float angle = radians(deg);
  float x = 300 + (cos(angle) * radius);
  float y = 300 + (sin(angle) * radius);
  ellipse(x,y,20,20);
  }
  
  if(dist(mouseX,mouseY,300,300) >50) { 
     fill(100,20,20,100);
     ellipse(width/2,height/2,100,80);
              }
  }
}





