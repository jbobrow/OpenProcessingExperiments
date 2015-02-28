
//Drawing program improved, Maria Nunez, Assigment 4
float x;
float exis;
float uxus;
boolean mambo;
boolean anda;
boolean tri;
//boolean colora;

void setup(){
  size (800,1000);
  smooth();
  background(0);
   //first button
  fill(255,4,2);
  rect(325,450,400,100);
  fill(255);
  textSize(20);
  text("Click here for instructions",width/2,height/2);
  
  x=0;
  exis=-x;
  uxus=x;
  mambo=true;
  anda=false;
  tri=false;
 // colora=false;
 
}

void draw(){
  noStroke();
  
 //start 
 
 if(mambo){
  if (((mouseX>450) && (mouseY>450) && (mouseX<550) && (mouseY<550))&& mousePressed){
   background(0);
    textSize(16);
    fill(255);
    text("Choose the item of your preference", 350,450);
    text("Click and keep pressed to draw", 350,470);
     fill(100,140,23);
    rect(350,500,200,50);
    rectMode(CORNER);
    fill(255);
    text("Click here to start", 350,525);
  }
 }
 //instructions   
  if (anda){
   if(((mouseX>350) && (mouseY>500) && (mouseX<550) && (mouseY<550))&& mousePressed){ 
      background(0);
   }
  }
  if (tri){ 
  
  //draw triangles.expanding out
  
  if (mousePressed){
    
   exis++;
   uxus--;
 
  triangle(exis,height/2,x,0,x,height/2);
  triangle(exis,height/2,x,1000,x,height/2);
  triangle(uxus,height/2,x,0,x,height/2);
  triangle(uxus,height/2,x,1000,x,height/2);
  }
  
  // Change color, clear, restart
  
  else if (mouseX>50 && mouseY>925 && mouseX<75 && mouseY<950){
   // if (colora){
       fill(random(255),random(255),random(255),random(100));
       x+=1;
    exis=x;
    uxus=x; 
    }
  else if(mouseX>200 && mouseY>925 && mouseX<225 && mouseY<950){
      fill(random(255),random(10));
    x+=1;
    exis=x;
    uxus=x;
    }
   // clearbutton
   else if(mouseX>350 && mouseY>925 && mouseX<375 && mouseY<950){
     background(0);  
    fill(255);
       //white menu
    rect(0,900,width,75);
    fill(155,45,50);
    //colorbutton
    rect(50,925,25,25);  
    text("Color",80,940); 
   // b/w button
    rect(200,925,25,25);  
    text("B/W",230,940); 
   // clearbutton
    rect(350,925,25,25);  
    text("Clear",380,940); 
    }
  
   //Moving location x
  else if (x>width){
   x=0;
     } 
  else{ fill(random(255),random(10));
    x+=1;
    exis=x;
    uxus=x;
      }   
    }
  }
  
  void mouseReleased() {
     if((mouseX>450) && (mouseY>450) && (mouseX<550) && (mouseY<550)){
      anda=true;
      mambo=false;
    }
    if (!mambo){
     if((mouseX>350) && (mouseY>500) && (mouseX<550) && (mouseY<550)){
       tri=true;
       anda=false;
       fill(255);
       //white menu
    rect(0,900,width,75);
    fill(155,45,50);
    //colorbutton
    rect(50,925,25,25);  
    text("Color",80,940); 
   // b/w button
    rect(200,925,25,25);  
    text("B/W",230,940); 
   // clearbutton
    rect(350,925,25,25);  
    text("Clear",380,940); 
       }
       
       else{
         if(tri){
          fill(255);
       //white menu
    rect(0,900,width,75);
    fill(155,45,50);
    //colorbutton
    rect(50,925,25,25);  
    text("Color",80,940); 
   // b/w button
    rect(200,925,25,25);  
    text("B/W",230,940); 
   // clearbutton
    rect(350,925,25,25);  
    text("Clear",380,940); }
    
     }
    }
  }

 //    if (mouseX>50 && mouseY>625 && mouseX<75 && mouseY<650){
   // if(colora){ colora=false;
   // }
    //if(!colora){
    //  colora=true;
    //}
