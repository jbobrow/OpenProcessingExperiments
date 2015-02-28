
// Assignment # 2
// Gillian Diffenderfer
// gdiffender@brynmawr.edu
// 16 September 2010


 float r;
 float g;
 float b;
 float a;

 float x = 200;
 float y = 100;
 float diam = 200;

void setup () {
  size (700,500);
  background (65,47,90);
  smooth();
  
}

void draw () {

  // bottom star
  fill(254,255,203);
  noStroke();
  beginShape();
    vertex(200,50);  //1
    vertex(190,150); //2
    vertex(70,180);  //3
    vertex(180,185); //4
    vertex(120,270); //5
    vertex(210,210); //6
    vertex(250,300); //7
    vertex(255,205); //8
    vertex(355,255); //9
    vertex(270,175); //10
    vertex(370,110); //11
    vertex(245,145); //12
  endShape(CLOSE);
    
    // top star
  fill(255,243,10);
  beginShape();
    vertex(270,20);  //1
    vertex(200,135); //2
    vertex(100,90);  //3
    vertex(170,165); //4
    vertex(85,250);  //5
    vertex(190,195); //6
    vertex(200,290); //7
    vertex(235,210); //8
    vertex(300,285); //9
    vertex(270,195); //10
    vertex(370,160); //11
    vertex(255,145); //12
  endShape(CLOSE);
  
  // center star
  fill(254,255,203);
  ellipse(222,170,40,40);
  
  fill(255,243,10);
  ellipse(222,170,30,30);
      
  // moon    
  fill(200);
  ellipse(x+275,y+280,diam,diam);
  
  fill(65,47,90);
  ellipse(x+230,y+280,diam,diam);
  
  //stars
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(5);
  x = random(700);
  y = random(500);
  
  noStroke();
  fill(r,g,b,a);
   ellipse(x,y,diam,diam);
  

  

}



