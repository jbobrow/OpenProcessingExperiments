
int centerX,centerY;
float radius, newradius;

void setup(){
 size(700,500); 
  centerX = 200;
  centerY =300;
  radius = 70;
  frameRate(30);
}

void draw(){
  background(255);
  newradius = random(20,360);
  if(sq(mouseX-centerX)+ sq(mouseY-centerY)< sq(radius)){
    fill(255,0,0);}
  else{
  fill(255);
  }
  ellipse(centerX,centerY, 2*radius,2*radius);
  
  if (mousePressed){
    
    ellipse(centerX,centerY,newradius,newradius);}
    fill(0);
    textSize(17);
    text("Mouse over circle to turn red.", 350,100);
    text("Click mouse for random size circle.",350,130); 
    
    saveFrame("images/export-"+"-#####.jpeg");
 if ( frameCount >= 6000 ) {
        exit();
    } 

    
}



  



