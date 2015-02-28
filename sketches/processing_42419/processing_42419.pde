
PImage img;
PImage img2;
PImage img3;
PImage img4;


void setup(){
  
  size (415,270);
  
  img = loadImage("paul.jpg");
  img2 = loadImage("john.jpg");
  img3 = loadImage("george.jpg");
  img4 = loadImage("ringo.jpg");

}
  
void draw(){
  

  fill(200);
  rect(0,0,415,270);
  
  
   image(img,5,5);
   image(img2,212,5);
   image(img3,5,135);
   image(img4,212,135);

   

   println(mouseY);
   println(mouseX);

   
   if((mousePressed==true) 
   && (mouseY>0 && mouseY<130)
   && (mouseX<200)
   ){
     tint(255,255,0);
     image(img,5,5);
     noTint();
     image(img,212,5);
     image(img,5,135);
     image(img,212,135);  }
     
     
     
     
   if((mousePressed==true) 
   && (mouseY>0 && mouseY<150)
   && (mouseX>210)
   ){
    copy(210,5,200,150,5,5,406,255); 
    noFill();
    image(img2,212,5); 

   }
   
   
   
     
   if((mousePressed==true) 
   && (mouseY>130 && mouseY<260)
   && (mouseX>0) &&(mouseX<205)
   ){  
        image(img3,5,135);
        scale(0.5);
        image(img3,5*2,135*2);
        image(img3,210,135*2);
        image(img3,5*2,395);
        image(img3,210,395);
}
     
  if((mousePressed==true) 
   && (mouseY>110 && mouseY<290)
   && (mouseX>=200) 
   ){
     tint(0,255,0);
     tint(255,255,0);
     image(img,5,5);
     tint(0,255,0);
     image(img2,212,5);
     tint(0,0,255);
     image(img3,5,135);
     noTint();
     image(img4,212,135);  }
      
      else{
      
      noTint();


      }

   }
   
  



   


     
 


  




