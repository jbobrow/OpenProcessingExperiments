
float n=0;
int m=0;
PShape bot;

void setup(){
  size(600,600);
  smooth();
  bot = loadShape("star.svg");
}

void draw(){
  
  background(0,60,105);
  
  //star and zoom
  float zoom = map(mouseX, 0, width, 0.1, 2.4);
  float pppp2=random(0,1.5);
  shape(bot, pppp2, 10,2,2);
  shape(bot,25,65,0.6,0.6);
  shape(bot,65+3*pppp2,5,0.2*pppp2+0.1,0.2*pppp2+0.1);
  shape(bot, 200,24,1.4,1.4);
  shape(bot, 100,55,1.1,1.1);
  shape(bot,170, 5);
  shape(bot,270,19,1.8,1.8);
  shape(bot, 330,60);
  shape(bot, 400,5,2.5-0.01*pppp2,2.5+0.07*pppp2);
  shape(bot,498,33);
  shape(bot,530,65,0.6,0.6);
  shape(bot, 550-3*pppp2,10);
  
  shape(bot, 80,100-3*pppp2,1.2,1.2);
  shape(bot,65,155,0.9,0.9);
  shape(bot,165,85,0.9,0.9);
  shape(bot, 250+pppp2,114+pppp2,0.6,0.6);
  shape(bot, 150,145,1.5+0.1*pppp2,1.5);
  shape(bot,0, 95,1.1,1.1);
  shape(bot,330,109,0.8,0.8);
  shape(bot, 310,150,pppp2-0.1,pppp2-0.1);
  shape(bot, 390,95-2*pppp2,1.5,1.5);
  shape(bot,558+2*pppp2,123-pppp2);
  shape(bot,510,155,0.9,0.9);
  shape(bot, 520,90);
  
  scale(zoom);
  
  //sun
  rectMode(CORNER);
  
  if (keyPressed){
    background(245,239,215);
    ellipse(n,120,100,100);
    
    fill(236,184,74);
    rect(n+60,120,50,10);
    rect(n-110,120,50,10);
    rect(n,10,10,50);
    rect(n,180,10,50);

    pushMatrix();
    translate(n,120);
    rotate(QUARTER_PI);
    rect(60,0,50,10);
    rect(0,-110,10,50);
    rect(0,60,10,50);
    rect(-110,0,50,10);
    popMatrix();
    n=n+20; 
     if( n>2.5*width){
       n=0;
     }
  }
  
  //owl
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  
 //wing
   fill(77,46,41);
  triangle(mouseX-130,mouseY-140, mouseX-160, mouseY-40,mouseX-140, mouseY-50);
   fill(77,46,41);
  triangle(mouseX+130,mouseY-140, mouseX+160, mouseY-40,mouseX+140, mouseY-50);
  
  //ear
  fill(77,46,41);
  triangle(mouseX-130,mouseY-150,mouseX-50,mouseY-160,mouseX-130,mouseY-210);
  triangle(mouseX+130,mouseY-150,mouseX+50,mouseY-160,mouseX+130,mouseY-210);
  
  //body
  fill(236,184,74);
  rect(mouseX, mouseY-50, 290,260,500);
  
  //pattern
  fill(132,98,61);
  for(int b=mouseX-90; b<mouseX+100; b+=10){
    for(int c=mouseY-20; c< mouseY+50; c+=10){
  ellipse(b,c,5,10);
    }
  }
  arc(mouseX-115, mouseY+10, 20,30,0,PI);
  arc(mouseX+115, mouseY+10, 20,30,0,PI);
  
  //head
  fill(77,46,41);
  ellipse(mouseX, mouseY-155, 250,100);
  
  fill(77,46,41);
  rect(mouseX,mouseY-100,280,200,600);
  fill(255);
  
  //eye
  noStroke();
  fill(132,98,61);
  ellipse(mouseX-65,mouseY-130,130,110);
  ellipse(mouseX+65,mouseY-130,130,110);
  
  //mouth
  fill(197,92,70);
  triangle(mouseX,mouseY-100,mouseX-10,mouseY-90,mouseX+10,mouseY-90);
 
  //eye2
  noStroke();
  fill(255);
  ellipse(mouseX-60,mouseY-130,115,95);
  ellipse(mouseX+60,mouseY-130,115,95);
  
  //eyeball
  fill(77,46,41);
  frameRate(8);
  float x=random(mouseX-80,mouseX-28);
  float y=random(mouseY-160,mouseY-90);
  float w=random(mouseX+40,mouseX+87);
  float h=random(mouseY-160,mouseY-90);
  ellipse(x,y,10,10);
  ellipse(w,h,10,10);
  
  //feet
  fill(197,92,70);
  arc(mouseX-70, mouseY+80, 50,20,PI,TWO_PI);
  arc(mouseX+70, mouseY+80, 50,20,PI,TWO_PI);
  
  
  
  //line
  scale(1/zoom);
  for(int i=0;i<width;i+=10){
    // if(m>height){
    //      m=0;
    //    }
    if(mousePressed){
       stroke(0);
       strokeWeight(10);
       line(i,0,i,m);
       m++;
       //word
       if(m>height){
         textSize(180);
         fill(255);
         text("CRAZY",10,250);
         text(" OWL",40,500);
       }
     }
       
     
  
}

}


