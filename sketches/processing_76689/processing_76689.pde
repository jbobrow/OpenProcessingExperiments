
  
  PFont font;
   
  int s = second();
  int m = minute();
  int h = hour();
  
  int speed = 1;
  
void setup(){
  size(500,500);
  font = loadFont ("AlBayan-48.vlw");
  textFont(font);
  

}

void draw() {
  
  /////////
 background(0);
  
  textSize(60);
  fill(255,255,255);
  String t = nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2);
  text(t,119,255);
  
  //if((55<mouseX<85), (205<mouseY<265)){
 
  
  triangle(425,205,425,265,455,235);
  fill(255,255,255);
  triangle(395,205,395,265,425,235);
  fill(255,255,255);
  
  triangle(115,205,115,265,85,235);
  fill(255,255,255);
  triangle(85,205,85,265,55,235);
  fill(255,255,255);
  
  //////////
  
  
  
  if((mouseX>=395 && mouseX <= 455)&&( mouseY>=205 && mouseY<= 265)){    
    background(random(255), random(255), random(255));
     
      s = s + 3;
     m = m + 2;
     h = h + 1;
     
      if(s >= 60){
        s = 0;
      }
      
      if(m >= 59){
        m = 1;
      }
      
        if(h >= 12){
        h = 1;
      }
     
     
     
     
  
  textSize(60);
  fill(random(255), random(255), random(255));
  
  String d = nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2);
  text(t,135,255);
    
    textSize(60);
    fill(random(255), random(255), random(255));
    text("constraint",80,100);
  
    textSize(103);
    fill(random(255), random(255), random(255));
    text("nervousness",200,420);
  
    textSize(30);
    fill(random(255), random(255), random(255));
    text("concern",20,350);
  
    textSize(140);
    fill(random(255), random(255), random(255));
    text("unease",15,510);
  
    textSize(77);
    fill(random(255), random(255), random(255));
    text("fear",320,70);
    
    textSize(85);
    fill(random(255), random(255), random(255));
    text("stress",80,180);
    
     textSize(50);
    fill(random(255), random(255), random(255));
    text("tension",30,180);
    
    textSize(80);
    fill(random(255), random(255), random(255));
    text("anxiety",140,373);
    
    textSize(93);
    fill(random(255), random(255), random(255));
    text("agitation",360,187);
    
    textSize(80);
    fill(random(255), random(255), random(255));
    text("uncertainty",340,130);
    
      textSize(30);
    fill(random(255), random(255), random(255));
    text("worry",400,150);
    
    textSize(90);
    fill(random(255), random(255), random(255));
    text("restlessness",10,350);
    
    textSize(100);
    fill(random(255), random(255), random(255));
    text("apprehension",10,40);
        
    textSize(50);
    fill(random(255), random(255), random(255));
    text("strain",20,50);
    
    textSize(127);
    fill(random(255), random(255), random(255));
    text("trouble",380,350);
    
    textSize(50);
    fill(random(255), random(255), random(255));
    text("pressure",40,460);
    //pressure trouble tigh0t   
    
    
  } 
  
    else {
  s = second();
  m = minute();
  h = hour(); 
  }
  
   
 // if((mouseX>=395 && mouseX<=425)&&( mouseY>=205 && mouseY<= 265)){ 
   
   if((mouseX<=115 && mouseX>=55)&&(mouseY>=205 && mouseY<=265)){    
    background(255,255,255);
       s = 0;
      m = 0;
      h = 0;
      
  
  textSize(60);
  fill(245,245,245);
  String r = nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2);
  text(t,135,255);

 
     textSize(60);
    fill(245,245,245);
    text("constraint",80,100);
  
    textSize(103);
    fill(245,245,245);
    text("nervousness",200,420);
  
    textSize(30);
    fill(245,245,245);
    text("concern",20,350);
  
    textSize(140);
    fill(245,245,245);
    text("unease",15,510);
  
    textSize(77);
    fill(245,245,245);
    text("fear",320,70);
    
    textSize(85);
    fill(245,245,245);
    text("stress",80,180);
    
     textSize(50);
    fill(245,245,245);
    text("tension",30,180);
    
    textSize(80);
    fill(245,245,245);
    text("anxiety",140,373);
    
    textSize(93);
    fill(245,245,245);
    text("agitation",360,187);
    
    textSize(80);
    fill(245,245,245);
    text("uncertainty",340,130);
    
      textSize(30);
    fill(245,245,245);
    text("worry",400,150);
    
    textSize(90);
    fill(245,245,245);
    text("restless",10,350);
    
    textSize(100);
    fill(245,245,245);
    text("apprehension",10,40);
        
    textSize(50);
    fill(245,245,245);
    text("strain",20,50);
    
    textSize(127);
    fill(245,245,245);
    text("trouble",380,350);
    
    textSize(50);
    fill(245,245,245);
    text("pressure",40,460);
   
    
   
   
   
  }
  
  
  }


