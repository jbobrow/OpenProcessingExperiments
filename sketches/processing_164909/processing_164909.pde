
int scalar = 250;
int h = 5;
int w = 10;
float r = random(5,100);

float angle = 0.0;
float angleDirection = 1;
float speed = 0.005;
 
void setup() {
  size(900, 500);
  background(30);
  frameRate(2);
  smooth();
}
 
void draw() {


fill(0);
rect(0, 0, width, height); 

fill(40, random (60,200), random(10,90));
rect(650, 150, 150, 55);  
fill(200);
rect(620, 205, 210, 15);    
fill (240,222,189);
ellipse (765, random(135,145), 30, 30);//DJ


for (int y=250; y < 500; y = y +25) {
  for (int x=0; x < 900; x = x +25) {
    fill(random(100,200),random(0,45),random(100,250), 5);
    rect (x,y,40,40);
    
    
            fill (240,222,189);
ellipse (random (50, 890), random(255, 590), 30, 30);//people



    
    
    if (mousePressed) {
 
float k = 100 + cos(angle) * scalar+2;//purple light
float l = 250 + sin(angle) * scalar+10;       
    noStroke();
    fill(random(100,200),random(0,45),random(100,250), 5);
    triangle(200, 0, k-50, 300, l, 500); 
    angle+=speed;
    
    
float o = 400 + sin(angle) * scalar*2;//green light
float p = 450 + sin(angle) * scalar*2;       
    noStroke();
    fill(random(0,20),random(100,210),random(25,190), 5);
    triangle(700, 0, o+100, 300, p-100, 500); 
    angle+=speed;

    
    }
    


 else {
  fill(169,223,242);
rect(0, 0, width, height); //top of dance floor

fill(45);
rect(650, 150, 150, 55);  
fill(200);
rect(620, 205, 210, 15);

    

       fill (200);
for (int a=250; a < 500; a = a +50) {
  for (int b=0; b < 900; b = b +50) {
    rect (b,a,40,40);
    noStroke();
  }
}  




 
}
   
 }
   


   }
  }
