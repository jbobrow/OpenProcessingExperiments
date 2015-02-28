

boolean brush1 = false;
boolean brush2 = false;
boolean brush3 = false;
boolean brush4 = false;
boolean brush5 = false;
boolean brush6 = false;


void setup() {
  size(800,600);
  background(255);
  smooth();

  
}


void draw() {
  
  if (mousePressed){

  
   if (brush1==true) {
    noStroke();
    fill(0);
    ellipse(mouseX,mouseY, 20, 20);
    }
  
   if (brush2==true) {
    noStroke();
    fill(0);
    ellipse(mouseX,mouseY, random(-40,40), random(-40,40));
    fill(255,0,0);
    ellipse(mouseX,mouseY, random(-40,40), random(-40,40));
    }
  
  
   if (brush3==true) {
    float dist5 = dist(pmouseX, pmouseY, mouseX, mouseY); 
    noStroke();
    //fill(0);
    //ellipse(mouseX,mouseY, random(-20,20), random(-20,20));
    fill(255,0,0);
    ellipse(mouseX+random(-10,10), mouseY+random(-10,10),dist5, dist5);
    fill(0);
    ellipse(mouseX+random(-10,10), mouseY+random(-10,10),dist5, dist5);
    }
    
    float dist5 = dist(pmouseX, pmouseY, mouseX, mouseY);
    float b5s = 60-dist5; //brush5size
    if (b5s <1) {b5s =1;}
    stroke(0);
    strokeWeight(b5s); 
    
    if (brush4==true)
    line(pmouseX, pmouseY, mouseX, mouseY);
    
  
  if (brush5==true) {
    float b4c = dist(pmouseX, pmouseY, mouseX, mouseY);
     stroke(b4c,b4c,b4c);
    strokeWeight(b4c);
    line(pmouseX, pmouseY, mouseX, mouseY);
    }
  

  if (brush6==true) {
     strokeWeight(random(5));
  
    stroke(random(255),random(255),random(255));
    line(pmouseX,pmouseY, mouseX+random(-20,20),mouseY+random(-20,20));
    stroke(0);
    line(pmouseX,pmouseY, mouseX+random(-20,20),mouseY+random(-20,20));
    ellipse(mouseX+random(-10,10),mouseY+random(-10,10),random(10), random(10) );
    }
  
  
  }    
}  
    
    void keyReleased(){
      if(key=='1') brush1 = !brush1;
      if(key=='2') brush2 = !brush2;
      if(key=='3') brush3 = !brush3;
      if(key=='4') brush4 = !brush4;
      if(key=='5') brush5 = !brush5;
      if(key=='6') brush6 = !brush6;
    
    }
    
   
    
    void keyPressed() {
  if (key == 's') { saveFrame("Screenshot-####.tif");}
    }


