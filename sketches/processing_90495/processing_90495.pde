
int center=(width/2+height/2);
int ox=(width/2);
int oy=(height/2);

void setup() {
  size (displayWidth/2, displayHeight/2);
  smooth();
}


void draw() {
  background(255);
  noStroke();
  fill(0,255,1255,mouseX/3);
  quad(150,450, 150,350, 350,210, 350,310);
  
  fill(255,255,0,mouseX/3);
  quad(289+50,338, 289+50,238, 160,86, 160,186);
  
  fill(0,255,255,mouseX/3);
  quad(170,250, 170,150, 350,75-50, 350,175-50);
  //A
  fill(0,255,255,mouseX/3);
  quad(800,450, 700,450, 490,25, 590,25);
  
  fill(0,255,255,mouseX/3);
  quad(390,450, 490,450, 710,25, 610,25);
  
  fill(255,255,0,mouseX/3);
  quad(469,300, 725,400, 777,400, 415,300);
 
 //(725,400, 415,300, 469,300, 777,400)
 
 
  //mouseX,mouseY
  //quad(469,300, 725,400, 415,300, 777,400);
  
  println("x="+mouseX+"y="+mouseY);
}



