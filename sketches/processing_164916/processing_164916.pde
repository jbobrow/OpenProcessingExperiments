
float xPosition;
float yPosition;
float counter = random(mouseX/9);
int insideWindow = 50;
float easing = 0.15;
int edge = 50;
int inner = edge+ 50;
float px, py, px2, py2;
float angle, angle2;
float radius = 30;
float frequency = 2;
float frequency2 = 2;
float s, s2;
void setup()
{
  size(500, 500);
  background(255);
  smooth();
  strokeWeight(3);
  stroke(0);
  rectMode(CENTER);
  fill(250);
  rect(250, 200, 350, 400);
  fill(#D4F3FA);
  rect(250, 200, 300, 350);
}

void draw()

{
  filter(BLUR);
  background(250, 241, 222);

  if (abs(mouseX - xPosition) > 0.1)
  {
    xPosition = xPosition + (mouseX - xPosition) * easing;
  }

  if (abs(mouseY - yPosition) > 0.1)
  {
    yPosition = yPosition + (mouseY - yPosition) * easing;
  }

  xPosition = constrain(xPosition, inner, width - inner);
  yPosition = constrain(yPosition, inner, height - inner);


  frameRate(9);
  stroke(0);
  rectMode(CENTER);

  noStroke();
  fill(180);
  beginShape();
  vertex(100, 375);
  vertex(100, 230);
  vertex(110, 230);
  vertex(110, 210);
  vertex(120, 210);
  vertex(120, 270);
  vertex(125, 270);
  vertex(125, 210);
  vertex(130, 210);
  vertex(130, 190);
  vertex(145, 190);
  vertex(145, 300);
  vertex(150, 300);
  vertex(155, 270);
  vertex(160, 270);
  vertex(160, 240);
  vertex(160, 270);
  vertex(165, 270);
  vertex(165, 270);
  vertex(170, 300);
  vertex(170, 150);
  vertex(180, 150);
  vertex(180, 100);
  vertex(182, 100);
  vertex(185, 90);
  vertex(187, 100);
  vertex(190, 100);
  vertex(190, 150);
  vertex(200, 150);
  vertex(200, 305);
  vertex(230, 305);
  vertex(250, 290);
  vertex(270, 305);
  vertex(270, 340);
  vertex(280, 340);
  vertex(280, 375);
  endShape();

  beginShape();
  vertex(300, 375);
  vertex(300, 300);//here
  vertex(305, 300);
  vertex(305, 235);
  vertex(315, 235);
  vertex(315, 300);
  vertex(320, 300);
  vertex(320, 360);
  vertex(322, 360);
  vertex(325, 355);
  vertex(327, 360);
  vertex(330, 360);
  vertex(330, 210);
  vertex(340, 210);
  vertex(340, 200);
  vertex(360, 200);
  vertex(370, 130);
  vertex(380, 200);
  vertex(390, 200);
  vertex(400, 200);
  vertex(400, 375);

  endShape();
  fill(250);
  rect(250, 200, 350, 400);
  fill(#D4F3FA);
  rect(250, 200, 300, 350);
  fill(242, 234, 215);
  fill(255, 255, 255, 100);
  rectMode(CORNER);
  fill(196, 181, 203);
  rect(100, 420, 80, 40);
  fill(160, 223, 229);
  rect(200, 420, 80, 40);

  fill(66, 89, 126);
  rect(300, 420, 80, 40);


  fill(255, 255, 255, yPosition*0.2);

  ellipse(constrain(xPosition, 125, 250), constrain(yPosition, -50, 350), yPosition*0.1, yPosition*0.1);
  ellipse(constrain(xPosition, 125, 250), constrain(yPosition, -50, 350), yPosition*0.2, yPosition*0.2);
  ellipse(constrain(xPosition, 125, 250), constrain(yPosition, -50, 350), yPosition*0.3, yPosition*0.3);
  ellipse(constrain(xPosition, 125, 250), constrain(yPosition, -50, 350), yPosition*0.4, yPosition*0.4);
  ellipse(constrain(xPosition, 125, 250), constrain(yPosition, -50, 350), yPosition*0.5, yPosition*0.5);

  fill(255, 255, 255, yPosition*0.3);

  ellipse(constrain(xPosition, 270, 400), constrain(300-yPosition, 50, 400), yPosition*0.1, yPosition*0.1);

  ellipse(constrain(xPosition, 270, 400), constrain(300-yPosition, 50, 400), yPosition*0.2, yPosition*0.2);

  ellipse(constrain(xPosition, 270, 400), constrain(300-yPosition, 50, 400), yPosition*0.4, yPosition*0.4);


  fill(#F0EFDF);
  rect(100, 400, 400, 60);


  if (mousePressed == true)
  {

    fill(constrain(yPosition*1.5, 0, 180));
    beginShape();
    vertex(100, 375);
    vertex(100, 230);
    vertex(110, 230);
    vertex(110, 210);
    vertex(120, 210);
    vertex(120, 270);
    vertex(125, 270);
    vertex(125, 210);
    vertex(130, 210);
    vertex(130, 190);
    vertex(145, 190);
    vertex(145, 300);
    vertex(150, 300);
    vertex(155, 270);
    vertex(160, 270);
    vertex(160, 240);
    vertex(160, 270);
    vertex(165, 270);
    vertex(165, 270);
    vertex(170, 300);
    vertex(170, 150);
    vertex(180, 150);
    vertex(180, 100);
    vertex(182, 100);
    vertex(185, 90);
    vertex(187, 100);
    vertex(190, 100);
    vertex(190, 150);
    vertex(200, 150);
    vertex(200, 305);
    vertex(230, 305);
    vertex(250, 290);
    vertex(270, 305);
    vertex(270, 340);
    vertex(280, 340);
    vertex(280, 375);
    endShape();

    beginShape();
    vertex(300, 375);
    vertex(300, 300);//here
    vertex(305, 300);
    vertex(305, 235);
    vertex(315, 235);
    vertex(315, 300);
    vertex(320, 300);
    vertex(320, 360);
    vertex(322, 360);
    vertex(325, 355);
    vertex(327, 360);
    vertex(330, 360);
    vertex(330, 210);
    vertex(340, 210);
    vertex(340, 200);
    vertex(360, 200);
    vertex(370, 130);
    vertex(380, 200);
    vertex(390, 200);
    vertex(400, 200);
    vertex(400, 375);

    endShape();
    // rotates rectangle around circle
    px = width/8 + cos(radians(angle))*(radius);
    py = 75 + sin(radians(angle))*(radius);
    rectMode(CENTER);
    fill(0);
    fill(255, 255, 255, 100);
    px = width/8 + cos(radians(angle))*(radius);
    py = 75 + sin(radians(angle))*(radius);

    // keep reinitializing to 0, to avoid
    // flashing during redrawing
    angle2 = 0;

    // draw static curve - y = sin(x)
    for (int i = 0; i< width; i++) {
      px2 = width/8 + cos(radians(angle2))*(radius);
      py2 = 75 + sin(radians(angle2))*(radius);
      point(width/8+radius+i, py2);
      angle2 -= frequency2;
    }

    // send small ellipse along sine curve
    // to illustrate relationship of circle +radius+s*2,py+10,72,20);
    ellipse(width/2+radius+(s), py+30, 70, 30);
    ellipse(width/2+radius+(s*3), py+30, 72, 20);
    ellipse(width/2+radius+(s*2.5), py+20, 72, 20);
    ellipse(width/6+radius+(s*1.5), py+30, 72, 20);
    ellipse(width/6+radius+(s*1.5), py+30, 32, 20);
    angle -= frequency;
    s+=1;

    // when little ellipse reaches end of window
    // reinitialize some variables
    if (s>= width-300) {
      s = 0;
      angle = 0;
    }
  }

  if (mouseY<200)
  {
    for (int x=0; x<=counter; x=x+9)
    {
      for (int y=0; y<=counter; y=y+9)
      {
        float xPos = random(constrain(mouseX, 100, 300)); 
        float yPos = random(constrain(mouseY, 50, 400)); 



        strokeWeight(5);
        stroke(#6CE3ED);

        line(xPos, yPos, xPos+4, yPos+5);
        stroke(#CEDADB);
        line(xPos+50, yPos+200, xPos+55, yPos+205);
        stroke(#77A9AD);
        line(xPos+20, yPos+10, xPos+15, yPos+15);

        noStroke();
        fill(240, 239, 223); 
        rectMode(CORNER); 
        rect(0, 0, 75, 500); 
        fill(255); 
        rect(50, 0, 50, 380); 
        rect(50, 0, 400, 20);
        fill(240, 239, 223); 
        rect(0, 0, 75, 500);
        rect(0, 400, 500, 75);
        fill(255);
      }
    }
  }


  if (mouseY >200 && mouseY<300) 

  {    
    //    rectMode(CENTER); 
    //    fill(400-(yPosition), 300-yPosition, 150+yPosition*0.7, 100); 
    //    rect(250, 200, 300, 350); 
    fill(250, 177, 18); 

    for (int x=0; x<=counter; x=x+9)
    {
      for (int y=0; y<=counter; y=y+9)
      {
        float xPos = random(constrain(mouseX, 100, 300)); 
        float yPos = random(constrain(mouseY, 50, 400)); 

        fill(0,random(200,250)); 
        triangle(xPos, yPos, xPos-20, yPos, xPos+5, yPos+10); 
        triangle(xPos+1, yPos, xPos+40, yPos, xPos+5, yPos+10); 
      rectMode(CORNER);
    fill(196, 181, 203);
    rect(100, 420, 80, 40);
    fill(160, 223, 229);
    rect(200, 420, 80, 40);

    fill(66, 89, 126);
    rect(300, 420, 80, 40);
    fill(#F0EFDF);
    rect(100, 400, 400, 60);
     noStroke();
        fill(240, 239, 223); 
        rectMode(CORNER); 
        rect(0, 0, 75, 500); 
        fill(255); 
        rect(50, 0, 50, 380); 
        rect(50, 0, 400, 20);
        fill(240, 239, 223); 
        rect(0, 0, 75, 500);
        rect(0, 400, 500, 75);
        fill(255);
      }
    }
          
  

  if (mouseY>200)
  {
    rectMode(CENTER); 
    fill(400-(yPosition), 300-yPosition, 150+yPosition*0.9, 100); 
    rect(250, 200, 300, 350); 
    fill(0,0,0,random(0,27));
    rect(250, 200, 300, 350);
  
    
  }
    
      noStroke();
        fill(240, 239, 223); 
        rectMode(CORNER); 
        rect(0, 0, 75, 500); 
        fill(255); 
        rect(50, 0, 50, 380); 
        rect(50, 0, 400, 20);
        
        fill(240, 239, 223); 
        rect(0, 0, 75, 500);
        rect(0, 400, 500, 75);
        rect(0,400,500,500);
        rect(400,0,500,500);
        fill(255);
        rect(75,375,375,30);
  }


  if (mouseY > 250)
  {
      rectMode(CENTER); 
    fill(400-(yPosition), 300-yPosition, 150+yPosition*0.9, 100); 
    rect(250, 200, 300, 350); 
    fill(0,0,0,random(0,27));
    rect(250, 200, 300, 350);
  
 for(int x=0; x < width+5; x += 25){
    for(int y=0;y < height+5; y += 25){

  for(int r = 5; r < 50; r += 20) {
 fill(0,0,0,random(0,27));
    ellipse(x,y,r,r);}
    }
      }
    noStroke();
    for(float n=random(0,100); n<width; n +=random(10,300)){
       for(float s=random(0,100); s<height; s+=random(10,300)){
         fill(255);
         frameRate(4);
       ellipse(n,s,3,3);
       fill(255,255,255,random(100));
       ellipse(n,s,3,3);
       }
    }
    
    float xPosq = (constrain(mouseX, 150, 300)); 
        float yPosq = (constrain(mouseY, 50, 320)); 
    fill(255,255,255,random(0,72));
  ellipse(xPosq,yPosq,85,85);

  stroke(255,255,255,random(0,72));
  strokeWeight(5);
  noFill();
 for(int r = 5; r < 200; r += 20) {
  float xPosn = (constrain(mouseX, 150, 300)); 
        float yPosn = (constrain(mouseY, 50, 320)); 
   ellipse(xPosn,yPosn,r,r);
 }
    
    stroke(255,255,255,random(72));
    for (int l = 0; l < height; l += 20) {
      for (int e = 0; e < width; e += 20)
      {
        float xPosy = (constrain(mouseX, 150, 300)); 
        float yPosy = (constrain(mouseY, 50, 350)); 

        line(e, l, xPosy, yPosy);
      }
    }
    

      
    rectMode(CORNER);
    noFill();
    rect(100, 25, 300, 350);
    noStroke();
    fill(300-(yPosition*0.7));
    beginShape();
    vertex(100, 375);
    vertex(100, 230);
    vertex(110, 230);
    vertex(110, 210);
    vertex(120, 210);
    vertex(120, 270);
    vertex(125, 270);
    vertex(125, 210);
    vertex(130, 210);
    vertex(130, 190);
    vertex(145, 190);
    vertex(145, 300);
    vertex(150, 300);
    vertex(155, 270);
    vertex(160, 270);
    vertex(160, 240);
    vertex(160, 270);
    vertex(165, 270);
    vertex(165, 270);
    vertex(170, 300);
    vertex(170, 150);
    vertex(180, 150);
    vertex(180, 100);
    vertex(182, 100);
    vertex(185, 90);
    vertex(187, 100);
    vertex(190, 100);
    vertex(190, 150);
    vertex(200, 150);
    vertex(200, 305);
    vertex(230, 305);
    vertex(250, 290);
    vertex(270, 305);
    vertex(270, 340);
    vertex(280, 340);
    vertex(280, 375);
    endShape();

    beginShape();
    vertex(300, 375);
    vertex(300, 300);//here
    vertex(305, 300);
    vertex(305, 235);
    vertex(315, 235);
    vertex(315, 300);
    vertex(320, 300);
    vertex(320, 360);
    vertex(322, 360);
    vertex(325, 355);
    vertex(327, 360);
    vertex(330, 360);
    vertex(330, 210);
    vertex(340, 210);
    vertex(340, 200);
    vertex(360, 200);
    vertex(370, 130);
    vertex(380, 200);
    vertex(390, 200);
    vertex(400, 200);
    vertex(400, 375);

    endShape();
    fill(250);

  
    
      }
    if(mousePressed == false){

fill(250);
rectMode(CENTER);
background(242, 234, 215);
  rect(250, 200, 350, 400);
  fill(#D4F3FA);
  rect(250, 200, 300, 350);
  
  fill(255, 255, 255, 100);
 fill(250,177,18);
   ellipse(180,60,50,50);
   fill(180);
  beginShape();
  vertex(100,375);
  vertex(100,230);
  vertex(110,230);
  vertex(110,210);
  vertex(120,210);
  vertex(120,270);
  vertex(125,270);
  vertex(125,210);
  vertex(130,210);
  vertex(130,190);
  vertex(145,190);
  vertex(145,300);
  vertex(150,300);
  vertex(155,270);
  vertex(160,270);
  vertex(160,240);
  vertex(160,270);
  vertex(165,270);
  vertex(165,270);
  vertex(170,300);
  vertex(170,150);
  vertex(180,150);
  vertex(180,100);
  vertex(182,100);
  vertex(185,90);
  vertex(187,100);
  vertex(190,100);
  vertex(190,150);
  vertex(200,150);
  vertex(200,305);
  vertex(230,305);
  vertex(250,290);
  vertex(270,305);
  vertex(270,340);
  vertex(280,340);
  vertex(280,375);
  endShape();
  
  beginShape();
  vertex(300,375);
  vertex(300,300);//here
  vertex(305,300);
  vertex(305,235);
  vertex(315,235);
  vertex(315,300);
  vertex(320,300);
  vertex(320,360);
  vertex(322,360);
  vertex(325,355);
  vertex(327,360);
  vertex(330,360);
  vertex(330,210);
  vertex(340,210);
  vertex(340,200);
  vertex(360,200);
  vertex(370,130);
  vertex(380,200);
  vertex(390,200);
  vertex(400,200);
  vertex(400,375);
  
  endShape();

   
    }
  }




