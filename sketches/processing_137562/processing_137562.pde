
void setup(){
  size(400,400);
  noStroke();
  smooth();
  background(193,205,193);
  
    fill(255);
  rect(130,200,160,30);
  fill(244,164,96);
  rect(290,200,60,30);
  //cigarette stand alone 
}

void draw(){
  

  if (mousePressed==true){
    
    noStroke();
fill(255,236,139,180);
ellipse(140,240,40,100);
fill(238,44,44,160);
ellipse(140,250,30,90);
fill(255,97,3);
ellipse(140,260,20,80);
    
    stroke(1);
    fill(205,0,0);
    rect(60,290,30,10,20);

    fill(139,137,137);
    ellipse(100,285,30,30);

    fill(139,137,137);
    rect(90,280,70,130,10);

    noStroke();
    fill(25,25,112);
    rect(60,300,100,140,10);
    fill(0,10);
     rect(130,200,40,30);
  }
}
