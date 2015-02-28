
void setup(){
  size(300,300);
}


float fillrate;
boolean fillcounter = false;
int howmuchlonger = 0;
void draw(){
 background(0);
  if (fillcounter == false){
    noFill();
    stroke(255);
    rect(50,140,200,20);
    fillrate=fillrate+0.6666;
    fill(255);
    rect(50,140,fillrate,20);
    howmuchlonger=round(fillrate/2);
    text("LOADING "+howmuchlonger+"%",width/4-25,height/2-15);
    if(fillrate>=200){
      fillcounter = true;
    }
  }
  
 else if(fillcounter == true){
   fill(255);
   text("DONE! CLICK TO RESET",width/4,height/2);
   onMouseClick();
 }
}

void onMouseClick(){
  
     if(mousePressed==true){
     fillcounter = false;
     fillrate=0;
   }
}
  


