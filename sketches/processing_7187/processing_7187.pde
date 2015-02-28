

 int ex= 320;
 int ey= 230;
 int eh =120;
 int ew= 120;
 int s=130;
 int d= eh/2+7;
 int d2= eh/2+2;
 float blink=100;
 float anger;
boolean bg =false;
 

void setup(){        
  smooth();
  size(640,480);
  
}
void keyPressed(){
 if(bg == true) {
  bg = false;
 } 
  else{bg=true;
  }
}
void draw(){
  

  
  
float m=map(mouseX,0,640,164,218);
float m2=map(mouseX,0,640,424,478);
float m3=map(mouseX,0,640,175,205);
float m4=map(mouseX,0,640,435,465);



//NIGHT EYES
 if (bg == true){
     // background(#171a1e);
background(#182131);
      // anger=anger-1.75;
 
 noStroke();
   
   strokeWeight(5);
  


//eye


   stroke(0);
  
  fill(#efd336);
 ellipse(ex-s,ey,eh,ew);
 ellipse(ex+s,ey,eh,ew);
  noStroke();
   fill(#F24100,100);
ellipse(m3,ey,eh/1.35,ew/1.35);
 ellipse(m4,ey,eh/1.35,ew/1.35);
   
//pupil
 
   fill(0);
   stroke(#1f140b);
  ellipse(m,ey,eh/2,ew/2);         
  ellipse(m2,ey,eh/2,ew/2);
  
//white shine
  
   fill(255);
   noStroke();
  ellipse(ex-100,ey,eh/10,ew/10);  
  ellipse(ex+160,ey,eh/10,ew/10);
  

  
  //NIGHT eyelids
  
if (mousePressed){
  
fill(#182131);
   //fill(255);
float my =constrain(mouseY,0,300);
quad(50,0,320,0,320,my,50,150);
quad(590,0,320,0,320,my,590,150);


}

  strokeWeight(10);
  noFill();
stroke(0,125);
 ellipse(190,230,135,135);
 ellipse(450,230,135,135);
 
 stroke(0,75);
 ellipse(190,230,155,155);
 ellipse(450,230,155,155);
 
 stroke(0,25);
 ellipse(190,230,175,175);
 ellipse(450,230,175,175);



// DAY EYES
}else{
   background(255);
   strokeWeight(5);
   
   // eye
   stroke(0);
   noStroke();
   fill(230);
   
 
  fill(#efd336);
 ellipse(ex-s,ey,eh,ew);
 ellipse(ex+s,ey,eh,ew);
 noStroke();
   fill(#F24100,100);
 ellipse(ex-s,ey,eh/1.35,ew/1.35);
 ellipse(ex+s,ey,eh/1.35,ew/1.35);
 
   
//pupil
    anger=anger + dist(mouseX,mouseY,pmouseX,pmouseY)/50;
if(anger>0){
  anger=anger-0.1;
   fill(0);
   stroke(#1f140b);
  ellipse(ex-s,ey,eh/2+anger,ew/2+anger);  
  ellipse(ex+s,ey,eh/2+anger,ew/2+anger);
  
  if(anger>20){
    anger=20;
   }
}
     fill(0);
     stroke(#1f140b);
     ellipse(ex-s,ey,eh/2,ew/2);  
  ellipse(ex+s,ey,eh/2,ew/2);



//white shine
  
   fill(255);
   noStroke();
  ellipse(ex-100,ey,eh/10,ew/10);  
  ellipse(ex+160,ey,eh/10,ew/10);
  
  //
  blink=blink+1.75;
   noStroke();
   fill(255);
ellipse(ex-s,blink,eh,ew);
 ellipse(ex+s,blink,eh,ew);
 
 if (blink>230){
   blink=230;
 }
 
 if (mousePressed ==true){
     blink=blink-7;
 }
 
 //SHADOW

pushMatrix();
int x=4;
  
  strokeWeight(10);
  noFill();
  for(int i =125;i>=0;i-=50){
    //stroke(#938A68,i);
    stroke(#98968F,i);
 ellipse(190,230,130+x,130+x);
 ellipse(450,230,130+x,130+x);
x+=19;
}
popMatrix();
}




  //BLACK OUTLINES
  
noStroke();
  fill(0);
  triangle(ex-d,ey,ex-d,ey+40,ex-d-15,ey+40);
  triangle(ex+d,ey,ex+d,ey+40,ex+d+15,ey+40);
  
  triangle(ex-s,ey-d2,ex-s-40,ey-d2,ex-s-40,ey-d2+15);
  triangle(ex+s,ey-d2,ex+s+40,ey-d2,ex+s+40,ey-d2+15);
  


 noFill();
 stroke(0);
   strokeWeight(6);
 ellipse(ex-s,ey,eh,ew);
 ellipse(ex+s,ey,eh,ew);
 
  //

}
 



