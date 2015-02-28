

//Dorahan Arapgirlioglu
//MIDTERM
//Drawing program

CircleClick[] circles;
drawinginterface buttons;
float[] brushcolor;
boolean brushshape=true;
float r = 5;
int erraine = 1;
float radius = 20;
float angle = 0;
boolean trig=false;



void setup(){
  size(600,600);
  smooth();
  background(255);
  colorMode(HSB,360,100,100,100);
  circles = new CircleClick[50];
  for (int i=0; i< circles.length; i++){
    circles[i] = new CircleClick(random(width),random(height), i);
  brushcolor= new float[4];
  
  }
}

void draw(){
  
  buttons();
  brushShape();
  drawingtool();
  splash();
  hugeassbubble();
  goldenRatio();
 // println(r);
}

class CircleClick{
  float x,y,speedx,speedy;
  float angle;
  int id;
  
  //constructor
  
  CircleClick(float _x, float _y, int _id){
    x = _x;
    y = _y;
    speedx = random(-5,5);
    speedy = random(-5,5);
  }
  
  //methods
  
  void moveC(){
    x+=speedx;
    y+=speedy;
    
    //bouncing!!!
    if (x>600){
      speedx+=-5;
    }
    
    if (x<0){
      speedx+=5;
    }  
   
    if (y>600){
      speedy+=-5;
    }
    
    if (y<0){
      speedy+=5;
    }
    
  }
  
  void display(){
    
    noStroke();
    fill(random(255),random(255),random(255),30);
    ellipse(x,y,random(10,15),random(10,15));
  }
}

class drawinginterface{
  
  void display(){
  

  }
}

  //color button
  
  void mousePressed(){
    
    if (mouseX > 30 && mouseX < 70 && mouseY > 525 && mouseY < 575){
      brushcolor[0] = random(255);
      brushcolor[1] = random(255);
      brushcolor[2] = random(255);
      fill(brushcolor[0],brushcolor[1],brushcolor[2]);
      rect(30,525,50,50);
    } 

    if (mouseX > 100 && mouseX < 150 && mouseY > 525 && mouseY < 575 && brushshape == true){
          brushshape = false;
        } else
        
        if(mouseX > 100 && mouseX < 150 && mouseY > 525 && mouseY < 575 && brushshape == false){
          brushshape = true;
        }
        
    if (mouseX > 310 && mouseX < 360 && mouseY > 525 && mouseY < 575 && trig == true){
          trig = false;
    } else 
    
        if (mouseX > 310 && mouseX < 360 && mouseY > 525 && mouseY < 575 && trig == false){
          trig = true;
    
        }


      
}

void buttons(){
  //interface
  fill(0);
  rect(0,500,600,100);
  //color buttons
  if(brushcolor[0]==0 && brushcolor[1]==0 && brushcolor[2]==0){
  fill(255);
  } else {
  fill(brushcolor[0],brushcolor[1],brushcolor[2]);
  }
  rect(30,525,50,50);
  //shape button
  fill(255);
  rect(100,525,50,50);
  //splash button
  fill(255);
  rect(170,525,50,50);
  //hugeassbubble
  fill(255);
  rect(240,525,50,50);
  //trig
  if(trig==true){
    fill(brushcolor[0],brushcolor[1],brushcolor[2]);
    rect(310,525,50,50);
  } else if (trig==false){
    fill(255);
    rect(310,525,50,50);
  }

}

void brushShape(){
     // color name
      fill(0);
      text("color",38,554);
      //splash text
      fill(0);
      text("splash",175,554);
      //bubble text
      fill(0);
      text("bubble",243.5,554);
      //golden text
      fill(0);
      text("golden",314,554);
     
     
      fill(255);
      rect(100,525,50,50);
      
    if(brushshape == true){
      stroke(1);
      ellipse(125,550,15,15);
    } else {
      if(brushshape == false){
        stroke(1);
        rect(117.5,542.5,15,15);
      }
         
    
    }
}

void drawingtool(){
  fill(brushcolor[0],brushcolor[1],brushcolor[2]);
   noStroke(); 
    
    if (mousePressed && brushshape == true){
    ellipse(mouseX,mouseY,15,15);
  } else {
    if (mousePressed && brushshape == false){
      rect(mouseX,mouseY,15,15);
    }
  }
}


void splash(){   
 
  if (mousePressed == true && mouseX > 170 && mouseX < 220 && mouseY > 525 && mouseY < 575){
 
  for (int i=0; i< circles.length; i++){
    
    circles[i].moveC();
    circles[i].display();
    }
  }
}

void hugeassbubble(){
  
  if (mousePressed == true && mouseX > 240 && mouseX < 290 && mouseY > 525 && mouseY < 575){
 
    noStroke();
    fill(brushcolor[0],brushcolor[1],brushcolor[2]);
    //rectMode(CENTER);
    if (mousePressed && brushshape == true){
    ellipse(width/2,height/2,r,r);
    } else {
      if (mousePressed && brushshape ==false){
        if(erraine==1){
          rect1();
        } else {
          if (erraine==0){
            rect2();
          }
        }
      

        
      }
    }
  // Increase the rectangle size
  
    r+=7;
    
    

    
  }
}

void rect1(){
      rect(width/2,height/2,r,r);
      rect(width/2,height/2,r*-1,r*-1);
}

void rect2(){
      rect(width/2,height/2,r*-1,r);
      rect(width/2,height/2,r,r*-1);
}

void mouseReleased(){
  if (mouseX > 240 && mouseX < 290 && mouseY > 525 && mouseY < 575){
    r = 5;
  }
  
  if (erraine == 1 && brushshape == false && mouseX > 240 && mouseX < 290 && mouseY > 525 && mouseY < 575){
    erraine = 0;
  } else
  
  if (erraine == 0 && brushshape == false && mouseX > 240 && mouseX < 290 && mouseY > 525 && mouseY < 575){
    erraine = 1;
  }
  
  if(trig==true){
    radius=20;
    angle=0;
  }  
    
}


void goldenRatio(){
  
  if(trig == true && mousePressed ==true){     
    fill(300*sin(radians(angle)),random(0,255),random(0,255), 50);
    noStroke();
    float x = radius*cos(radians(angle));
    float y = radius*sin(radians(angle));
   
    radius+=.3;
   
    ellipse(x+mouseX,y+mouseY,random(20),random(20));
    angle+=137.5;
  }
  
  
  
}
  


