
void setup() {
  size(1200,400);
  background(0);  
  smooth();
}



void draw() {
  //background(0);
  fill(0,0,0,75);
  rect(0,0,width,height);
  //fill(2,247,229,0);
  stroke(255);
  strokeWeight(2);
  ellipse(map(mouseX,0,1000,-20,1220),100,map(mouseX,0,1200,5,200), map(mouseX,0,1200,5,200));
  ellipse(map(mouseX,0,1000,-20,1220),300,map(mouseX,0,1200,5,200), map(mouseX,0,1200,5,200));
  //LEFT SIDE INNER CIRCLES
  ellipse(map(mouseX,0,1000,-20,1220),100,map(mouseX,0,1200,5,50), map(mouseX,0,1200,5,50));
  ellipse(map(mouseX,0,1000,-20,1220),300,map(mouseX,0,1200,5,50), map(mouseX,0,1200,5,50));


  ellipse(map(mouseX,0,1000,1220,-20),100,map(mouseX,0,1200,5,200), map(mouseX,0,1200,5,200));
  ellipse(map(mouseX,0,1000,1220,-20),300,map(mouseX,0,1200,5,200), map(mouseX,0,1200,5,200));
  //RIGHT SIDE INNER CIRCLES
  ellipse(map(mouseX,0,1000,1220,-20),100,map(mouseX,0,1200,5,50), map(mouseX,0,1200,5,50));
  ellipse(map(mouseX,0,1000,1220,-20),300,map(mouseX,0,1200,5,50), map(mouseX,0,1200,5,50));


      strokeWeight(2);
      rect(10,20,80,80);
      fill(255);
      rect(10,20,40,80);
      fill(255);
      rect(1150,20,40,80);
      noFill();
      rect(1110,20,80,80);
  
  
  if (mouseButton == LEFT){
    background(random(0,255),13,13);
    fill(random(180,255));
    noStroke();
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    ellipse(random(0,1200),random(0,1200),random(0,100),random(0,100));
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    rect(random(0,1200),random(0,1200),20,20);
    //noStroke();
    //ellipse(pmouseX,pmouseY,random(0,200),random(0,200));
    strokeWeight(4);
    ellipse(map(mouseX,0,1000,-20,1220),100, random(map(mouseX,0,1200,0,350)), random(map(mouseX,0,1200,0,350)));
    ellipse(map(mouseX,0,1000,-20,1220),300,random(map(mouseX,0,1200,0,350)), random(map(mouseX,0,1200,0,350)));
    
    ellipse(map(mouseX,0,1000,1220,-20),100,random(map(mouseX,0,1200,0,350)), random(map(mouseX,0,1200,0,350)));
    ellipse(map(mouseX,0,1000,1220,-20),300,random(map(mouseX,0,1200,0,350)), random(map(mouseX,0,1200,0,350)));
    
    stroke(0);
    strokeWeight(3);
    fill(0);
    ellipse(map(mouseX,0,1000,-20,1220),100,random(map(mouseX,0,1200,0,100)), random(map(mouseX,0,1200,0,100)));
    ellipse(map(mouseX,0,1000,-20,1220),300,random(map(mouseX,0,1200,0,100)), random(map(mouseX,0,1200,0,100)));
    
    ellipse(map(mouseX,0,1000,1220,-20),100,random(map(mouseX,0,1200,0,100)), random(map(mouseX,0,1200,0,100)));
    ellipse(map(mouseX,0,1000,1220,-20),300,random(map(mouseX,0,1200,0,100)), random(map(mouseX,0,1200,0,100))); 
    
    if (key == 'b') {
      fill(0,0,0,75);
      //background(0);
      rect(0,0,width,height);
      stroke(255);
      strokeWeight(2);
      ellipse(map(mouseX,0,1000,-20,1220),100,map(mouseX,0,1200,5,200), map(mouseX,0,1200,5,200));
      ellipse(map(mouseX,0,1000,-20,1220),300,map(mouseX,0,1200,5,200), map(mouseX,0,1200,5,200));
      //LEFT SIDE INNER CIRCLES
      ellipse(map(mouseX,0,1000,-20,1220),100,map(mouseX,0,1200,5,50), map(mouseX,0,1200,5,50));
      ellipse(map(mouseX,0,1000,-20,1220),300,map(mouseX,0,1200,5,50), map(mouseX,0,1200,5,50));


      ellipse(map(mouseX,0,1000,1220,-20),100,map(mouseX,0,1200,5,200), map(mouseX,0,1200,5,200));
      ellipse(map(mouseX,0,1000,1220,-20),300,map(mouseX,0,1200,5,200), map(mouseX,0,1200,5,200));
      //RIGHT SIDE INNER CIRCLES
      ellipse(map(mouseX,0,1000,1220,-20),100,map(mouseX,0,1200,5,50), map(mouseX,0,1200,5,50));
      ellipse(map(mouseX,0,1000,1220,-20),300,map(mouseX,0,1200,5,50), map(mouseX,0,1200,5,50));      
      
      strokeWeight(2);
      rect(10,20,80,80);
      fill(255);
      rect(10,20,40,80);
      fill(255);
      rect(1150,20,40,80);
      noFill();
      rect(1110,20,80,80);
     
    }


}
  

  
  for (int x=60; x<width; x+=60) {
    noStroke();
    fill(random(255));
    ellipse(x,200,10,10);
    
  }
  
  
  
}

