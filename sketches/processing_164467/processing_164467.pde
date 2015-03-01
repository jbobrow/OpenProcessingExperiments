
float a = 0.0;
void setup(){
  size(700,700);
}

 
void draw(){

   if(key=='q'|| key=='Q'){
  Proximity();
   }
  if(key=='w'|| key== 'W'){
     Closure();
  }
  if(key=='a'|| key== 'A'){
    Closure02();
  }
    


}

void Proximity(){
  fill(2); 
rect(0,0,700,700); //black frame
if (mousePressed){
fill(248); 
rect(15,15,670,670);//white frame
}


fill(0,8,844); 
noStroke(); 
rect(30,30,199,366);//bule one

fill(233,233,0); 
noStroke(); 
rect(287,30,154,122); //yellow one

fill(3); 
rect(445,30,225,122);//black top right 

fill(55,55,55); 
noStroke(); 
rect(235,158,206,242);//black

fill(235,244,0); 
rect(573,158,97,242); // green yellow

fill(244,241,2); 
rect(30,402,199,122);//yellow 

fill(230,0,0); 
rect(30,529,100,141);//red 

fill(100,120,130); 
rect(135,529,94,141); //gray

fill(232,0,0); 
rect(345,406,96,156);//red


fill(7); 
rect(235,568,206,102);//black 

fill(56,70,226); 
rect(445,406,225,225);//bule 

fill(99,72,500); 
rect(445,636,225,34); 

} 

void Closure(){
  
  smooth(); 
 
colorMode(HSB,360,100,100);
  
  fill(0,0,100,3); 
rect(0,0,800,800); 
a += 0.2; //Incremental angle, the speed
translate(mouseX,mouseY); // The origin of the shift to the mouse coordinates
rotate(a); 

fill(random(360),100,100); 
ellipse (-100,0,50,50); 
ellipse(-100,0,10,10); 
ellipse(100,0,10,10); 

}

void Closure02(){
 translate(350, 350); // x,y move to center
for (int an=1; an<360;an++) { //begin loop, angle<360
rotate(2*PI/an); //rotate angle 2*pi
niuniuniu(); // the image
} 
} 

void niuniuniu() { 
noFill(); 
beginShape(); //start 
vertex(0, 0); // the x is 0, y is 0
int c1 = int(random(100, 250)); 
int c2 = int(random(-40, 250)); 
stroke(100, 212, 101, 100); // ilnes color
bezierVertex(c2, c2, c1, c2, c1, c2); //set coordinate int c1 and c2 in sketch
bezierVertex(c1, c2, c1, c2, c1, c2); 
endShape(); // end
fill(250, 140, 63, 200); // point color
noStroke(); 
ellipse(c1, c2, 5, 5); // ellipse size and place
} 
 

  


  



