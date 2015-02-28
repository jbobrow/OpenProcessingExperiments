
float marsx;
float marsy;
float earthx;
float earthy;
float venusx;
float venusy;
float mercuryx;
float mercuryy;
float speed;
float theta1;
float theta2;
float theta3;
float theta4;
 void setup(){
 background(0,0,0);
 size(750,750);
  
       //variables
         marsx=100;
         marsy=375;
         earthx=180;
         earthy=375;
         venusx=225;
         venusy=375;
         mercuryx=270;
         mercuryy=375;
         speed=2;
         theta1=PI;
         theta2=3/4*PI;
         theta3=1/2*PI;
         theta4=1/4*PI; 
         
}
void draw(){
 fill(0); 
 rect(0,0,750,750);
  stroke(155,155,155);
   noFill();
   ellipse(375,375,550,550); //1st ring - Mars  
   ellipse(375,375,390,390); //2nd ring - Earth 
   ellipse(375,375,300,300); //3rd ring - Venus
   ellipse(375,375,210,210); //4th ring - Mercury
     stroke(209,115,67);
     fill(209,115,67);
     ellipse(marsx,marsy,20,20);//Mars
     stroke(35,129,29);
     fill(35,129,29);
     ellipse(earthx,earthy,20,20); //Earth
     stroke(250,154,58);
     fill(250,154,58);
     ellipse(venusx,venusy,20,20); //Venus
     stroke(140,140,140);
     fill(140,140,140); 
     ellipse(mercuryx,mercuryy,20,20); //Mercury
     stroke(255,243,0);
     fill(255,243,0);
     ellipse(375,375,95,95);          //Sun
  if (theta1>=2*PI){
  theta1=0;
  }   
  if (theta1<=2*PI){  
        marsx=375+cos(theta1)*275;
        marsy=375+sin(theta1)*275;
        theta1=theta1+.0075;
  }
  if (theta2>=2*PI){
  theta2=0;
  }
  if (theta2<=2*PI){      
        earthx=375+cos(theta2)*195;
        earthy=375+sin(theta2)*195;
        theta2=theta2+.01;
  }      
  if (theta3>=2*PI){
  theta3=0;
  }  
  if (theta3<=2*PI){      
        venusx=375+cos(theta3)*150;
        venusy=375+sin(theta3)*150;
        theta3=theta3+.009;
  }
  if (theta4>=2*PI){
  theta4=0;
  }
  if (theta4<=2*PI){      
        mercuryx=375+cos(theta4)*105;
        mercuryy=375+sin(theta4)*105;
        theta4=theta4+.02;
  }      
        
       
    
       
}
      
   
  
//planets
  
  
  
  
  
  
  
  
  

