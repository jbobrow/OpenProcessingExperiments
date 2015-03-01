

boolean rlight = true;
boolean ylight = false;
boolean glight = false;


void setup(){
size(400,400);
background(#59F0FC);
smooth();

}

void draw(){
  stroke(0);
  fill(#F7E21E);
  rectMode(CENTER);
  rect(width/2,height/2,width/2,height);

//Top Light
  fill(#AD4236);
  ellipseMode(CENTER);
  ellipse(width/2,height/3 - 50,width/4,height/4);

//Middle Light
  fill(#C9C004);
  ellipseMode(CENTER);
  ellipse(width/2,height/2,width/4,height/4);

//Bottom Light
  fill(#136F17);
  ellipseMode(CENTER);
  ellipse(width/2,height - 80,width/4,height/4);

 //END OF DEFAULT LIGHT SETTINGS
 
 
 
 
 //Red Light turn on
 if (rlight == true){
    fill(#FF1212);
    ellipseMode(CENTER);
    ellipse(width/2,height/3 - 50,width/4,height/4);
 } 


//Green light turn on
 if (glight == true){
  fill(#03FC0C);
  ellipseMode(CENTER);
  ellipse(width/2,height - 80,width/4,height/4);
 }


//Yellow Light Turn on 
    if (ylight == true){
 
  
      fill(#FAFF0D);
      ellipseMode(CENTER);
      ellipse(width/2,height/2,width/4,height/4);
  }
 

 }









//Mouse Click Function



void mousePressed(){
  
  if(rlight == false && ylight == false && glight == false){
    rlight = !rlight;
  
  }
 else if(rlight == true){
   rlight = !rlight;
   ylight = !ylight;

 }
 else if(ylight == true){
   ylight = !ylight;
   glight = !glight;
 
 } else if(glight == true){
   glight = !glight;
   rlight = !rlight;
 
 }
}

