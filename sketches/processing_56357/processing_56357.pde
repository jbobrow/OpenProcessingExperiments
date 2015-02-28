

PFont font1;
color wt;
color blu;


color fade = 5;
color fade2 = 5;
color fade3 = 5;
color fade4 = 5;
color fade5 = 5; 
color fade6 = 5; 
color fade7 = 5;
color fade8 = 5;
color fade9 = 5;
color fade10 = 5; 
color fade11 = 5;

color fade1200 = 5;



int buttonWidth = 100;
int buttonHeight = 50;
int x = 350;//corner of button



void setup (){

  size(800,500);
  blu = color (0,0,255);
  wt = color (255);
  frameRate(30);
  noStroke();
  smooth();
  font1= loadFont ("Serif-80.vlw");
}

void draw (){
  display();
  titlePage();
  index();
  
  //YOU
  if (mouseX>x && mouseX<x+buttonWidth && mouseY>150 && mouseY< 150 + buttonHeight && frameCount> 150 && frameCount<500){
    you1();//functions you
  }
  if (mouseX>x && mouseX<x+buttonWidth && mouseY>150 && mouseY< 150 + buttonHeight && frameCount> 150 && frameCount>500 && frameCount<1000){
    you2();//functions you
  }
  if (mouseX>x && mouseX<x+buttonWidth && mouseY>150 && mouseY< 150 + buttonHeight && frameCount> 150 && frameCount>1000 && frameCount<1200){
    you3();//functions you
  }
   if (mouseX>x && mouseX<x+buttonWidth && mouseY>150 && mouseY< 150 + buttonHeight && frameCount> 150 && frameCount>1200){
    you4();// functions you
  }
  
  //I
  if  (mouseX>x && mouseX<x+buttonWidth && mouseY>225 && mouseY< 225 + buttonHeight && frameCount> 150 && frameCount<500){
    I1();  //functions I
  }
   if  (mouseX>x && mouseX<x+buttonWidth && mouseY>225 && mouseY< 225 + buttonHeight && frameCount> 150 && frameCount> 500 && frameCount<700){
    I2();  //functions I
   }
   if  (mouseX>x && mouseX<x+buttonWidth && mouseY>225 && mouseY< 225 + buttonHeight && frameCount> 150 && frameCount> 700 && frameCount<1200){
    I3();  //functions I
   }
   
   //WE 
   if  (mouseX>x && mouseX<x+buttonWidth && mouseY>300 && mouseY< 300 + buttonHeight && frameCount> 150 && frameCount< 400){
    we1();  //functions we
   }
    if  (mouseX>x && mouseX<x+buttonWidth && mouseY>300 && mouseY< 300 + buttonHeight && frameCount>400 && frameCount<800){
    we2();  //functions we
   }
    if  (mouseX>x && mouseX<x+buttonWidth && mouseY>300 && mouseY< 300 + buttonHeight && frameCount>800){
    we3();  //functions we
   }
   
   //**EXTRA 
    if  (mouseX>x && mouseX<x+buttonWidth && mouseY>225 && mouseY< 225 + buttonHeight && frameCount> 150 && frameCount> 1200){
      textFont (font1,76);
      textAlign (LEFT); 
      fill (fade1200);
      fade1200= fade1200 + 2;
      text ("I would love to service you", width, height/2);
    }
    if (mousePressed){
      background (0);
      textFont (font1,76);
      textAlign (CENTER); 
      fill (255);
      text ("email me", width/2, height/2);
}

}
  
   void display (){
  background (255);
  println("frameCount: " + frameCount);
  }
  
    void titlePage (){
//fading
fill (fade);
fade = fade + 2;
//title page: font, size 
textFont (font1,76);
textAlign (LEFT); 
text ("LISTINGS..",10,100);
// blinking blu dot  
  if (frameCount %35 <= 20) { 
    fill (blu);
    ellipse (width/2,96.5,8.5,8.5);
 }
  }
  
   void index(){
//after 150 frames show index "i" "you" "we" with buttons
if (frameCount> 150){
  fill (0);
    ellipse (width/2,96.5,8.5,8.5);
    textFont (font1, 50);
    textAlign (CENTER);
    text ("YOU", width/2 , 200);
    text ("I",width/2 , 275);
    text ("WE", width/2 , 350);   
}
}
  
  
  ///YOU   
 void you1 (){
    smooth();
    textFont (font1,15);
    fill(fade2);
    fade2 = fade2 + 2; 
    textAlign (RIGHT);
   
    text ("You know who you are…", width - 20, 250);
    text ("You are so smoking hot", width -20, 100);
    text ("You are an amazing looking woman", width - 20, 400);
 }
 
 void you2(){
      smooth();
      textFont (font1,15);
      textAlign (RIGHT);
      fill (fade3);
      fade3 = fade3 + 2;
      
      text ("You were eyeing us...", width - 20, 20);
      text ("You were one of the most stunning women there", width - 20, 120);
      text ("You were so sexy and that skirt looked amazing on you.", width - 20, 220);
      text ("You wore no rings. Are you single?", width - 20, 320);
      text ("Contact me if you're single", width - 20, 420);
}

  void you3(){
      smooth();
      textFont (font1,15);
      textAlign (RIGHT);
      fill (fade4);
      fade4 = fade4 + 2;
      
      text ("You had the most amazing little smile. Send me a note if you read this.", width - 20, 20);
      text (" I know you smiled at me.", width - 20, 40);
  }  
  
  void you4(){
     smooth();
      textFont (font1,15);
      textAlign (RIGHT);
      fill (fade7);
      fade7 = fade7 + 2;
      
      text ("What makes you think we want the same things?", width - 20, 20);
      text ("What have I said or done that turns you on?", width- 20, 40);
      text ("You had your headphones on. Were you interested?" , width- 20, 60);
      text ("What do you want? ", width - 10, 80);
  }
  
