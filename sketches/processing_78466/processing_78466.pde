
//int count = 0;
//int c= 10;
PFont f;
void setup(){
   size(500,500);
   f =createFont("Helvetica",14,true);
   background(0);
    
}  

void draw(){
   background(0);
   textAlign(CENTER);
   textFont(f,14);
   fill(255);
   text("Ende",465,493);
   text("Anfang",45,493);
   //text("Bedeutungen",width/2,height/2);
   text("offen",width/2,480);
   smooth();

   ellipse(10,480,7,7);
   ellipse(10,490,7,7);
   
   ellipse(490,490,7,7);
   ellipse(width/2,490,7,7);
   ellipse(width/2+10,490,7,7);
   ellipse(width/2-10,490,7,7);
   
   
}


