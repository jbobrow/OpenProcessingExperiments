
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
  if((mouseX > 200+width/2) && (mouseY >200+height/2)){
  textSize(12);
  text("butthole",mouseX,mouseY);
  fill(89,68,216);

  //pink with blue
  }else if((mouseX > 100+width/2) && (mouseY > 100+height/2)){
  textSize(12);
  text("dick",mouseX,mouseY);
  fill(68,200,216);

  //mint with red
  }else if((mouseX > width/2) && (mouseY > height/2)){
  textSize(12);
  text("titties",mouseX,mouseY);
  fill(227,16,16);
  
  //purple with mint
  }else if((mouseX > width/3) && (mouseY > width/3)){
  textSize(12);
  text("shitdick",mouseX,mouseY);
  fill(42,232,129);
  
  //blue with pink
  }else if((mouseX > width/6) && (mouseY > height/6)){
  textSize(12);
  text("cooch",mouseX,mouseY);
  fill(219,42,232);
  
  //red with purple
  }else{
  textSize(12);
  text("bubblefarts",mouseX,mouseY);
  fill(234,210,24);
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


