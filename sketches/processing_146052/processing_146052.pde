
float xt1,xt2,xt3,yt1,yt2,yt3;


void setup(){
  

  
size(851,315);
colorMode(HSB, 360,100,100); 

text("click to draw", 30,30);

}



void draw(){
  
   
  
 if (mousePressed == true){
 
 tutorial = false;  
 xt1 = random(-100,width+100);
 xt2 = random(-100,width+100);
 xt3 = random(-100,width+100);
 
 yt1 = random(-200,height+200);
 yt2 = random(-200,height+200);
 yt3 = random(-200,height+200);
 
 fill(300,100,50,5);
 rect(0,0,width,height); 
 noStroke();
 fill(200,random(100),80,50);
 triangle (xt1,yt1,xt2,yt2,xt3,yt3); 
 }
  
 
}
