
// button creation
float x = 0;
float y = 449;
float w = 124.7;
float h = 50;
float x2 = x+w;
float x3 = x2+w;
float x4 = x3+w;

//Stats
int pHP = 100;
int eHP = 100;




boolean yourTurn = true;


    void setup(){
    size(500,500);
    background(255);
    stroke(0);
    noFill();
   // noLoop();
     
    
    }
    
    void replace(){
        background(255);
        }

    void draw(){

     
     rect(x,y,w,h);
    rect(x2,y,w,h);
    rect(x3,y,w,h);
    rect(x4,y,w,h);
     
    


    if(yourTurn){
    if(mousePressed){
    if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
        replace();
    shield();
    yourTurn=false;
    }
    if(mouseX>x2 && mouseX <x2+w && mouseY>y && mouseY <y+h){
    replace();
    light();
    yourTurn=false;
    }
    if(mouseX>x3 && mouseX <x3+w && mouseY>y && mouseY <y+h){
        replace();
        pillar();
    yourTurn=false;
    }
    if(mouseX>x4 && mouseX <x4+w && mouseY>y && mouseY <y+h){
        replace();
        lance();
    yourTurn=false;
    }

    if(!yourTurn){
    yourTurn=true;
    }

    } 
    }
   }
   
   void shield() {
    fill(100);
    ellipse(150,150,50,50);
    ellipse(250,150,50,50);
    ellipse(350,150,50,50);
      
   }
   
   void light(){
    fill(120,20,19);
    stroke(0);
    line(300,50,400,300);
    line(400,50,300,300);

   }
   
   void pillar(){
    fill(0,200,19);
    triangle(400, 300, 300, 300, 350, 50);
    }
 
    void lance(){
        fill(0,0,137);
        triangle(425, 250, 75, 200, 75, 300);
        }
