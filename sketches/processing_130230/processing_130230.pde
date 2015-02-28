
int munition=10;
int damage=0;
int damage2=0;
int rectX=150;
int rectY=150;
int sizeW=100;
int sizeH=100;
int rect2X=400;
int rect2Y=350;
int size2W=300;
int size2H=200;
int verschossen=0;
int ungerade=0;
int ungerade2=0;
int cheated=0;
color normal=color(0,0,255,50);
void setup(){
size(800,600);
println("=== Bitte achten Sie auf Ihre CPU Auslastung! ===");
}
void draw(){
  background(255);
  fill(200);
  textSize(20);
  if(munition>0){
  fill(0);
  }
  else{
    fill(255,0,0);
  }
  text("Munition:",20,20);
  text(munition,20,50);
  rectMode(CORNER);
  fill(255,255,damage);
  rect(rectX,rectY,sizeW,sizeH,4);
  fill(255,255,damage2);
  rect(rect2X,rect2Y,size2W,size2H,2);
     
  fadenkreuz();
     
   if(verschossen>10){
     ungerade=3;
     ungerade2=3;
     if(damage>254){
       if(damage2>254){
         fill(0,0,255);
         textSize(30);
         text("Du hast gewonnen!",20,450);
         println("Du hast ",cheated," mal gecheated.");
       }
     }
     
   if(damage<255) {
     fill(255,0,0);
     textSize(30);
     text("Die Mun ist aus!",20,450);
     text("Du hast leider verloren!",20,500);
     }
   if(damage2<255) {
     fill(255,0,0);
     textSize(30);
     text("Die Mun ist aus!",20,450);
     text("Du hast leider verloren!",20,500);
     }
   }
   if(ungerade<1){
     if(rectX<650){
       rectX++;
     }
   if(rectX>649){
      ungerade=2;
        
   }
   }
  if(ungerade>1) {
  
    if(rectX<150){
     ungerade=0;
     }
     rectX--;
   }
    
  if(ungerade2<1){
      
    rect2Y--;
    if(rect2Y<100){
      ungerade2=2;
    }
      
  }
  if(ungerade2>1){
     
    rect2Y++;
    if(rect2Y>500){
    ungerade2=0;
      
    }
  }
     
  
}
   
void fadenkreuz(){
  rectMode(CENTER);
  fill(normal);
  rect(mouseX,mouseY,30,30,30);
  stroke(1.5);
  line(mouseX-20,mouseY,mouseX+20,mouseY);
  line(mouseX,mouseY-20,mouseX,mouseY+20);
}
   
void mouseClicked(){
  
if(mouseX<6&&mouseY<6){
verschossen=verschossen-6;
munition=munition+6;
println("Mun gecheatet!");
cheated++;
}
if(mouseX>794&&mouseY>594){
ungerade=0;
ungerade2=0;
verschossen=-1;
munition=11;
damage=0;
damage2=0;
rectX=-30;
rect2Y=-30;
println(" Neues Spiel gestartet! ");
}
    
  if(munition>0){
     munition--;
   }
    
  if (constrain(mouseY,rectY,rectY+sizeH)==mouseY&&constrain(mouseX,rectX,rectX+sizeW)==mouseX){
  if(verschossen<10){
    if(damage<255){
    damage=damage+51;
    }
  }
  }
      
   
if (constrain(mouseY,rect2Y,rect2Y+size2H)==mouseY&&constrain(mouseX,rect2X,rect2X+size2W)==mouseX){
  if(verschossen<10){
    if(damage2<255){
    damage2=damage2+51;
    }
  }
  }
    
   
  
   verschossen++;
}
