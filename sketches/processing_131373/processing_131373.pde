
//Rachel Hill HW #3 hill.1523@osu.edu feb. 2. 2014//

void setup(){
  size(600, 600);
  frameRate(10);
}

float x = 0;
float y = 10;
float w = 5;
float z = 100;

boolean button = false;
int rgb = 255;
int circle1 = 25;
int circle2 = 300;
int circle3 = 50;
int circle4 = 575;
int a = 600;

void draw() {
  background(rgb); 
   if (button){
     background(x);
     strokeWeight(random(y));
     stroke(random(rgb), random(rgb), random(rgb), random(rgb));
     fill(random(rgb), random(rgb), random(rgb), random(rgb));
   } else {
    background(rgb);
    strokeWeight(random(y));
    stroke(random(rgb), random(rgb), random(rgb), random(rgb));
    fill(random(rgb), random(rgb), random(rgb), random(rgb)); //Background changes color when button hit
   }
   
   ellipse(circle2, circle1, circle3, circle3);//four circles
   ellipse(circle2, circle4, circle3, circle3);
   ellipse(circle4, circle2, circle3, circle3);
   ellipse(25, circle2, circle3, circle3);
   
  strokeWeight(w);
  stroke(rgb);
  fill(rgb,215,x,random(rgb));
  quad(x,x,86,20,69,63,30,76); //center arrows
  quad(circle3,circle3,136,70,119,104,80,126);
  quad(z,z,186,120,169,154,130,176);
  quad(150,150,236,170,219,204,180,226);
  quad(200,200,286,220,269,254,230,276);
  quad(250,250,336,270,319,304,280,326);
  quad(circle2,circle2,386,320,369,354,330,376);
  quad(350,350,436,370,419,404,380,426);
  quad(400,400,486,420,469,454,430,476);
  quad(450,450,536,470,519,504,480,526);
  quad(500,500,586,520,569,554,530,576);
  x = x + 5;
  
  strokeWeight(4);
  stroke(rgb);
  fill(32,178,170,35);
  quad(90,-10,176,10,159,53,120,66);
  quad(190,90,276,110,259,153,220,166);
  quad(290,190,376,210,359,253,320,266);
  quad(390,290,476,310,459,353,420,366);
  quad(490,390,576,410,559,453,520,466);
  
  quad(10,110,86,130,79,173,40,186);
  quad(110,210,196,230,179,273,150,286);
  quad(210,310,296,330,279,373,250,386);
  quad(310,410,396,430,379,473,350,486);
  quad(410,510,496,530,479,573,450,586);
  
  strokeWeight(random(w));
  stroke(rgb);
  fill(random(rgb), random(rgb), random(rgb), z);
  rect(mouseX,mouseY,random(z),random(z));
   
  
 }
//background and animation restart when center of screen is clicked//
    void mousePressed(){
     if (mouseX > circle2 && mouseX < circle2+circle3 && mouseY > circle1 && mouseY < circle1+circle2) {
       button = !button;
     }
     if (x > 600) {
       x = 0;
     }
     if (a < 0) {
       a = 600;
     }
   }




 
   

