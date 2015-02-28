
class CreditsScreen{
  
  
  int frame = 0;
  int frames = 22 * rate;
  boolean alive = true;
  int a1,a2,a3 = 0;
  int scrollRate = 1;
  PImage cred1, cred2, cred3;
 
 CreditsScreen(){
   alive = true;  
   cred1 = loadImage("images/Creds1.jpg");
   cred2 = loadImage("images/Creds2.jpg");
   cred3 = loadImage("images/Creds3.jpg");
  }
 
 void update(){
   a1+=10;
   
   if(frame>=40){
     a2+=10;
   }
   
   if(frame>=80){
     a3+=10;
   }
   
   if(frame>=400){
     //scrollY-=scrollRate;
   }
   
   fill(0, a1);
   rect(0,0,width,height);
   image(cred1, 0, 0);
   fill(0, a2);
   rect(0,0,width,height);
   image(cred2, 0, 0);
   fill(0, a3);
   rect(0,0,width,height);
   image(cred3, 0, 0);
   
   
   
   if(frame<frames){
      frame++;
   }else{
     /// kill(); end of show resart
   }
 }
 
 void kill(){
    alive = false;
  //clear it 
 }
 
}

