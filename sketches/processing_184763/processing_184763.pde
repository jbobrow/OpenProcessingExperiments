
void setup(){
  size(1000,1000);
  background(229,152,197);
  frameRate(40);
}

void draw(){
  noStroke();
  fill(255,115,165,30);
  rect(15,15,970,970);
  if(mousePressed == true){
    float r = random(235,255);
    float g = random(100,155);
    float b = random(180,220);
    float sz = random(120,220);
  noStroke();
  fill(r,g,b);
  for(int i=0; i<100; i=i+3){
  ellipse(mouseX,mouseY,sz,sz);}
  ellipse(mouseX+random(-115,115),mouseY+random(-115,115),65,65);
  ellipse(mouseX+random(-90,90),mouseY+random(-90,90),30,30);
  for(int i=0; i<20; i++){
    float starSW = random(3,20);
    float starX = random(20,980);
    float starY = random(20,980);
    strokeWeight(starSW);
    stroke(255,70);
    point(starX,starY);
    strokeWeight(starSW+3);
    stroke(255,20);
    point(starX,starY);
    noStroke();
    fill(255,115,165,15);
    rect(15,15,970,970);
    stroke(255/*,29,0*/,50);
    noFill();
    strokeWeight(random(0.1,20));
    triangle(700,50,550,300,850,300);
    triangle(700,385,550,135,850,135);
   }
   if(mouseY<=500){
    fill(255);
    textSize(95);
    text("Dear Miyu",65,395);
    text("Lots of love for your 20th birthday.",65,550,800,600);
    text("from Hikaru",430,960);
    }
   if(mouseY>500){
     stroke(255,100);
     strokeWeight(random(0.1,7));
     triangle(925,375,955,425,895,425);
     strokeWeight(random(0.1,10));
     triangle(865,475,895,425,835,425);
     strokeWeight(random(0.1,20));
     triangle(780,650,828,730,732,730);
     triangle(780,755,828,675,732,675);
     strokeWeight(random(2,8));
     triangle(500,720,596,880,404,880);
     strokeWeight(random(0.1,5));
     triangle(240,510,360,710,120,710);
     strokeWeight(random(0.1,5));
     ellipse(500,500,700,700);
     strokeWeight(random(0.8,8));
     ellipse(170,155,90,90);
     textSize(20);
     fill(255);
     text("I LOVE YOU.",450,500);
   }
  }
}