///I (button2)

  void I1(){
    smooth();
    textFont (font1,15);
    textAlign(LEFT);
    fill(fade5);
    fade5 = fade5 + 2;
    
    text ("I can't tell you to your face, but I would give anything to ravage you.", 5, 20);
    text ("I would have asked you out, but you were working.", 5, 40);
    text ("I would have sucked your dick while you made my sandwich.", 5, 60);
    text ("What's the proper etiquette for that sort of thing?", 5, 150);
  }
  void I2(){
    smooth();
    textFont (font1,15);
    textAlign(LEFT);
    fill(fade6);
    fade6 = fade6 + 2;
    
    text ("You must know who I am.", 5, 20);
    text ("You showed me your tattoos", 5, 100);
    text ("You called me Papi", 5, 120);
  } 
  void I3(){
    smooth();
    textFont (font1,15);
    textAlign(LEFT);
    fill(fade8);
    fade8 = fade8 + 2;
    
    text ("I loved what I saw. ", 5, 50);
    text ("You were much too elegant for the establishment, and if you would care to meet sometime I would consider putting on a tie.", 5, 300);
    text ("I was the only one who noticed...... ", 5, 200);
  } 


///WE (button3)

  void we1(){
    smooth();
    textFont (font1,15);
    textAlign(CENTER);
    fill(fade9);
    fade9 = fade9 + 2;
    
    text ("We just about collided rounding a corner near the produce.", width/2, 400);
    text ("Then again on the way back. We have similar beards.", width/2, 420);
    text ("If you ran into me again I'd be obliged to blow you.", width/2, 450);
  }   
  
  void we2(){
    smooth();
    textFont (font1,15);
    textAlign(CENTER);
    fill(fade10);
    fade10 = fade10 + 2;
    
    text ("We were there for fish and chips. I thought you were amazing.", width/2, 400);
    text ("You got my coffee this morning and I couldn't take my eyes off of you.", width/2, 430);
  }  
    void we3(){
    smooth();
    textFont (font1,15);
    textAlign(CENTER);
    fill(fade11);
    fade11 = fade11 + 2;
    
    text ("We had a fun conversation about the Muppets and the Beatles.", width/2, 400);
    text ("We need to talk more, do you agree?", width/2, 430);
    text ("Are you interested in meeting again?", width/2, 460);
    text ("Why'd you leave?", width/2, 490);
  }  


   

 ///////////////////////////



