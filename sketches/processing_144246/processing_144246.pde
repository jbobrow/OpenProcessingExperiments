
var body = document.getElementsByTagName("body")[0];
body.style.background = "none";
  
  
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");



//Global Variables
PImage foto;
PImage osmar;
PImage ruca;
PImage adriano;

//Setup
void setup(){
 size(1082,400);
 background(255);
foto = loadImage("tudo.png");
osmar = loadImage("od_bw.png");
ruca = loadImage("rs_bw.png");
adriano = loadImage("am_bw.png");
}

//Draw
void draw(){
  image(foto,0,0);
  //animaÃ�Â§Ã�Â£o osmar
  if(mouseX>0){
   if(mouseX<370){
    if(mouseY>0){
     if(mouseY<400){
      image(osmar,0,0);
     } 
    }
   } 
  }
  //animaÃ�Â§Ã�Â£o ruca
   if(mouseX>370){
   if(mouseX<729){
    if(mouseY>0){
     if(mouseY<400){
      image(ruca,370,0);
     } 
    }
   } 
  }
  //animaÃ�Â§Ã�Â£o adriano
   if(mouseX>729){
   if(mouseX<1082){
    if(mouseY>0){
     if(mouseY<400){
      image(adriano,729,0);
     } 
    }
   } 
  }
}




