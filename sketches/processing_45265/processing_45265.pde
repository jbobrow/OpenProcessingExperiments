
String[] name = {
"Avatar:",
"Titanic:",
"Harry Potter - deathly hallows II :",
"Transformers Dark Of The Moon:",
"The Lord Of The Rings - ROTK:",
"Toy Story 3:",
"Pirates Of the Caribbean - Dead Mans Chest:",
"Pirates Of the Caribbean - On Stranger Times:",
"Alice In Wonderland:",
"The Dark Knight:",
};
 
float[] dollars = {
2.88 ,
1.84 ,
1.33 ,
1.12 ,
1.12 ,
1.07 ,
1.06 ,
1.04 ,
1.02 ,
1.00 ,
};
 
 
void setup(){
  
  frameRate(8);
  background(255 ,192, 203);
  size(750,600);
  PFont fontA;
  fontA = loadFont("AgencyFB-Reg-48.vlw");
  textFont(fontA, 30);
  text("Box Office Sales", 150, 30);

}
 
void draw(){
  int d;
  int x=0;
  int z = 30;
 boolean a = false;
   for(int i=0;i<10;i++){
     z += 35;
     if(mouseX>x && mouseX<=x+40){
       a= true;
       fill(255);
        text(name[i]+" " + dollars[i] + " Billion Dollars", 150, z );
      
  
       fill  (random(255),random(255),random(255));
     }else{
       a= false;
       fill(255);
     }
      
    
    float t = map(dollars[i], 0.5,3.0,0,600);
     rect(x,height-t,60,t);
      x+=60;
  }
 
}

