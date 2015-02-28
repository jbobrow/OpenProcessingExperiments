
color b_c1 = color(  32,  12,  232 );
color b_c2 = color(  32,  132, 232,  90 );
color b_c3 = color(  32, 132,  232 );
color b_c4 = color( 232, 132,  32 );
color b_c5 = color( 115, 129,  86 );
color b_c6 = color( 184, 206, 137 );
color b_eh = color( 250, 250, 250 );

int localX=400;
int localY=400;

void setup() {

size(800,800);
}
void draw (){
  
background(255);

ellipseMode(CENTER);

rectMode(CENTER);

if(mousePressed &&(mouseButton==LEFT)){
  localX= mouseX;
  localY= mouseY;
}
  for(int i=-1;i<2;i++){

 draw_creature(localX+(i*400),localY);
}
}
//this function is for mouse press
void draw_creature(int x, int y) {

if(mousePressed) {
  fill(b_c3);
}else{
  fill(255);
}
  noStroke();
   //body
     ellipse(x,y+200,200,250);
      //head
  ellipse(x,y,220,220);
  //symbol
  if(mousePressed) {
  fill(b_c3);
}else{
  fill(255);
}
  noStroke();
  //left arm
  ellipse(x-100,y+145,100,80);
  //right arm
  ellipse(x+100,y+145,100,80);
  //left leg
  fill(b_c1);
  ellipse(x-100,y+300,100,100);
  //left footpad
  if(mousePressed){
  fill(b_c2);
  }else{
    fill(255);
  }
      ellipse(x-100,y+300,75,75);
  //right leg
  if(mousePressed){
  fill(b_c1);
  }else{
    fill(255);
  }
    ellipse(x+100,y+300,100,100);
  //right pad
  if(mousePressed){
  fill(b_c2);
  }else{
    fill(255);
  }
    ellipse(x+100,y+300,75,75) ;
    //left ear
    if(mousePressed){
      fill(b_c3);
    }else{
      fill(255);
    }
  ellipse(x-100,y-100,90,90);
  //right ear
        
  if(mousePressed) {
  fill(b_c3);
  }else{
    fill(255);
  }
  ellipse(x+100,y-100,90,90);

  //right eye
   
    fill(255);
    ellipse(x+47,y-40,25,50);
 
  //left eye
  ellipse(x-47,y-40,25,50);
  stroke(255);
 fill(255);
  strokeWeight(7.5);
    rect(x,y+195,60,100);
       //nose
       
   fill(255);
     stroke(255);
     strokeWeight(2);
  ellipse(x,y+25,50,29);
  
  
  //neg space left ear
  ellipse(x-110,y-130,35,35);
  //neg space left ear 2
    ellipse(x-100,y-100,25,25);
    //neg space right
    ellipse(X+100,Y-100,25,25);
    if(mousePressed) {
     fill(b_c4);
    }else{
      fill(255);
    }
      rect(x,y+195,30,80);
 line(x-200, y+200, mouseX-20, Y-200);


}


