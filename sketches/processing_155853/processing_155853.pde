
void setup() {
  size(1000,800);
  smooth();
    background(255,235,0);
    

}

void draw() {
  //Horizontal Movement Limits
  int limx1=550;
  int limx2=640;
  int posx=mouseX;
  if(mouseX<limx1){
    posx=limx1;
  }
  if(mouseX>limx2){
    posx=limx2;
  }
  
  //Vertical Movement Limits
  int limy1=260;
  int limy2=350;
  int posy=mouseY;
  if(mouseY<limy1){
    posy=limy1;
  }
  if(mouseY>limy2){
    posy=limy2;
  }
  
  //Distance of Krabby Patty from nose
   float d = dist( mouseX,mouseY, 650,450);
   float maxDist = dist(0, 0,650,450);
  //shrink
    float shrink = map(d,0, maxDist, 0, 255);
 
  stroke(0);
  strokeWeight(8);
  background(255,235,0);
  
  fill(255);
  ellipse(600,300,200,200);  //Left Eye Static
  
  fill(113,189,239);         //Moving circles
  ellipse(posx,posy,100,100);
  fill(0);
  ellipse(posx,posy,50,50);
  
  float colour = 255;
  if(d<200){
    colour=random(200,255);
    shrink=random(100);
  }
  

  //Debug
  print("Shrink Factor = ");
  println(shrink);
  print("Distance = ");
  println(d);
  

  
  
  
  strokeWeight(8);
  fill(255);
  ellipse(790,360,200,200);  //Right Eye Static
  fill(113,189,239);
  ellipse(-posx+1390,posy+60,100,100);  //Moving circles
  fill(0);
  ellipse(-posx+1390,posy+60,50,50);
  
  noFill();
  curve(570,100, 530, 410, 730, 480, 620, 110); //upper Lip
  
  fill(255);
  quad(550,440,530,470,570,490,590,470);  //Tooth
  
  fill(255);
  quad(620,480,600,520,660,530,670,500);  //Tooth
 
  
  
  line(600,200,600,170); //Left Eyelashes
  line(640,210,650,180);
  line(680,230,700,200);
  
  line(790,250,790,200);  //Right Eyelashes
  line(830,260,840,220);
  line(870,280,890,240);
  
//  ellipse(500,400,80,50);
//  ellipse(750,500,80,50);
  noFill();
  curve(605, 326, 605, 430, 673, 424, 673, 461);  // Nose
  curve(605, 430, 673, 424, 673, 461, 615, 465); 
  curve(673, 424, 673, 461, 615, 465, 615, 465);
  
  fill(colour); // Left Eye Sparkle
  strokeWeight(0);
  stroke (0,0,0,0)
  ellipse(posx+10,posy-10,20-shrink*.10,25-shrink*.10);
  strokeWeight(0);
  ellipse(posx+10,posy+18,15-shrink*.10,15-shrink*.10);
  strokeWeight(0);
  ellipse(posx-10,posy+2,20-shrink*.10,25-shrink*.10);
  
  ellipse(-posx+1400,posy+45,20-shrink*.10,25-shrink*.10);
  ellipse(-posx+1400,posy+72,15-shrink*.10,15-shrink*.10);
  ellipse(-posx+1390,posy+57,20-shrink*.10,25-shrink*.10);
  
  
  //Krabby Patty
  strokeWeight (2);  // Top Bun
  stroke(151,77,28);
  fill(251,159,72);
  ellipse(mouseX,mouseY,100,60);
  
  strokeWeight (2);  // Bottom Bun
  stroke(151,77,28);
  fill(251,159,72);
  ellipse(mouseX,mouseY+60,100,60);
  
  
  
  rectMode(CENTER);
  stroke(75,23,10); //Patty 1
  fill(133,41,30);
  rect(mouseX,mouseY+20,100,20);
  
  rectMode(CENTER);
  stroke(22,129,0); //Veggies!
  fill(132,206,67);
  rect(mouseX,mouseY+35,110,20);
  
  rectMode(CENTER);
  stroke(75,23,10); //Patty 2
  fill(133,41,30);
  rect(mouseX,mouseY+50,100,20);
  
  strokeWeight (2);  // Cheese Bun
  stroke(253,57,7);
  fill(247,145,35);
  triangle(mouseX+3, mouseY+10, mouseX+ 40, mouseY+10,mouseX+20, mouseY+50);

  
 
  
    if (keyPressed) {
    if (key == 's') {
      saveFrame();
    }
  }
  
}
