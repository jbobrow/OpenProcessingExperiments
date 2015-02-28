
//V-Man by Kennen Pflughoeft
float fly = 0;
float land = 1;
float bounce = 0;
float absorb = .7;
float gaze= 0; 
float flex = 0;
float hand= 26;
float forearm = 41;
float bicept= 60;
float shoulder= 80;
float leg = 90;
float peck = 88;
float ab= 92;
float eye = 95;
float x= 0;
float speed= .5;





void setup() {
  size(200,200);
  smooth();
  strokeWeight(1);
  int value = 0;
  }  


void draw(){

  if((pmouseY - mouseY) > 5){//flap arms to fly
  fly = fly-2; 
  gaze = 4;
  }

  if (keyPressed ==true) {//fall back to the ground
    land = land*1.1 ; 
    flex++;

  } if(land + fly > 10) {  
    land= land/1.5;
    fly= fly/1.5; 
    gaze= 0;
    }

 
 
  background(0);
 println(fly);  
 println(land);
  noFill();
  strokeWeight(2);
  stroke(abs(mouseY*1.25)); 
//Outter circle and quad  
    ellipse(100,100+fly+land,200,200);//large outter circle
    stroke(abs((mouseY-200)*1.25));
    quad(17,35+fly+land,17,200+fly+land,183,200+fly+land,183,35+fly+land);//large outter square
       if(mouseY > 100){
         stroke(abs(mouseY*1.25));
         ellipse(100,100+fly+land,200,200);
       }
  // } 
   strokeWeight(1);
 //arms
  fill(255);
  stroke(255);
  x = x +speed;
  
    ellipse( hand +(mouseY/40),((-mouseY/6.8)+70)+fly+land,18,10); //left hand
    
    ellipse(forearm +(mouseY/40),(70-(mouseY/8.8))+fly+land,22,12);
    ellipse(bicept +(mouseY/40),(70-(mouseY/12.8))+fly+land,22,12);
    ellipse(shoulder,(70-(mouseY/25))+fly+land,20,20); 
    ellipse(width-hand-(mouseY/40),((-mouseY/6.8)+70)+fly+land,18,10); //right hand
    ellipse(width-forearm-(mouseY/40),70-(mouseY/8.8)+fly+land,22,12);
    ellipse (width-bicept-(mouseY/40),(70-(mouseY/12.8))+fly+land,22,12);
    ellipse(width-shoulder,(70-(mouseY/25))+fly+land,20,20);

//legs
    
    ellipse(leg-(mouseY/14.5),(145-(mouseY/50))+fly+land,16,37); //inner left leg
    ellipse(leg-(mouseY/8.7),(164-(mouseY/40))+fly+land, 12,12);
    ellipse(leg-(mouseY/6.5),(179-(mouseY/25))+fly+land, 12,26);
    ellipse(leg-(mouseY/5.5),(195-(mouseY/17))+fly+land,14,8); //inner right leg
    ellipse(width-leg +(mouseY/14.5),(145-(mouseY/50))+fly+land,16,37);
    ellipse(width-leg+(mouseY/8.7),(164-(mouseY/40))+fly+land, 12,12);
    ellipse(width-leg+(mouseY/6.5),(179-(mouseY/25))+fly+land, 12,26);
    ellipse(width-leg+(mouseY/5.5),(195-(mouseY/17))+fly+land,14,8);  
 
 //torso  
    ellipse(100,69+fly+land,10,10); //neck
    ellipse(peck,80+fly+land,22,22); //left peck
    ellipse(width-peck,80+fly+land,22,22); //right peck
    ellipse(ab,98+fly+land,14,7);
    ellipse(width-ab,98+fly+land,14,7);
    ellipse(ab,108+fly+land,14,7);
    ellipse(width-ab,108+fly+land,14,7);
    ellipse(ab,118+fly+land,14,7);
    ellipse(width-ab,118+fly+land,14,7);    
    ellipse(width/2,50+fly+land+bounce,23,27); //head 

//face
  fill(0);
    ellipse(eye,49+fly+land-gaze,4,4); //left eye
    ellipse(width-eye,49+fly+land-gaze,4,4);//right eye
    stroke(0);  
    line(width/2 -2,57+fly+land-gaze,width/2+2,57+fly+land-gaze);//mouth
    //ellipse(100,57+fly+land-gaze, 7,7);
  //  noStroke();
  //  fill(255);
  // ellipse(100,57+fly+land-gaze-smile,7,7);
  // if (fly < -100) {  
      

    

}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      //fillVal = 255;
    } else if (keyCode == LEFT) {
      //fillVal = 0;
    } 
  } else {
   // fillVal = 126;
  }
}

