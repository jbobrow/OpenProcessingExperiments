
//Jenny McCarthy (2-28-14) Hw: Racing animation using objects and classes 
//2008 Beijing Olmpics woman's single skull (rowing) final 

Boats myBoat1; 
Boats myBoat2;
Boats myBoat3;
Boats myBoat4;
Boats myBoat5;
Boats myBoat6;//declare

void setup(){
  size(1000,600);
  myBoat1 = new Boats(color(255,165,0),10,50,0.95); //Poland
  myBoat2 = new Boats(color(255),10,150,2); //Bulgaria
  myBoat3 = new Boats(color(34,139,34),10,250,1.15); //Czech Republic
  myBoat4 = new Boats(color(220,20,60),10,350,1.25); //China
  myBoat5 = new Boats(color(30,144,255),10,450,1.75); //USA
  myBoat6 = new Boats(color(186,85,211),10,550,1.5); //Belarus
} //initiatlize

void draw(){
  background(0);
  noStroke();
  fill(135,206,250,100); //light sky blue
  rect(0,0,1000,105);
  fill(0,255,255,70); //aqua - cyan
  rect(0,100,1000,105);
  fill(127,255,212,50); //aqua marine
  rect(0,200,1000,105);
  fill(70,130,180,90); //steel blue
  rect(0,300,1000,105);
  fill(0,191,255,50); //deep sky blue
  rect(0,400,1000,105);
  fill(0,0,139,80); //dark blue
  rect(0,500,1000,105);
  
  fill(255);
  rect(900,20,90,60);
  fill(255,0,0);
  rect(900,50,90,30); //Poland - flag
  
  fill(255);
  rect(900,120,90,60);
  fill(0,200,0);
  rect(900,140,90,20);
  fill(255,0,0);
  rect(900,160,90,20); //Bulgaria - flag
  
  fill(255);
  rect(900,220,90,60);
  fill(255,0,0);
  rect(900,250,90,30);
  fill(0,0,255);
  triangle(900,220,945,250,900,280); //Czech Repbulic - flag
  
  fill(255,0,0);
  rect(900,320,90,60);
  fill(255,255,0);
  ellipse(910,330,10,10);
  ellipse(917,324,3,3);
  ellipse(921,328,3,3);
  ellipse(921,334,3,3);
  ellipse(916,338,3,3); //China - flag
  
  fill(255,0,0);
  rect(900,420,90,60);
  fill(0,0,255);
  rect(900,420,40,33);
  stroke(255);
  strokeWeight(3);
  line(940,425,988,425);
  line(940,435,988,435);
  line(940,445,988,445);
  line(900,454,988,454);
  line(900,463,988,463);
  line(900,472,988,472); 
  for(int i=902;i<938;i=i+5){
    for(int j=423;j<452;j=j+5){
      stroke(255);
      strokeWeight(2);
      point(i,j); 
    }
  } // USA - flag
  
  noStroke();
  fill(255,0,0);
  rect(900,520,90,60);
  fill(0,200,0);
  rect(900,560,90,20);
  fill(255);
  rect(900,520,10,60);
  for(int i=901;i<909;i=i+5){
    for(int j=521;j<579;j=j+5){
      stroke(255,0,0);
      strokeWeight(3);
      point(i,j); 
    }
  } //Belarus - flag
  
  fill(255,0,0);
  ellipse(890,10,15,15);
  ellipse(890,590,15,15);
  stroke(255,50);
  line(890,15,890,585);
  
  myBoat1.display(); 
  myBoat1.row();
  myBoat2.display(); 
  myBoat2.row();
  myBoat3.display(); 
  myBoat3.row();
  myBoat4.display(); 
  myBoat4.row();
  myBoat5.display(); 
  myBoat5.row();
  myBoat6.display(); 
  myBoat6.row(); 
} //use   object.function
class Boats{
  //part 1: global variables
  
  float xpos;
  float ypos;
  float xspeed;
  color c;
  
  //part 2: constructor
  Boats(color boatC, float _x, float _y,float boatXspeed){
  xpos = _x;
  ypos = _y;
  xspeed = boatXspeed;
  c = boatC;
  }
  
  void drawBoat(float x, float y){
    stroke(255,200);
    strokeWeight(5);
    beginShape();
    line(x+20,y,x+30,y-10);
    line(x+30,y-10,x+40,y);
    line(x+40,y-22,x+45,y);
    line(x+25,y-18,x+40,y-22);
    strokeWeight(10);
    point(x+40,y-35);
    endShape();  //person
    
    fill(c);
    noStroke();
    beginShape();
    vertex(x,y);
    vertex(x+80,y);
    curveVertex(x+30,y+10);
    curveVertex(x+75,y+20);
    curveVertex(x+5,y+15);
    curveVertex(x,y+15);
    vertex(x,y);
    endShape(); //boat
  
    beginShape();
    strokeWeight(2);
    stroke(160,82,45);
    line(x+23,y-18,x+50,y+20);
    fill(160,82,45);
    vertex(x+50,y+20);
    vertex(x+55,y+20);
    vertex(x+65,y+35);
    vertex(x+58,y+40);
    vertex(x+47,y+25);
    vertex(x+50,y+20); 
    endShape(); //oar
  }
  
  //part 3: functions
  void display(){
    drawBoat(xpos,ypos);
  }
  
   void row(){
    xpos = xpos + xspeed;
      if (keyPressed){
        xpos = 0;
      } //to reset the animation
   }
}


