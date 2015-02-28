

boolean x = false;
PFont f;

void setup() {
  x = false;
  size(600, 200);
  smooth();
  background(0,0,200);
  f = loadFont("ComicSansMS-48.vlw");
  fill(255);
  //orientation(LANDSCAPE);
}

  
  
void draw() {
 //pushMatrix();
   //translate(40,40); 
   //ellipse(n, p, 10, 10);
   textFont(f,36);
   background(0,255,0);
   
   if (mousePressed){
   //ellipse(mouseX, mouseY, 10, 10);
     x=false;
     text("Drag me off the screen!",mouseX-180,mouseY);
     line(20,20,560,20);
     line(20,20,20,180);
     line(20,180,560,180);
     line(560,180,560,70);
     if(mouseY < 50){
       background(255,0,0);
       line(20,20,560,20);
       line(20,20,20,180);
       line(20,180,560,180);
       line(560,180,560,70);
       text("Drag me off the screen!",mouseX-180,50);
       }
     if(mouseX < 200){
       background(255,0,0);
       line(20,20,560,20);
       line(20,20,20,180);
       line(20,180,560,180);
       line(560,180,560,70);
       text("Drag me off the screen!",20,mouseY);
       }
     if(mouseY < 50 && mouseX < 200){
       background(255,0,0);
       line(20,20,560,20);
       line(20,20,20,180);
       line(20,180,560,180);
       line(560,180,560,70);
       text("Drag me off the screen!",20,50);
     }
     if(mouseY > 170){
       background(255,0,0);
       line(20,20,560,20);
       line(20,20,20,180);
       line(20,180,560,180);
       line(560,180,560,70);
       text("Drag me off the screen!",mouseX-180,170);
       }
     if(mouseX > 337 && mouseY > 70){
       background(255,0,0);
       line(20,20,560,20);
       line(20,20,20,180);
       line(20,180,560,180);
       line(560,180,560,70);
       text("Drag me off the screen!",155,mouseY);
       }
     if(mouseY > 170 && mouseX < 200){
       background(255,0,0);
       line(20,20,560,20);
       line(20,20,20,180);
       line(20,180,560,180);
       line(560,180,560,70);
       text("Drag me off the screen!",20,170);
     }
     if(mouseY > 170 && mouseX > 337){
       background(255,0,0);
       line(20,20,560,20);
       line(20,20,20,180);
       line(20,180,560,180);
       line(560,180,560,70);
       text("Drag me off the screen!",155,170);
     }
     if(mouseX > (width-10)){
       background(0,0,255);
       text("FUCK YOU! You still lose...",20,120);
       x=true;
     }
     
   }
   else{
      if (x==false){
        text("Drag me off the screen!",20,120);
      }
      else{
       background(0,0,255);
       text("FUCK YOU! You still lose...",20,120);
      }
   }
 
    
   //rect(20,20,560,160);
/*   for (int i = 0; i < 120; i++){
      x=x+1;
      y=y-1;
      ellipse(x, y, 10, 10);
   }  */ 
   //delay(1000);
    //stroke(0,128,128);
    //ellipse(n, p, 10, 10);
    
    //stroke(255,0,0);
  //  line(0,0,n,p);
  //  line(width,0,n,p);
  //  line(0,height,n,p);
  // line(width,height,n,p);
   // println(mouseX + ", " + mouseY);
    //delay(100);
   // }
  //popMatrix();
}

