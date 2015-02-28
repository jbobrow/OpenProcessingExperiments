
//Press mouse to get your man ready to catch the football! GOOD LUCK!

void setup(){
  size(300,300);
  smooth();
  frameRate(35);
 // background(231,23,123);
 
}
 int x=1;

void draw(){
 
   //sky
   background(155,241,255);
   stroke(180+x,200+x,7);
    strokeWeight(2);
    line(30,30,110,0);
    line(30,30,110,40);
    line(30,30,110,90);
    line(30,30,80,90);
    line(30,30,40,90);
    line(30,30,20,90);
    line(30,30,0,90);
    line(30,30,0,0);
    line(30,30,0,25);
    


    noStroke();
    fill(242+x,231+x,7);
    ellipse(30,30,50,50);
    
    
   //clouds
    fill(255);
    noStroke();
    ellipse(-x+250,120,28,39);
    ellipse(-x+288,115,35,34);
    ellipse(-x+220,126,80,40);
    ellipse(-x+236,138,88,44);
    
    ellipse(-x+166,48,28,22);
    ellipse(-x+155,56,35,35);
    ellipse(-x+160,44,49,22);
    ellipse(-x+160,56,88,40);
    
    
    
    
    //ground
    fill(155,255,158);
    rect(0,270,width,30);
    
   

//throwing person
fill(245,205,126);
stroke(245,205,126);
strokeWeight(3);
ellipse(20,200,30,30);
line(20,215,20,275);
line(20,270,10,290);
line(20,270,30,290);
line(20,225,40,215);

//ball
fill(111,68,15);
noStroke();
ellipse(20+x, mouseY-20, 40,20);

x++;
}
   //running man
void mouseDragged(){
        fill(245,205,126);

   ellipse(mouseY,200, 30,30);
   stroke(245,205,126);
   strokeWeight(3);
   line(mouseY,215,mouseY,275);
   line(mouseY,270,mouseY-10,290);
   line(mouseY,270,mouseY+10,290);
   line(mouseY,225,mouseY-20,215);
   line(mouseY,225,mouseY+20,215);
}
   
    
  



