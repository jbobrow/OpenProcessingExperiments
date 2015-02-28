
void setup(){
size (300, 300);
background(0);

}

boolean mouseclick = false;

boolean load = false;

void draw(){
  
  
int percentage =0;
    

background(0);
  noSmooth();
  textSize(14);
  
   if(round(frameCount%300) == 0){
load = false;}

  if (load == false){
  text("DONE! CLICK TO RESET", 80, 150);
  }
  

  if (mouseclick==true&&load==true)
  {
    percentage =round((frameCount%300)/3);
  text("LOADING " + percentage + " %", 50, 130); 
  strokeWeight(2);
  stroke(255);
  noFill();
  rect(50, 140, 200, 20);
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(50, 140, percentage*2, 20);
}
println (mouseclick);
}


 void mousePressed() {
mouseclick = true;
    load = true;
}

    
  

