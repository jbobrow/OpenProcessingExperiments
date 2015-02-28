
//Cats (Assignment 4)
//by Ellen Wang
//*note: kinda gave up with the flip code because I couldn't figure out how to use it without messing stuff up :(


PImage cat;
PImage catth;
PImage catthf;
PImage catlv;
PImage catm;

void setup(){
    size(815,650);
    cat = loadImage("cat.png");
    catth = loadImage("catth.png");
    catthf = loadImage("catthf.png");
    catlv = loadImage("catlv.png");
    catm = loadImage("catm.png");
}

void  draw (){
background(0);
 pushMatrix();
 translate(15,0);
 
   //P111
    image(cat,0,0);
    image(cat,100,0);
    image(cat,200,0);
    image(cat,300,0);
    image(cat,400,0);
    image(cat,500,0);
    image(cat,600,0);
    image(cat,700,0);
     
   //P1M1
    image(catth,0,100);
    image(catth,100,100);
    image(catth,200,100);
    image(catth,300,100);
    image(catth,400,100);
    image(catth,500,100);
    image(catth,600,100);
    image(catth,700,100);
    
    image(catthf,0,150);
    image(catthf,100,150);
    image(catthf,200,150);
    image(catthf,300,150);
    image(catthf,400,150);
    image(catthf,500,150);
    image(catthf,600,150);
    image(catthf,700,150);
  
    //P112
    image(catlv,0,200);
    image(catlv,100,200);
    image(catlv,200,200);
    image(catlv,300,200);
    image(catlv,400,200);
    image(catlv,500,200);
    image(catlv,600,200);
    image(catlv,700,200);
    
    pushMatrix();
    translate(100,300);
    rotate(radians(180));
    image(catlv,0,0);
    image(catlv,-100,0);
    image(catlv,-200,0);
    image(catlv,-300,0);
    image(catlv,-400,0);
    image(catlv,-500,0);
    image(catlv,-600,0);
    image(catlv,-700,0);
    popMatrix();
    
    //P1G1
    image(catth,0,300);
    image(catthf,100,300);
    image(catth,200,300);
    image(catthf,300,300);
    image(catth,400,300);
    image(catthf,500,300);
    image(catth,600,300);
    image(catthf,700,300);
    
    //PMM2
    image(catm,0,350);
    image(catm,200,350);
    image(catm,400,350);
    image(catm,600,350); 
    
    pushMatrix();
    translate(100,450);
    rotate(radians(180));
    image(catm,-100,0);
    image(catm,-300,0);
    image(catm,-500,0);
    image(catm,-700,0); 
    popMatrix();
    
    //PM11
    pushMatrix();
    translate(0,550);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(100,550);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(200,550);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(300,550);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(400,550);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(500,550);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(600,550);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(700,550);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    
    //PMG2
    pushMatrix();
    translate(0,650);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(200,550);
    rotate(radians(90));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(200,650);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(400,550);
    rotate(radians(90));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(400,650);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(600,550);
    rotate(radians(90));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(600,650);
    rotate(radians(270));
    image(catm,0,0); 
    popMatrix();
    pushMatrix();
    translate(800,550);
    rotate(radians(90));
    image(catm,0,0); 
    popMatrix();
    
    fill(255,0,0);
    pushMatrix();
    rotate(radians(270));
    translate(-100,-15);
    text("P111",0,0,100,100);
    popMatrix();  
    pushMatrix();
    rotate(radians(270));
    translate(-200,-15);
    text("P1M1",0,0,100,100);
    popMatrix();  
    pushMatrix();
    rotate(radians(270));
    translate(-300,-15);
    text("P112",0,0,100,100);
    popMatrix();  
    pushMatrix();
    rotate(radians(270));
    translate(-350,-15);
    text("P1G1",0,0,100,100);
    popMatrix();  
    pushMatrix();
    rotate(radians(270));
    translate(-450,-15);
    text("PMM2",0,0,100,100);
    popMatrix();  
    pushMatrix();
    rotate(radians(270));
    translate(-550,-15);
    text("PM11",0,0,100,100);
    popMatrix();  
    pushMatrix();
    rotate(radians(270));
    translate(-650,-15);
    text("PMG2",0,0,100,100);
    popMatrix();    
    
    popMatrix();
  
  }


















