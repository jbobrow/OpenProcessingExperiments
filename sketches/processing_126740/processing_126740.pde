
void chara(int a, int b) {
  pushMatrix();
  translate(a-50, b-50);

  stroke(0);
  strokeWeight(1);
  fill(255);


   noStroke();
   fill(111,255,184);
   triangle(12,24,30,34,14,35);
   triangle(17,45,30,34,23,48);

   
  //
  fill(map(mouseX,0,600,0,255),map( mouseY, 0,600,0,255),100);
  ellipse(50,55,120,120);

  
  
  //head
  stroke(0, 0, 0);
  fill(mouseX,mouseY,0);
  quad(25, 20, 65, 10, 66, 45, 29, 52);
  quad(65, 10, 75, 20, 74, 50, 66, 45);
  fill(map(mouseX,0,600,0,255),map( mouseY, 0,600,0,255),0);
  quad(29, 52, 66, 45, 74, 50, 39, 56);
  //eyes
  stroke(0, 0, 0);
  fill(225, 225, 225);
  quad(32, 28, 35, 27, 36, 35, 33, 36);
  quad(51, 23, 54, 22, 55, 30, 52, 31);
  /*right
   noStroke();
   fill(111,225,184);
   triangle(85,12,88,23,70,27);
   triangle(70,27,82,35,76,41);
   */
  //body
   fill(mouseX, mouseY, 0);
  quad(45, 52, 54, 50, 58, 76, 33, 82);
  quad(54, 50, 57, 54, 65, 80, 58, 76);
  fill(map(mouseX,0,600,0,255),map( mouseY, 0,600,0,255),0);
  quad(33, 82, 58, 76, 65, 80, 41, 86);
 
 /*
  //leftfoot
  fill(mouseX, mouseY, 0);
  quad(17, 84, 28, 82, 29, 86, 18, 87);
  quad(28, 82, 36, 95, 35, 97, 28, 85);
  fill(map(mouseX,0,600,0,255),map( mouseY, 0,600,0,255),0);
  quad(18, 87, 28, 85, 35, 97, 30, 97);
  //rightfoot
  fill(mouseX, mouseY, 0);
  quad(58, 90, 60, 91, 59, 97, 48, 97);
  quad(59, 90, 59, 91, 58, 98, 59, 97);
  quad(48, 97, 59, 97, 58, 99, 48, 99);
*/


 //leftfoot 2
  fill(mouseX, mouseY, 0);
  quad(42, 90, 48, 90, 41, 98, 32, 97);
  quad(48, 90, 48, 91, 42, 99, 41, 98);
  quad(32, 97, 42, 97, 42, 99, 32, 99);
  //rightfoot 2
  fill(mouseX, mouseY, 0);
  quad(47, 75, 60, 73, 60, 75, 48, 79);
  quad(60, 73, 61, 90, 62, 90, 60, 75);
  fill(map(mouseX,0,600,0,255),map( mouseY, 0,600,0,255),0);
  quad(48, 79, 60, 75, 62, 90, 55, 90);


 
  popMatrix();
}

float x,y ;
float vx,vy ;
float ay ;

void setup(){
  size(600-50,600-50);
  x = 0 ;
  y = 300 ;
  vx = 3 ;
  vy = 5 ;
  ay = 0.9 ;
}

void draw(){
  
  chara(int(x),int(y));
  
  x = x + vx ;
  y = y + vy ;
  
  if (x > 550) vx = -vx ;
  if (x < -50) vx = -vx ;
  if (y > 600){
    vy = -vy ;
    vy = vy * 0.9 ;
    y = 550 - (y - 550);
  }
  if (y < 0) vy = -vy ;
  
  vy = vy+ay ;
  
  if(mousePressed){
    background(0);
    chara(int(x),int(y));
    
    if((mouseX > x-50) && (mouseX< x+50) && (mouseY > y-50) && (mouseY < y+50)){
       x = mouseX ;
       y = mouseY ;
       vx = 0 ;
       vy = 0 ;
       
     }
  }
}

void mouseReleased(){
  background(200);
  vx = mouseX - pmouseX ;
  
}




