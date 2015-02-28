
int x=750;
int y =750;
int b =787;
int a = 418; 
int c = 0;
int k = 0;
PImage igm;
PImage gmi;
PImage img;
PImage xim;
void setup(){
  rect(300,50,100,100);
size(800,800);


img = loadImage("imgres-3.jpeg");
img.resize(800,800);
image(img,0,0);
rect(300,50,100,100);
gmi = loadImage("cat_black_white_line_art.png");
gmi.resize(70,70);
xim = loadImage("ElementarySchool.gif");
xim.resize(200,200);
image(xim,600,600);
triangle(290,50,350,10,410,50);
  rect(300,50,100,100);
  fill(203,243,255);
  rect(310,60,30,30);
  rect(360,60,30,30);
  fill(39,18,7);
  rect(330,100,40,53);
   fill(13,10,255);
//text("Cumulus Street",400,500);
  //text("Cirrus Street",450,320);
  



}
void draw(){
 if(mousePressed){ 
  println("mouseX: "+mouseX+" mouseY: "+mouseY);
 }
  fill(13,10,255);
  image(xim,600,600);
  fill(255,199,13);
  rect(300,50,100,100);
  fill(255,3,24);
  triangle(290,50,350,10,410,50);
  fill(203,243,255);
  rect(310,60,30,30);
  
  rect(360,60,30,30);
  fill(255,3,24);
  rect(330,100,40,53);
  
  fill(20,244,250);
  rect(500,50,100,100);
  fill(255,3,24);
  triangle(490,50,550,10,610,50);
  fill(203,243,255);
  rect(510,60,30,30);
  rect(560,60,30,30);
  fill(255,3,24);
  rect(530,100,40,53);
  
   fill(10,247,75);
  rect(700,50,100,100);
  fill(255,3,24);
  triangle(690,50,750,10,810,50);
  fill(203,243,255);
  rect(710,60,30,30);
  rect(760,60,30,30);
  fill(255,3,24);
  rect(730,100,40,53);
  
    fill(105,59,216);
  rect(100,50,100,100);
  fill(255,3,24);
  triangle(90,50,150,10,210,50);
  fill(203,243,255);
  rect(110,60,30,30);
  rect(160,60,30,30);
  fill(255,3,24);
  rect(130,100,40,53);
  
  fill(196,190,190);
  rect(130,130,40,200);
  rect(330,130,40,200);
  rect(530,130,40,200);
  rect(730,130,40,200);
  rect(100,300,800,40);
  rect(400,300,40,700);
   fill(28,7,72);
textSize(20);
    rotate(HALF_PI);
   translate(0,-915);
text("Cumulus Street",400,500);
rotate(PI+HALF_PI);
translate(-915,0);
  text("Cirrus Street",450,320);
  image(gmi,a,b);
  if(keyPressed){
    
    if(key == CODED){
      if(keyCode == RIGHT){
        if(b>280&&b<797&&a>370&&a<400){
         a=370;}
         else if(b>90&&b<247&&a>510&&a<540){
           a = 505;}
         else if(b>90&&b<247&&a>726&&a<757){
          a= 720; 
         }
         else if(b>90&&b<247&&a>329&&a<359){
           a=325;
         }
      else if(b>90&&b<247&&a>100&&a<150){
           a = 110;
           
           
      }else{   
     if(a>750){
         
     }
      }
     
        
  
image(img,0,0); 
image(xim,600,600);

fill(255,199,13);
rect(300,50,100,100);
fill(255,3,24);
triangle(290,50,350,10,410,50);
fill(203,243,255);
rect(310,60,30,30);
  rect(360,60,30,30);
  fill(255,3,24);
  rect(330,100,40,53);
  
  fill(20,244,250);
  rect(500,50,100,100);
  fill(255,3,24);
  triangle(490,50,550,10,610,50);
  fill(203,243,255);
  rect(510,60,30,30);
  rect(560,60,30,30);
  fill(255,3,24);
  rect(530,100,40,53);
  
   fill(10,247,75);
  rect(700,50,100,100);
  fill(255,3,24);
  triangle(690,50,750,10,810,50);
  fill(203,243,255);
  rect(710,60,30,30);
  rect(760,60,30,30);
  fill(255,3,24);
  rect(730,100,40,53);
  
    fill(105,59,216);
  rect(100,50,100,100);
  fill(255,3,24);
  triangle(90,50,150,10,210,50);
  fill(203,243,255);
  rect(110,60,30,30);
  rect(160,60,30,30);
  fill(255,3,24);
  rect(130,100,40,53);
  
  fill(196,190,190);
  rect(130,130,40,200);
  rect(330,130,40,200);
  rect(530,130,40,200);
  rect(730,130,40,200);
  rect(100,300,800,40);
  rect(400,300,40,700);
  textSize(20);
  fill(28,7,72);
 rotate(HALF_PI);
   translate(0,-915);
text("Cumulus Street",400,500);
rotate(PI+HALF_PI);
translate(-915,0);
  text("Cirrus Street",450,320);
  
image(gmi,a=a+5,b);
image(xim,600,600);

      }
 if(keyPressed){
    if(key == CODED){
      if(keyCode == LEFT){
        if(b>280&&b<797&&a>360&&a<390){
         a=380;}
         else if(b>90&&b<247&&a>500&&a<540){
           a = 515;
         }
             else if(b>90&&b<247&&a>726&&a<757){
          a= 740; 
         }
         else if(b>90&&b<247&&a>329&&a<359){
           a=335;
         }
      else if(b>90&&b<247&&a>100&&a<150){
           a = 120;
           
           
      }else{
        if(a<50){
        a=47;
        }
        }
        
image(img,0,0);
fill(255,199,13);
rect(300,50,100,100);
fill(255,3,24);
triangle(290,50,350,10,410,50);
fill(203,243,255);
rect(310,60,30,30);
  rect(360,60,30,30);
  fill(255,3,24);
  rect(330,100,40,53);
  
  fill(20,244,250);
  rect(500,50,100,100);
  fill(255,3,24);
  triangle(490,50,550,10,610,50);
  fill(203,243,255);
  rect(510,60,30,30);
  rect(560,60,30,30);
  fill(255,3,24);
  rect(530,100,40,53);
  
   fill(10,247,75);
  rect(700,50,100,100);
  fill(255,3,24);
  triangle(690,50,750,10,810,50);
  fill(203,243,255);
  rect(710,60,30,30);
  rect(760,60,30,30);
  fill(255,3,24);
  rect(730,100,40,53);
  
    fill(105,59,216);
  rect(100,50,100,100);
  fill(255,3,24);
  triangle(90,50,150,10,210,50);
  fill(203,243,255);
  rect(110,60,30,30);
  rect(160,60,30,30);
  fill(255,3,24);
  rect(130,100,40,53);
  
  fill(196,190,190);
  rect(130,130,40,200);
  rect(330,130,40,200);
  rect(530,130,40,200);
  rect(730,130,40,200);
  rect(100,300,800,40);
  rect(400,300,40,700);
   fill(28,7,72);
textSize(20);
   rotate(HALF_PI);
   translate(0,-915);
text("Cumulus Street",400,500);
rotate(PI+HALF_PI);
translate(-915,0);
  text("Cirrus Street",450,320);
image(gmi,a=a-5,b);
image(xim,600,600);

      }
       if(keyPressed){
    if(key == CODED){
      if(keyCode == UP){
        if((a>100&&a<145) || (a>315&&a<355) || (a>509&&a<540) || (a>719&&a<749)){
          println("in");
          
        }else{ 
          if(b<280){
          b=280;
        }
        }
        
image(img,0,0);
fill(255,199,13);
rect(300,50,100,100);
fill(255,3,24);
triangle(290,50,350,10,410,50);
fill(203,243,255);
rect(310,60,30,30);
  rect(360,60,30,30);
  fill(255,3,24);
  rect(330,100,40,53);
  
  fill(20,244,250);
  rect(500,50,100,100);
  fill(255,3,24);
  triangle(490,50,550,10,610,50);
  fill(203,243,255);
  rect(510,60,30,30);
  rect(560,60,30,30);
  fill(255,3,24);
  rect(530,100,40,53);
  
   fill(10,247,75);
  rect(700,50,100,100);
  fill(255,3,24);
  triangle(690,50,750,10,810,50);
  fill(203,243,255);
  rect(710,60,30,30);
  rect(760,60,30,30);
  fill(255,3,24);
  rect(730,100,40,53);
  
    fill(105,59,216);
  rect(100,50,100,100);
  fill(255,3,24);
  triangle(90,50,150,10,210,50);
  fill(203,243,255);
  rect(110,60,30,30);
  rect(160,60,30,30);
  fill(255,3,24);
  rect(130,100,40,53);
  
  fill(196,190,190);
  rect(130,130,40,200);
  rect(330,130,40,200);
  rect(530,130,40,200);
  rect(730,130,40,200);
  rect(100,300,800,40);
  rect(400,300,40,700);
  fill(28,7,72);
  rotate(HALF_PI);
   translate(0,-915);
text("Cumulus Street",400,500);
rotate(PI+HALF_PI);
translate(-915,0);
  text("Cirrus Street",450,320);
image(gmi,a,b=b-5);
image(xim,600,600);

 

      }
    }
  }
  if(keyPressed){
    if(key == CODED){
      if(keyCode == DOWN){
        //println("inDown"+a);
        if(a>370&&a<431){

        }else{
          if(b>280){
          b=280;
          
          
        }
      }

          
        

image(img,0,0);
fill(255,199,13);
  rect(300,50,100,100);
  fill(255,3,24);
  triangle(290,50,350,10,410,50);
  fill(203,243,255);
  rect(310,60,30,30);
  rect(360,60,30,30);
  fill(255,3,24);
  rect(330,100,40,53);
  

  
  
fill(20,244,250);
  rect(500,50,100,100);
  fill(255,3,24);
  triangle(490,50,550,10,610,50);
  fill(203,243,255);
  rect(510,60,30,30);
  rect(560,60,30,30);
  fill(255,3,24);
  rect(530,100,40,53);
  
  fill(10,247,75);
  rect(700,50,100,100);
  fill(255,3,24);
  triangle(690,50,750,10,810,50);
  fill(203,243,255);
  rect(710,60,30,30);
  rect(760,60,30,30);
  fill(255,3,24);
  rect(730,100,40,53);
  
  fill(105,59,216);
  rect(100,50,100,100);
  fill(255,3,24);
  triangle(90,50,150,10,210,50);
  fill(203,243,255);
  rect(110,60,30,30);
  rect(160,60,30,30);
  fill(255,3,24);
  rect(130,100,40,53);
  
  fill(196,190,190);
  rect(130,130,40,200);
  rect(330,130,40,200);
  rect(530,130,40,200);
  rect(730,130,40,200);
  rect(100,300,800,40);
  rect(400,300,40,700);
  image(xim,600,600);
   fill(28,7,72);
   rotate(HALF_PI);
   translate(0,-915);
text("Cumulus Street",400,500);
rotate(PI+HALF_PI);
translate(-915,0);
  text("Cirrus Street",450,320);
  
  image(gmi,a,b=b+5);
  


      }  
 }
    }}}
    
}}}



