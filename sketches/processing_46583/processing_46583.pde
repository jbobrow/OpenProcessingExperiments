
String[] name = {
"Loaded backed potato soup:",
"Garlic shrimp pasta:",
"Chicken enchiladas :",
"Mexican pitta pizza:",
"Apple cinnamon muffin:",
"Sausage, mushroom and broccoli quiche:",
"Crazy chocolate cake:",
"Crab cakes:",
"Oatmeal cookies:",
"veggie burger:",
};
  
float[] dollars = {
323 ,
288 ,
272 ,
230 ,
174 ,
142 ,
97 ,
96 ,  
46,
39,
};

boolean startScreen, page1, page2,page3,page4,page5,page6,page7,page8,page9,page10;



void setup(){
   
  startScreen = true;
page1 = false;
page2 = false;
page3 = false;
page4 = false;
page5 = false;
page6 = false;
page7 = false;
page8 = false;
page9 = false;
page10 = false;

    size(800,700);
  frameRate(8);


  
}
  
void draw(){
  if(startScreen){
    
    background(255 ,192, 203);
  PFont fontA;
  fontA = loadFont("AgencyFB-Reg-48.vlw");
  textFont(fontA, 30);
  fill(255,60,60);
  text("Yummy healthy recipies", 150, 30);
  
  int d;
  int x=0;
  int z = 30;
 boolean a = false;
   for(int i=0;i<10;i++){
     z += 35;
     if(mouseX>x && mouseX<=x+40){
       a= true;
       fill(255);
        text(name[i]+" " + dollars[i] + " Calories", 150, z );
       
   
       fill  (random(255),random(255),random(255));
     }else{
       a= false;
       fill(255);
     }
       
     
    float t = map(dollars[i], 10,500,0,600);
     rect(x,height-t,40,t);
      x+=60;
  }
  
  
  if((mouseX < 40) && (mouseY> 323) && (mousePressed)){
    startScreen = false;
    page1 = true;
  }
  
      if((mouseX < 100)&&(mouseX>60) && (mouseY> 288) && (mousePressed)){
    startScreen = false;
    page2 = true;
  }
        if((mouseX < 160)&&(mouseX>120) && (mouseY> 272) && (mousePressed)){
    startScreen = false;
    page3 = true;
  }
          if((mouseX < 220)&&(mouseX>180) && (mouseY> 272) && (mousePressed)){
    startScreen = false;
    page4 = true;
  }
           if((mouseX < 280)&&(mouseX>240) && (mouseY> 272) && (mousePressed)){
    startScreen = false;
    page5 = true;
  }
            if((mouseX < 340)&&(mouseX>300) && (mouseY> 272) && (mousePressed)){
    startScreen = false;
    page6 = true;
  }
             if((mouseX < 400)&&(mouseX>360) && (mouseY> 272) && (mousePressed)){
    startScreen = false;
    page7 = true;
  }
               if((mouseX < 460)&&(mouseX>420) && (mouseY> 272) && (mousePressed)){
    startScreen = false;
    page8 = true;
  }
               if((mouseX < 520)&&(mouseX>480) && (mouseY> 272) && (mousePressed)){
    startScreen = false;
    page9 = true;
  }
                 if((mouseX < 580)&&(mouseX>540) && (mouseY> 272) && (mousePressed)){
    startScreen = false;
    page10 = true;
  }
  }
  
  if(page1){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("323 Calories",40,90);
    text("18g fat",60,130);
    text("21g Carbs",80,170);
    text("10g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page1 = false;
      startScreen = true;
       
  }

  }
  
  if(page2){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("288 Calories",40,90);
    text("18g fat",60,130);
    text("20g Carbs",80,170);
    text("55g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page2 = false;
      startScreen = true;
    }     
  }
   if(page3){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("272 Calories",40,90);
    text("15g fat",60,130);
    text("18g Carbs",80,170);
    text("15g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page3 = false;
      startScreen = true;
       
  }

}
   if(page4){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("230 Calories",40,90);
    text("6g fat",60,130);
    text("32g Carbs",80,170);
    text("11g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page4 = false;
      startScreen = true;
       
  }

}
   if(page5){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("174 Calories",40,90);
    text("1g fat",60,130);
    text("38g Carbs",80,170);
    text("4g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page5 = false;
      startScreen = true;
       
  }

}
   if(page6){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("142 Calories",40,90);
    text("10g fat",60,130);
    text("45g Carbs",80,170);
    text("10g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page6 = false;
      startScreen = true;
       
  }

}
   if(page7){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("97 Calories",40,90);
    text("10g fat",60,130);
    text("12g Carbs",80,170);
    text("20g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page7 = false;
      startScreen = true;
       
  }

}
   if(page8){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("96 Calories",40,90);
    text("1g fat",60,130);
    text("22g Carbs",80,170);
    text("2g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page8 = false;
      startScreen = true;
       
  }

}
   if(page9){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("46 Calories",40,90);
    text("4g fat",60,130);
    text("10g Carbs",80,170);
    text("8g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page9 = false;
      startScreen = true;
       
  }

}
   if(page10){
    background(0);
    fill(255,255,64);
    text("back<<", 690, 30);
    text("Per Serving",20,40); 
    text("39 Calories",40,90);
    text("1g fat",60,130);
    text("25g Carbs",80,170);
    text("15g Protein",100,210);
    
    
    if((mousePressed) && (mouseX >690) && (mouseY < 50)){
      page10 = false;
      startScreen = true;
       
  }

}
}

