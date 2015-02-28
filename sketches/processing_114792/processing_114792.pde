

void setup(){
 size (1100,800); 
 
 

}

void draw(){

  /*
  if (mousePressed == true){
   background(0,23,252);
} else{
  
 */
 


  
noStroke();
 

background(255);


rectMode(CENTER);  
  
  
  // Bright red  1
  
fill(255,3,3);
float d = sin(frameCount*0.007)*150;
rect(width/5.3, height/1.5, d , d);


// Dark red   2

fill(0,232,13,10);
 float r = sin(frameCount*0.008)*550;
ellipse(width/2, height/1.5, r , r);

// Pink (pale red)  3

fill(0,21,232);
float c = sin(frameCount*0.009)*150;
rect(width/1.2, height/1.5, c , c);







// Dark red   4

fill(0,232,13,150);
 float m = sin(frameCount*0.01)*150;
rect(width/5.3, height/2.5, m , m);

// 5

fill(161,255,0);
float j = sin(frameCount*0.02)*50;
ellipse(width/2, height/2.5, j , j);



// Pink (pale red)   6

fill(255,0,107);
float g = sin(frameCount*0.03)*150;
rect(width/1.2, height/2.5, g , g);










// Pink (pale red)   8

fill(136,3,255,50);
float f = sin(frameCount*0.01)*250;
ellipse(width/5.3, height/5.2, f , f);



// Pink (pale red)   9

fill(3,255,118,110);
float y = sin(frameCount*0.02)*150;
rect(width/2, height/5, y , y);



// Pink (pale red)   7

fill(255,0,0,200);
float w = sin(frameCount*0.03)*150;
rect(width/1.2, height/4.2, w , w);


  





fill(246,255,0,200);
float u = sin(frameCount*0.01)*150;
rect(width/2.6, height/2.2, u , u);



// Pink (pale red)   9

fill(220,0,250,150);
float q = sin(frameCount*0.02)*150;
rect(width/2.9, height/5, q, q);



// Pink (pale red)   7

fill(0,255,206);
float a = sin(frameCount*0.006)*150;
rect(width/3.2, height/3.2, a , a);


}







