
float s=1;
float t=5;
float r=random(50);
int i=0;
int chasize = 50;
float q=0.0;
float w=0.0;
float disappear = 5;
float count_ceiling = 1000;
PImage img;


void setup(){
  size(700, 700);
//noStroke();
frameRate(100);
img = loadImage ("omg.png");

colorMode(HSB, 350, 100, 100);
}

void draw(){
//Random rects//
  //noFill();
  //stroke(random(160),19,46);
  //rect (0, 0, random(500), random(500) );
  
//Random Lines

  //stroke (random (199), 19, 20);
  //line (random(700), 0, 700, random(700));


   


//typography//
//fill(255);
//rect(0,0, width, height);


//if (dis < count_ceiling) {
  

if (disappear < count_ceiling){ disappear+=5;
if (chasize <1000) {
  textSize(chasize);
  text("IT", -100, 700);
  fill(random(350), random(100), random(100));
  chasize = chasize +10;
}  else if (chasize==1000) {textSize(chasize);fill(0);}
} else if(disappear >=count_ceiling && disappear < 8000){
  { textSize(700+chasize);
  fill(random(350), random(100), random(100));
    text("IT", -100, 700);
  
  chasize = chasize +10;
  disappear+=5;
}} 
  else if (disappear >7800 && disappear<10000){disappear +=5;
  //fill(255);
  //rect(0,0,width,height);

  textSize(100);
  fill(100);
  
  text("HURTS",200,200);
  
  }
   
   else if (disappear >10000 && disappear<12000){disappear +=5;

  textSize(100);
  fill(random(350),random(100),random(100));
  text("to",340,330);
  }
   
   else if (disappear >12000 && disappear<14000){disappear +=5;

  textSize(140);
  fill(random(350),random(100),random(100));
  text("LOOK",180,500);
  
   }
  
  
  
   
   //textSize(100);
   //fill(0);
   
   
   

   
   
   


  
 

/*else  {
  textSize(1000);
  text("IT", -100, 700);
  fill(random(350), random(100), random(100));}*/
  
    
  

//color mode test//

colorMode(HSB, 350, 100, 100);
stroke(random(350),random(220),100);


 //dots test//
 if (disappear<count_ceiling+7000){
   disappear+=5;
 i= i+20;
 strokeWeight(2);
 //point (random (700), 350);
 for(i=-400; i<700; i+= 20){
   noFill();
   rect(random(700), i, 10+random(100), 2);}
 }
 else if (disappear > count_ceiling+7020 && disappear<14500){
   disappear+=5; 
   i= i+20;
 strokeWeight(2);
 //point (random (700), 350);
 for(i=-400; i<1000; i+= 20){
   noFill();
   rect(random(700),i, 2, 10+random(100));}
  }
  
  else if (disappear>14250){ 
    disappear+=5; 
   i= i+20;
 strokeWeight(2);
 //point (random (700), 350);
 for(i=-400; i<1000; i+= 20){
   noFill();
   rect(random(700),i, random(100), 10+random(100));}
 
 
 
q = q+0.04;
w= cos(q)*2;
translate(width/2, height/2);
  scale(w); 
  noFill();
  rect(0, 0, 50, 50);

}


if (disappear > 17000) {disappear+=5;
 i= i+20;
 stroke(0);
 strokeWeight(2);
 //point (random (700), 350);
 for(i=-400; i<1200; i+= 20){
   noFill();
   rect(random(700), i, 10+random(100), 2);}
   float angle = 0.0;
for (int x = 0; x <= width; x += 5) {
  float y = 50 + (sin(angle) * 35.0+x);
  stroke(random(350),random(350),100);
  rect(x, y, 2, 4);
  angle += PI/12.0;
}

pushMatrix();

translate(20, 20);
float angle = 0.0;
for (int x = 0; x <= width; x += 5) {
  
  float y = 50 + (sin(angle) * 35.0+x);
  stroke(random(350),random(350),100);
  rect(x, y, 2, 4);
  angle += PI/12.0;
}
popMatrix(); 

 }

}
 
/*

//sin graph//





//scaling glitz//

 




}
*/


//dis+=5;
//}


