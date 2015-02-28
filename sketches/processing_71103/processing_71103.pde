
//IMAGES
PImage[] images;
PImage bg; PImage btm_nul; 
PImage btm_1; PImage btm_2; PImage btm_3;
PImage icn_sis; PImage icn_rck; PImage icn_prp;

//VARIABLES
int radius = 35;
int r1; int r2; int r3; int hit = 0;
boolean sFlag = false; // Mouse Select Flag
boolean hFlag = true;  // Hit Flag
boolean hitCounter = true; // Hit Counter
boolean hitCounter2 = true; // Hit Counter
boolean random_switch = true; 
int index1 = 0; int index2 = 0;
PFont font;
int timer;
int temp;

void setup(){
            size(600, 600);
            int temp;
            smooth();
            stroke(50);
            boolean mFlag = false;
            random_switch = true;                  
            font = loadFont("Arvo-Bold-48.vlw");
            textFont(font);
            textSize(64);
            textAlign(CENTER);
            
            //LOAD IMAGES & IMAGES ARRAY
            bg =       loadImage("bg.jpg");
            btm_nul =  loadImage("btm_nul.jpg");
            btm_1 =    loadImage("btm_1.gif"); 
            btm_2 =    loadImage("btm_2.gif");
            btm_3 =    loadImage("btm_3.gif");            
            images =   new PImage[4];
            images[0]= loadImage("icn_nul.gif");
            images[1]= loadImage("icn_rck.gif");
            images[2]= loadImage("icn_prp.gif");
            images[3]= loadImage("icn_sis.gif");  }
            
              

void draw(){
            smooth();
            noStroke();
            imageMode(CORNER);
            image(bg,0,0);
            imageMode(CENTER);
            hFlag=true;                 
                              
            //DRAWS BUTTONS SELECTED
            if (keyPressed){
            imageMode(CENTER);
            if (key == '1') {  image(btm_1,200,510); image(images[1], 300, 310); }
            if (key == '2') {  image(btm_2,300,510); image(images[2], 300, 310); }
            if (key == '3') {  image(btm_3,400,510); image(images[3], 300, 310); }  }
                                  
            // CALCULATES IF MOUSE IS ON THE THREE SPOTS OF CIRCLES 
            float dLeft  =   dist(mouseX, mouseY, 100, 170);  
            float dRight =   dist(mouseX, mouseY, 500, 170);
            float dBtm   =   dist(mouseX, mouseY, 300, 310);
                  
            //CONSTANTLY GENERATES RANDOM NUMBERS FOR IMAGE ARRAY
            if (random_switch && mousePressed ==false){
            index1 = (int)random(1,4); 
            index2 = (int)random(1,4);}
            //print ("index1="+index1);
             //println("index2="+index2);
            
            //TEXT HITS            
            
            fill(160, 180, 200);
            text(hit, 490, 556);
            fill(0,100);
            text(timer/1000, 550, 556);
            
            
                    
            //MOUSE DRAG CHECKER
            if (mousePressed == true && keyPressed == true && (key == '1' || key == '2'  || key == '3') && (dBtm < radius)){  sFlag = true; }
                  
            //CHECKS IF USER IS MOUSE DRAGING WHILE PRESSING KEYS 1 , 2 OR 3
            if (sFlag && hFlag && (key=='1' || key=='2' || key=='3')) {
               //HITTING-OPPONENT CHECKER 
               if  (dRight<radius  ||  dLeft<radius  &&  mousePressed == true){
                      fill(0, 0);
                      hFlag=false; 
                      if(hitCounter && dRight<radius ) {
                      if ((key=='1' && index1==3) || (key=='2' && index1==1) || (key=='3' && index1==2) ){hit++; hitCounter = false;}
                      else {
                            hit--; hitCounter = false;                  
                            }
                           } 
                      
                      if(hitCounter && dLeft<radius ) {
                      if ((key=='1' && index2==3) || (key=='2' && index1==1) || (key=='3' && index1==2) ){hit++; hitCounter = false;} else {hit--; hitCounter = false;}  }


                      } 
               else {
                      if (dBtm < radius) {  sFlag = true;  }
                      fill (20, 200, 200, 50); 
                      ellipse(mouseX, mouseY, radius, radius); 
                      if (key=='1'){temp=1;}; if (key=='2'){temp=2;}; if (key=='3'){temp=3;}; 
                      image(images[temp], mouseX, mouseY);
                      //println("random off");
                      fill(0, 0);   }
               // DRAWS OPPONENTS CHOICES
               ellipse(500, 170, radius, radius);  image(images[index1], 500, 170);  fill(0,0);                            
               ellipse(100, 170, radius, radius); image(images[index2], 100, 170);  }
               

            //TIMER
            timer = millis();
            if (timer>21000){
                            fill(100, 120);
                            timer = 0;
                            rect(0, 0, 600, 600);
                            fill (255,255);
                            textSize(32);
                            
                            text("GAME OVER", 300, 270);
                            text("YOUR SCORE IS:", 300, 300);
                            text(hit, 300, 330); 
                            noLoop();         
            }

             
           }
//void draw



void mouseReleased()
                    {
                    if(sFlag = true) {sFlag = false;}
                    hitCounter = true;
                    hitCounter2 = true;
                    }

