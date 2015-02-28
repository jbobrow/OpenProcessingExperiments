
/*@pjs preload="apple3.gif";*/
PImage img;
int speed = 4;
int x = 0;
int y = 0;
int k = 0;
int n = 0;
int r;
int o;

void setup(){
     noStroke();  
     frameRate(60);
     smooth();      
     size(450, 450);
     textFont(createFont("AgencyFB-Reg-40", 40));
      r=0;  
      o=0;    
   }
   
   void draw(){
      background(255);  //siro
  for(int a=0; a<100; a+=5){
 tint(random(100), random(100), random(100));  //rogo kirei
  } 
   img = loadImage("apple3.gif"); //rogo
    image(img, -230+x, 60);
    fill(n,0,0);  
       text("Apple", 170+k,   -1600+y);   //seikaino apple

       fill(0);
       //y=1800 mozi
         text("Effect", 20+k , -1360+y);
         text("Spioe",   130+k, -1400+y);
         text("Perfume", 300+k, -1420+y);
         text("Single", 80+k, -1450+y);
         text("Serious", 300+k, -1500+y);
         text("Signal", 30+k, -1600+y);
         text("Progress", 200+k, -1550+y);
         text("Believe", 150+k, -1650+y);
         text("Sleep", 320+k, -1730+y);
         text("Bathroom", 20+k, -1730+y);
         text("Glad",  40+k,  -1520+y);
         text("Please", 310+k, -1650+y);
         
       //y=1350 
         text("Control", 110+k, -930+y);
         text("Profile", 270+k, -1000+y);
         text("Rival", 190+k, -1090+y);
         text("Mind", 10+k, -1300+y);
         text("Courage", 40+k, -1200+y);
         text("Fusion",20+k,  -1070+y);
         text("Victory", 280+k, -1140+y);
         text("Dinner",320+k, -1320+y);
         text("Letter", 20+k, -1000+y);
         text("Famous", 200+k, -1450+y);
         text("Leaf", 150+k, -980+y);
         text("Harp", 300+k, -1250+y);
         text("Swan", 100+k, -1270+y);
         text("Wing", 20+k, -1120+y);
         text("Sun", 300+k, -940+y);
         text("Piano",240+k, -1200+y);
       
       //y=900
         text("Couple", 300+k,-530+y);
         text("Cycle", 180+k, -530+y);
         text("Johnny", 50+k, -510+y);
         text("Egg", 30+k, -560+y);
         text("Mac", 320+k, -590+y);
         text("pineapple", 140+k, -600+y); 
         text("Michelle", 230+k , -645+y);
         text("Waffle", 60+k, -650+y);
         text("Tackle", 280+k ,-720+y);
         text("Shuffle", 80+k , -720+y);
         text("Michael", 230+k, -800+y);
         text("Koala", 30+k, -820+y);
      
      //y=450
         text("Adela", 20+k , -30+y);
         text("Agatha",40+k, -400+y);
         text("Betty", 340+k, -110+y);
         text("Britney",  300+k, -470+y);
         text("Casey", 120+k, -90+y);
         text("Angelica", 275+k, -200+y);
         text("Anna",   70+k, -440+y);
         text("Annie", 90+k, -140+y);
         text("Connie",50+k, -180+y);
         text("Pretty",280+k, -390+y);
         text("Cute",  300+k, -250+y);
         text("baby",  120+k, -290+y);
         text("morning", 170+k, -330+y);
         text("light", 20+k, -300+y);
         
         //y=0
         text("Adolph", 200+k, 200+y);
         text("Ben", 300+k, 320+y);
         text("Aaron", 100+k, 50+y);
         text("vivid",  250+k, 60+y);
         text("tomorrow", 50+k, 100+y);
         text("Play", 270+k, 145+y);
         text("Hot",  100+k, 155+y);
         text("Candy", 330+k, 100+y);
         text("Suppet", 250+k, 240+y);
         text("Dog", 50+k, 200+y);
         text("Color", 120+k, 280+y);
         text("Sea", 140+k, 330+y);
         text("Life", 10+k, 340+y);
         text("Friend", 320+k, 430+y);
         text("Sweet", 140+k, 410+y);
         text("Chris", 20+k, 400+y);
         
   
       text("Apple", -200+x, 310); //saigono mozi
      
  
      if(o>=1){
      }else{
             y = y + speed;   //zuttougoku
      }
      
      if(y>1800 || y<0){      //ittarikitari
        speed = -speed;
      }
   
        if(r>=255){               
          x+=5;    //yokokara rogo+apple  
          k+=10;   //hokano mozi wo nakusu
       }
   
          if(x>=370){ 
             r=244;     //rogo no ugokiwo tomeru    
     }  
}
          
     void mouseClicked(){
        if(mouseX>=170 && mouseX<=280 && mouseY>= -1650+y && mouseY<= -1600+y){ //seikai click
      r=255;
     }}
      
      void keyPressed(){
        switch(key){
          case's': //stop
          o=1;
          break;
        
          case'd': //ugoku
          o=0;
          break;
            
          case'f':   //hinto
         n+=300;
        
        }}
       
   



