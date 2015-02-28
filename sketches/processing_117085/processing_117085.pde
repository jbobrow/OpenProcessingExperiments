

PFont font1, font2, font3, font4, font5 ; 


PImage img1, img2, img3, img4, img5, img6, img7; 


String p0 = "Let me not to the marriage of true minds."; 


String p1 = "Admit impediments. Love is not love,"; 


String p2 = "Which alters when it alteration finds"; 


String p3 = "Or bends with the remover to remove:"; 


String p4 = "no, it is an ever- mark"; 



String[] p = {"Let me not to the marriage of true minds.","Admit impediments. Love is not love,","Which alters when it alteration finds", 


"Or bends with the remover to remove:","no, it is an ever- mark","But only into flesh and a broken whisper."}; 





int page = 0;


void setup(){ 


  size(600,600); 

  font1= loadFont("LucidaBright-48.vlw"); 


  font2= loadFont("ShonarBangla-48.vlw"); 


  font3= loadFont("Batang-48.vlw"); 


  font4= loadFont("YDIYMjO230-48.vlw"); 


  font5= loadFont("David-Bold-48.vlw"); 



 
  img1 = loadImage("1.jpg"); 


  img2 = loadImage("2.jpg"); 


  img3 = loadImage("3.jpg"); 


  img4 = loadImage("4.jpg"); 


  img5 = loadImage("5.jpg"); 


  img6 = loadImage("6.jpg"); 
  
  img7 = loadImage("7.jpg"); 
  
}

void draw() {
   textAlign(CENTER);
  if (page == 0) {
    background(50, 0, 0);
     pushMatrix(); 


  image(img1,0,0); 


  popMatrix(); 
   
    /*   
     code here to draw something for the first page,     
     or create page funtions such as 
     cardOne();
     
     */
  }  
  else if (page == 1) {  
   textAlign(RIGHT); 


  image(img3,0,0); 





  textFont(font2,20); 
  text(p[5],mouseX,200); 

  } 
  else if (page == 2) {  
      image(img5,0,0); 


  img2.filter(ERODE); 


  textAlign(CENTER); 


  fill(255);  


  textFont(font3,20); 
  text(p[5],mouseX,200); 

  }
  else if (page  == 3) { 
    image(img2,0,0); 

 img2.filter( ERODE); 



  textAlign(CENTER); 


  fill(255);  


  textFont(font4,1); 
    text(p[5],mouseY,100); 

  }
  else if (page  == 4) {  
   image(img4,0,0); 
     img2.filter(THRESHOLD); 
    text(p[5],mouseY,100); 


  textAlign(LEFT); 


  fill(0);  


  textFont(font5,18); 




  
 }
  else if (page  == 5) {  
   image(img6,0,0); 
     img2.filter(OPAQUE); 
    text(p[5],mouseY,100); 


  textAlign(LEFT); 


  fill(0);  


  textFont(font5,18); 
 }
  else if (page  == 7) {  
   image(img6,0,0); 
     img2.filter(OPAQUE); 
    text(p[5],mouseY,200); 


  textAlign(LEFT); 


  fill(0);  


  textFont(font1,18); 
 }
  else if (page  == 6) {  
   image(img7,0,0); 
     img2.filter(ERODE); 
    text(p[5],mouseY,200); 


  textAlign(LEFT); 


  fill(255);  


  textFont(font1,18); 





  
}


}
void mousePressed() {  

  if (page == 0) {  
    page = 1;
  } 
  else if (page == 1) {  
    page = 2;
  }
  else if (page == 2) {
    page = 3;
  }
  else if (page == 3) {
    page = 4;
  }  
  
  else if (page == 4) {
    page = 5;
  }
 else if (page == 5) {
    page = 6;
      }
 else if (page == 6) {
    page = 7;
          }
 else if (page == 7) {
    page = 0;
  }

}

void pageOne() {
  /*   
   code here to draw something for the first page,  
   */
}


void pageTwo() {
  /*   
   code here to draw something for the first page,  
   */
}


