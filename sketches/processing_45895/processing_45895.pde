
PImage monImage ;

void setup (){
  
  size (700, 700) ;
  monImage=loadImage("pinpanpoum.JPG") ;
   image(monImage, 0, 0, 700, 700);
   
  
}

void draw (){
   image(monImage, 0, 0, 700, 700);
   if (mousePressed) {
   for (int a=0 ; a <width ; a++) {
     color maCouleur = monImage.get (a,0 );
     stroke (maCouleur) ;
     line (a,0,a, height) ;
  
       }
    }
}



