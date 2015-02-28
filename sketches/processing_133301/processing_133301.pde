
/*Jacqueline Miller
HW loops
*/

class circle{  
 
PVector loc1 = new PVector();
PVector loc2= new PVector();
PVector yspeed1 = new PVector();
PVector yspeed2  = new PVector();
float diam;
boolean answer1;
boolean answer2;

 
 
circle(){
loc1 = new PVector(random(800),random(10));
loc2 = new PVector (random(799), random(10));
diam = 5;   
answer1 = false;   
answer2 = false;  }
 
void move(){
if(key=='1') { answer1 = true;} else {answer1=false;}  
if(key=='2') { answer2 = true;} else {answer2=false;} 

if(answer1 == true){
   yspeed1 = new PVector (random(-1,1),random(14));  
   loc1.add(yspeed1); 
  }
   
if(answer2 == true){
  yspeed2 = new PVector (random(-1,1),random(14)); 
  loc2.add(yspeed2);
 }
}

void display(){   //lets begin forming our cell
  stroke (0);
  fill(242,243,201);
  ellipse(loc1.x+(random(5)),loc1.y+(random(5)),diam,diam);   // since loc PVec defined randomly, loc x and loc y will be placed randomly
  ellipse(loc2.x+(random(5)),loc2.y+(random(5)),diam,diam);

if(loc1.y>height-10){
  loc1.y=height-10;
}

if(loc2.y>height-10){
  loc2.y=height-10;
  }
 }
}
   
circle[] mycircles= new circle[200];

boolean answer1=false;
boolean answer2=false;

void setup(){
  background(0,0,0);
  size(500,500);
  smooth();
 
  for(int i =0; i<mycircles.length; i++) {
  mycircles[i] = new circle();
 }
} 
 
void draw(){
  background(0); 
  stroke(43,43,43);
  fill(43,230,180,30);
  rect (100,400, 50,100);
   
  stroke(43,43,43);
  fill(43,230,180,30);
  rect (300,400, 50,100);
for (int i=0; i<mycircles.length; i++){  
  mycircles[i].display();
  mycircles[i].move();

if(key=='1') { answer1 = true;} else {answer1=false;}  
if(key=='2') { answer2 = true;} else {answer2=false;} 
 } 
}



/*float a, b;
void setup(){
  size (500,500);
}
void draw(){
  
  float x0=map(sin(a), -1, 1, 20, width-20);
    float y0=map(cos(a), -1, 1, 20, width-20);
      float x1=map(sin(b), -1, 1, 20, width-20);
        float y1=map(cos(b), -1, 1, 20, width-20);
        
        line(x0, y0, x1, y1);
        a+=0.1; // how many are drawn depends on the difference between the decimals. 
       b+= b+ 0.9;
       
}

      */
