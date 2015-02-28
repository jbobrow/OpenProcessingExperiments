
int h;
int m;
int s;

 
void setup () {
    size (600,600);
    smooth();
}
void bonobono1(){
    fill (130,207,254);
    strokeWeight(6);
    stroke(255);
    ellipse (width/2,height/2,450,450);
    fill (7);
    noStroke();
    ellipse(150, 230, 30, 30);
    ellipse(450, 230,30,30);
    fill(255);
    ellipse(250, 380, 130, 110);
    fill(255);
    ellipse(350, 380, 130, 110);
    fill(7);
    ellipse(300, 350, 45, 40);
    
    noFill();
    noStroke();
}

void bonobono2(){
   fill (255,148,196);
    strokeWeight(6);
    stroke(255);
    ellipse (width/2,height/2,450,450);
    fill (7);
    noStroke();
    ellipse(150, 230, 30, 30);
    ellipse(450, 230,30,30);
    fill(255);
    ellipse(250, 380, 130, 110);
    fill(255);
    ellipse(350, 380, 130, 110);
    fill(7);
    ellipse(300, 350, 45, 40);
    
    noFill();
    noStroke();
}

void draw() {
    s = second ();
    m = minute ();
    h = hour ();

 
  if(!mousePressed){
    // hour
    background (222,240,254);
  bonobono1();
   translate(300,350);
  //hours
    strokeWeight(7);
    stroke(0);
    pushMatrix();
    rotate(radians (30*h));
    line(0,0,0,-95);
    popMatrix();
 
    //minute
    strokeWeight(5);
    stroke (0);
    pushMatrix();
    rotate(radians (6*m));
    line(0,0,0,-135);
    popMatrix(); 
    
    //seconds
     strokeWeight(2);
    stroke (0);
    pushMatrix();
    rotate(radians (6*s));
    line(0,0,0,-155);
    popMatrix(); 
  }
if (mousePressed){
   
    // hour
    background(254,231,246);
   bonobono2();
    translate(300,350);
    strokeWeight(7);
    stroke(0);
    pushMatrix();
    rotate(radians (mouseY));
    line(0,0,0,-95);
    popMatrix();
      //minute
    strokeWeight(5);
    stroke (0);
    pushMatrix();
    rotate(radians (mouseX));
    line(0,0,0,-135);
    popMatrix(); 
    
    //seconds
     strokeWeight(2);
    stroke (0);
    pushMatrix();
    rotate(radians (6*s));
    line(0,0,0,-155);
    popMatrix(); 
    
}
  
}
