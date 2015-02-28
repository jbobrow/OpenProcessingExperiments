
void setup(){
  
  size(450, 450);
  frameRate(50);
  smooth();
  background(0);
}

void draw(){
  
  //keyboard controlls
  switch(key){
    case 'r':  
    fill(random(250),0,0, 50);
    break;
    
    case 'g':
    fill(0,random(250),0, 50);
     break;
     
    case 'b':
    fill(0,0,random(250), 50);
     break;
     
    case 'e':
    fill(0,0,0,50);
    break;
    
    case 'x':
    fill(255,255,255,50);
    break;
    
    case 'k':
    fill(0,0,0,50);
    break;
    
    case 's':
    save("drawing.png");
    break;
    
    default:
    fill(255,255,255,50); 
}

  noStroke();

  if(mousePressed){
    float ellipseRadius = dist(mouseX, mouseY, pmouseX, pmouseY);
      if(key=='e'){
        ellipse(mouseX,mouseY,ellipseRadius,ellipseRadius);
      }else{  
        ellipse(mouseX-random(ellipseRadius/2), mouseY-random(ellipseRadius/2),ellipseRadius, ellipseRadius);
      }
  }

}

