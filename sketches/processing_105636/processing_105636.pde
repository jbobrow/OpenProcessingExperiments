
void setup(){
size(550,200);
background(255);
}
void draw(){

for (int i =0; i <500 ; i = i+50) {
  
  if(mouseX<=75+i && mouseX>=25+i && mouseY>=75 && mouseY<=125){fill(230,45,78);}else{fill(255);}
  ellipse(50+i,100, 50,50);
}

}
