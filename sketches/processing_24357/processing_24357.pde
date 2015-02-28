

int five = 50;
int zero = 300;
int ran1 = 100;
int ran2 = 200;
int ran11 = 100;
int ran22 = 200;
void setup () {
  size(300,600);
  smooth();
  noLoop();
  
}


void draw(){
  background(91,250,246);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  //top
  quad(width/2,height/3,width/2,height/3,0,0,50,0);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,50,0,70,0);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,70,0,120,0);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,120,0,140,0);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,140,0,190,0);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,190,0,210,0);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,210,0,260,0);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,260,0,280,0);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,280,0,330,0);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  
 
  //sideA
  quad(width/2,height/3,width/2,height/3,0,0,0,20);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,20,0,70);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,70,0,90);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,90,0,140);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,140,0,160);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,160,0,210);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,210,0,230);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,230,0,280);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,280,0,300);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,300,0,350);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,350,0,370);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,370,0,420);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,420,0,440);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,440,0,490);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,490,0,510);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,560,0,580);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,580,0,630);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  
  //sideB
  quad(width/2,height/3,width/2,height/3,zero,0,zero,20);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,20,zero,70);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,70,zero,90);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,90,zero,140);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,160,zero,210);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,210,zero,230);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,230,zero,280);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,280,zero,300);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,300,zero,350);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,350,zero,370);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,370,zero,420);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,420,zero,440);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,580,zero,630);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  
  //bottum
  quad(width/2,height/3,width/2,height/3,0,height,50,height);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,50,height,70,height);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,70,height,120,height);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,120,height,140,height);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,140,height,190,height);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,190,height,210,height);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,210,height,260,height);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,260,height,280,height);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,280,height,330,height);
  stroke(5,29,234,random(ran11,ran22));
  fill(5,29,234,random(ran1,ran2));
  
  stroke(193,14,29);
  fill(255,3,3);
  //star
 //first layer
  triangle(width/2,height/3, 150, 175, 125, 200);
  triangle(width/2,height/3, 150, 175, 175, 200);
  triangle(width/2,height/3, 150, 225, 125, 200);
  triangle(width/2,height/3, 150, 225, 175, 200);
  //2nd layer
  
  stroke(193,14,29);
  fill(160,5,5);
  triangle(125,175, 150, 175, 125, 200);
  triangle(175,175, 150, 175, 175, 200);
  triangle(125,225, 150, 225, 125, 200);
  triangle(175,225, 150, 225, 175, 200);
  //3rd layer
  stroke(193,14,29);
  fill(80,2,2);
  triangle(125,175, 150, 175, 150, 140);
  triangle(175,175, 150, 175, 150, 140);
  triangle(125,225, 150, 225, 150, 260);
  triangle(175,225, 150, 225, 150, 260);
  //4th layer
  stroke(193,14,29);
  fill(80,2,2);
  triangle(125,175, 90, 200, 125, 200);
  triangle(175,175, 210, 200, 175, 200);
  triangle(125,225, 90, 200, 125, 200);
  triangle(175,225, 210, 200, 175, 200);
   
 }


