
// button creation
float x = 0;
float y = 449;
float w = 124.7;
float h = 50;
float x2 = x+w;
float x3 = x2+w;
float x4 = x3+w;
int col1=255;
int col2=255;
int col3=255;

//Stats
int pHP = 100;
int eHP = 100;
int charge = 1;




boolean yourTurn = true;


    void setup(){
     int edge=1;
          for(int hp=pHP;hp>0;hp=hp-5){
              fill(150,0,0);
              rect(edge,1,10,10);
              edge=edge+10;
          }  
     size(500,500);
     background(255);
     stroke(0);
     noFill();
     if(random(2)<1){
         yourTurn=false;
         }
    }
    
    void replace(){
        background(255);
          
        }

    void draw(){
        
     checkWin();
      stroke(0);
      strokeWeight(1);  
     fill(col1,col2,col3);
     rect(x,y,w,h);
     rect(x2,y,w,h);
     rect(x3,y,w,h);
     rect(x4,y,w,h);
     
            int edge=1;
          for(int hp=pHP;hp>0;hp=hp-5){
              fill(150,0,0);
              rect(edge,1,10,10);
              edge=edge+10;
              }
              
                int edge=489;
          for(int hp=eHP;hp>0;hp=hp-5){
              fill(150,0,0);
              rect(edge,1,10,10);
              edge=edge-10;
              }
              
            fill(130);
            ellipse(250,40,70,70);
             fill(130,250,123);
        text("Turn Start",222.5,45);
        
        fill(isit());
        rect(1,12,30,30);

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
     } 
    }
    
    if(yourTurn==false){
        nowAttack();
        yourTurn=null;
    }
    
    
    if(yourTurn != true){
        if(mousePressed){
            if(mouseX>215 && mouseX<285 && mouseY>0 && mouseY<100){
               yourTurn=true;
           }
        }
    }
   }
   
   void shield() {
          
        
       stroke(0,255,0);
       line(100,300,100,100);
       line(105,300,105,100);
       line(95,300,95,100);
       line(110,300,110,100);
       line(90,300,90,100);
       line(85,300,85,100);
       line(80,300,80,100);
       line(115,300,115,100);
       line(120,300,120,100);
       line(125,300,125,100);
       col1=0;
       col2=130;
       col3=130;
       for(i=0;i<30;i++){
           if(pHP<100){
           pHP++;
           }
        }
      
   }
   
   void light(){
       strokeWeight(charge);
       line(120,250,450,250);
       eHP=eHP-charge*5;
       charge++;
       col1=120;
       col2=190;
       col3=0;
          
        
   }
   
   void pillar(){
       fill(0,200,19);
       triangle(400, 50, 375, 300, 425, 300);
       eHP=eHP-5;
       col1=0;
       col2=200;
       col3=19;
       if(random(4)<1){
           eHP= eHP-40;
        }
        eHP=eHP-10;
       }
 
     void lance(){
         fill(0,0,137);
         triangle(450, 250, 105, 225, 105, 275);
         col1=0;
         col2=0;
         col3=137;
         }
         
         
    int isit(){
        if(yourTurn){
            return 255;
        }
        else{
            return 0;
        }
    }
            
    
    void nowAttack(){
        float f=random(4);
        int number = int(f);
        if(number==0){
            attack1();
        }
        if(number==1){
            attack2();
        }
        if(number==2){
            attack3();
        }
        if(number==3){
            attack4();
        }
    }
    
    //attacks
    void attack1(){
        pHP=pHP-20;
        fill(130,70,198);
        strokeWeight(1);
        quad(40,250,100,310,160,250,100,190);
    }
    void attack2(){
        int rage = 100-eHP;
        pHP=pHP-(rage/2);
        strokeWeight(rage/5);
         stroke(200,0,0);
        line(100, 250, 100, 230);
        line(100, 230, 130, 230);
        line(130, 230, 130, 290);
        line(130, 290, 70, 290);
        line(70, 290, 70, 200);
        line(70, 200, 160, 200);
        line(160, 200, 160, 320);
        line(160, 320, 40, 320);
        line(40, 320, 40, 70);
        
    }
    void attack3(){
        int size = int(random(10));
        pHP=pHP-5*size;
        fill(250,0,0);
        strokeWeight(1);
        ellipse(100,250,size*10,size*10);
    }
    void attack4(){
        for(int y=0;y<30;y++){
            if(eHP<100){
            eHP=eHP+1;
            }
            for(int i=0;i<30;i++){
                float xC = random(350,450);
                float yC = random(200,300);
                strokeWeight(1);
                point(xC,yC);
            }
        }
    }
    
    void checkWin(){
        if(eHP<=0 ||  pHP<=0 ){
            if(eHP<=0){
                winScreen();
            }
            else{
                loseScreen();
            }
        }
    }
    
    void winScreen(){
        background(0);
        textSize(25);
        text("YOU WIN",200,250);
        exit()
    }
    
    void loseScreen(){
        background(0);
        stroke(255);
        textSize(25);
        text("YOU LOSE NOOB!",200,250);
        exit()
    }
