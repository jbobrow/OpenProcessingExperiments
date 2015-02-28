
PFont font;

void setup(){
 size(600,600);
 background(0);
 textFont(createFont("CenturyGothic",12));
 
 //red
 fill(227,16,16);
 rect(0,0,width/6,height/6);
 
 //blue
 fill(68,200,216);
 rect(width/6,height/6,width/6,height/6);
 
 //purple
 fill(89,68,216);
 rect(width/3,height/3,width/6,height/6);
 
 //mint
 fill(42,232,129);
 rect(width/2,height/2,width/6,height/6);
 
 //pink
 fill(219,42,232);
 rect(100+width/2,100+height/2,width/6,height/6);
 
 //yellow
 fill(234,210,24);
 rect(200+width/2,200+height/2,width/6,height/6);
}

void draw(){
  
  //yellow with purple
  if((mouseX > 220+width/2) && (mouseY >210+height/2) && (mouseX < 290+width/2) && (mouseY < 299+height/2)){
  textAlign(CENTER);
  textSize(12);
  text("butthole",mouseX,mouseY);
  fill(89,68,216);

  //pink with blue
  }else if((mouseX > 110+width/2) && (mouseY > 110+height/2) && (mouseX < 190+width/2) && (mouseY < 199+height/2)){
  textAlign(CENTER);
  textSize(12);
  text("dick",mouseX,mouseY);
  fill(68,200,216);

  //mint with red
  }else if((mouseX > 10+width/2) && (mouseY > 10+height/2) && (mouseX < 90+width/2) && (mouseY < 99+height/2)){
  textAlign(CENTER);
  textSize(12);
  text("titties",mouseX,mouseY);
  fill(227,16,16);
  
  //purple with mint
  }else if((mouseX > 20+width/3) && (mouseY > 10+width/3) && (mouseX < 80+width/3) && (mouseY < 99+width/3)){
  textAlign(CENTER);
  textSize(12);
  text("shitdick",mouseX,mouseY);
  fill(42,232,129);
  
  //blue with pink
  }else if((mouseX > 20+width/6) && (mouseY > 10+height/6) && (mouseX < 80+width/6) && (mouseY < 99+height/6)){
  textAlign(CENTER);
  textSize(12);
  text("cooch",mouseX,mouseY);
  fill(219,42,232);
  
  //red with purple
  }else if((mouseX < 70) && (mouseY < 99)){
  textAlign(CENTER);
  textSize(12);
  text("bubblefarts",mouseX,mouseY);
  fill(234,210,24);
  
  }else{

}
}

void keyPressed(){
 if (keyCode==32){
 background(0);
 
 //red
 fill(227,16,16);
 rect(0,0,width/6,height/6);
 
 //blue
 fill(68,200,216);
 rect(width/6,height/6,width/6,height/6);
 
 //purple
 fill(89,68,216);
 rect(width/3,height/3,width/6,height/6);
 
 //mint
 fill(42,232,129);
 rect(width/2,height/2,width/6,height/6);
 
 //pink
 fill(219,42,232);
 rect(100+width/2,100+height/2,width/6,height/6);
 
 //yellow
 fill(234,210,24);
 rect(200+width/2,200+height/2,width/6,height/6);
}
}

void mousePressed(){
  background(0);
 
 //red
 fill(227,16,16);
 rect(0,0,width/6,height/6);
 
 //blue
 fill(68,200,216);
 rect(width/6,height/6,width/6,height/6);
 
 //purple
 fill(89,68,216);
 rect(width/3,height/3,width/6,height/6);
 
 //mint
 fill(42,232,129);
 rect(width/2,height/2,width/6,height/6);
 
 //pink
 fill(219,42,232);
 rect(100+width/2,100+height/2,width/6,height/6);
 
 //yellow
 fill(234,210,24);
 rect(200+width/2,200+height/2,width/6,height/6);
 
 //text
 textAlign(CENTER);
 textSize(72);
 text("INAPPROPRIATE",300,300);
 fill(255);
}

void mouseReleased(){
    background(0);
 
 //red
 fill(227,16,16);
 rect(0,0,width/6,height/6);
 
 //blue
 fill(68,200,216);
 rect(width/6,height/6,width/6,height/6);
 
 //purple
 fill(89,68,216);
 rect(width/3,height/3,width/6,height/6);
 
 //mint
 fill(42,232,129);
 rect(width/2,height/2,width/6,height/6);
 
 //pink
 fill(219,42,232);
 rect(100+width/2,100+height/2,width/6,height/6);
 
 //yellow
 fill(234,210,24);
 rect(200+width/2,200+height/2,width/6,height/6);
}



