

float myX;
float myY;

color color1;
color color2;
color color3;
color fireColor;

float easing = 0.07;
float easingX;
float easingY;

PImage img;
PImage cld;

int cldX;
int cld1X;
int cld2X;
int cldW = 1568;

int systemW = 1090;
int systemH = 576;  

float bombY = 0;
float bombX = 0;

float randColor = random(2);

boolean isBomb = false;

 
 
 /*//////////////////////////////////////////////////////*/
  
void setup()
{
    // size(1090,576);
    size(systemW,systemH);
    img = loadImage("scene1.jpg");
    cld = loadImage("clouds.png");
 
    cldX = 0;
    cld1X = 0;
    cld2X = cldW;
    
    myX=width/2;
    myY=height/2;
      
    color1 = color(0, 155, 39);
    color2 = color(255, 255, 0);
    color3 = color(255, 0, 0);
     
}
  
  /*//////////////////////////////////////////////////////*/
  
void draw(){
    
  smooth();
  background(205,225,255);
  image(img, 0, 0);
    
    
    myX=mouseX;
    myY=mouseY;
     
    float targetX = mouseX;
    float dx = targetX - easingX;
    if(abs(dx) > 1) {
      easingX += dx * easing;
    }
     
    float targetY = mouseY;
    float dy = targetY - easingY;
    if(abs(dy) > 1) {
      easingY += dy * easing;
    }
    
    
  float col = round(random(1, 100));
  scale(0.8);
  if(col>50){
    drawShip(mouseX,mouseY, color1,color2);
  }
  else{
    drawShip(mouseX,mouseY, color2,color1);
  }
  
  addClouds();
  scale(1);
      
 // drawShip(mouseX,mouseY, lightColor1,lightColor2);
   
  if(col>50) fireColor = color2;
  else fireColor = color3;
  makeBobm(fireColor);
  
  //blast();
 
}
  
  /*//////////////////////////////////////////////////////*/
  
 void addClouds()
 {  
   image(cld, cld1X, 0);
  image(cld, cld2X, 0);
  
  if(  (-cld1X) > (systemW+(systemW/2))  )
  {
    cld1X = systemW;
  }

  if(  (-cld2X) > (systemW+(systemW/2))  )
  {
    cld2X = cldW;
  }
  
  cld1X -= 1.0;
  cld2X -= 1.0;
}

/*//////////////////////////////////////////////////////*/


void blast(float bX, float bY){
    float X = bX;
    float Y = systemH-20;
    float scaleF = 1.5;
    
    fill(255,0,0);
    ellipse(X, Y, 50*scaleF, 50*scaleF);
    triangle(X+0*scaleF,Y-70*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X+30*scaleF,Y-50*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X+50*scaleF,Y-20*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X-50*scaleF,Y-20*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X-50*scaleF,Y-50*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);

    scaleF = 1;
    fill(255,255,0);
    ellipse(X, Y, 50*scaleF, 50*scaleF);
    triangle(X+0*scaleF,Y-70*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X+30*scaleF,Y-50*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X+50*scaleF,Y-20*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X-50*scaleF,Y-20*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X-50*scaleF,Y-50*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);

    scaleF = 0.7;
    fill(255,0,0);
    ellipse(X, Y, 50*scaleF, 50*scaleF);
    triangle(X+0*scaleF,Y-70*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X+30*scaleF,Y-50*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X+50*scaleF,Y-20*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X-50*scaleF,Y-20*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    triangle(X-50*scaleF,Y-50*scaleF, X+20*scaleF,Y+10*scaleF, X-20*scaleF,Y+10*scaleF);
    
}




/*//////////////////////////////////////////////////////*/

void makeBobm(color col1){
    //translate(easingX,easingY);
    if(!isBomb){
      bombY = easingY+100.0;//mouseY+200;//40;
      bombX = easingX;//mouseX+100;//40;
    }else{
      pushMatrix();
      fill(0,0,0);
      ellipse(bombX, bombY, 50, 50);
      quad(-5+bombX,-35+bombY, 5+bombX,-35+bombY, 5+bombX,10+bombY, -5+bombX,10+bombY);
      fill(col1);
      triangle(bombX,-40+bombY, 10+bombX,-30+bombY, -10+bombX,-30+bombY);
      triangle(10+bombX,-35+bombY, bombX,-25+bombY, -10+bombX,-35+bombY);
      popMatrix();
      bombY += 8;
      if(bombY > systemH){
        isBomb=false;
        blast(bombX,bombX);
      }
    }

}

/*//////////////////////////////////////////////////////*/


void mousePressed()
{
  isBomb = true;
}


/*//////////////////////////////////////////////////////*/

void drawShip(float x, float y, color col1, color col2)
{

 float scaleFactor = 0.8;
  pushMatrix();
 //  translate(x-400,y-400);
 //  translate(easingX-400,easingY-400);
  // translate(easingX-250,easingY-250);
     translate(easingX-(400*scaleFactor),easingY-(400*scaleFactor));
    
     
    // strokeWeight(0);
     noStroke();
  
  
  //legs
    fill(196,0,0);
   // quad(290,490, 340,530, 320,600, 290,600);
   // quad(510,490, 460,530, 485,600, 510,600);
   // quad(380,540, 420,540, 410,570, 390,570);
   // ellipse(300, 600, 50, 50);
   // ellipse(500, 600, 50, 50);
   // ellipse(400, 580, 40, 40);
  
    quad(290*scaleFactor,490*scaleFactor, 340*scaleFactor,530*scaleFactor, 320*scaleFactor,600*scaleFactor, 290*scaleFactor,600*scaleFactor);
    quad(510*scaleFactor,490*scaleFactor, 460*scaleFactor,530*scaleFactor, 485*scaleFactor,600*scaleFactor, 510*scaleFactor,600*scaleFactor);
    quad(380*scaleFactor,540*scaleFactor, 420*scaleFactor,540*scaleFactor, 410*scaleFactor,570*scaleFactor, 390*scaleFactor,570*scaleFactor);
    ellipse(300*scaleFactor, 600*scaleFactor, 50*scaleFactor, 50*scaleFactor);
    ellipse(500*scaleFactor, 600*scaleFactor, 50*scaleFactor, 50*scaleFactor);
    ellipse(400*scaleFactor, 580*scaleFactor, 40*scaleFactor, 40*scaleFactor);

  
  
  //body
    fill(196,0,0);
    // ellipse(400, 400, 300, 300);
    ellipse(400*scaleFactor, 400*scaleFactor, 300*scaleFactor, 300*scaleFactor);

  
  
  // wind shield
    fill(255,255,255);
    //ellipse(400, 400, 250, 100);
    ellipse(400*scaleFactor, 400*scaleFactor, 250*scaleFactor, 100*scaleFactor);
    
    fill(42,160,221);
    //ellipse(400, 400, 230, 90);
   ellipse(400*scaleFactor, 400*scaleFactor, 230*scaleFactor, 90*scaleFactor);
  
  
  // upper lights
    fill(255,255,0);
   // ellipse(310, 330, 40, 40);
   // ellipse(490, 330, 40, 40);
   
    ellipse(310*scaleFactor, 330*scaleFactor, 40*scaleFactor, 40*scaleFactor);
    ellipse(490*scaleFactor, 330*scaleFactor, 40*scaleFactor, 40*scaleFactor);
    
    //---------
    //fill(0,155,39);
    fill(col1);
    // ellipse(350, 320, 20, 20);
    // ellipse(450, 320, 20, 20);
    
    ellipse(350*scaleFactor, 320*scaleFactor, 20*scaleFactor, 20*scaleFactor);
    ellipse(450*scaleFactor, 320*scaleFactor, 20*scaleFactor, 20*scaleFactor);
    
    //---------
    //fill(255,255,0);
    fill(col2);
   // ellipse(375, 317, 20, 20);
   // ellipse(425, 317, 20, 20);
   
    ellipse(375*scaleFactor, 317*scaleFactor, 20*scaleFactor, 20*scaleFactor);
    ellipse(425*scaleFactor, 317*scaleFactor, 20*scaleFactor, 20*scaleFactor);
    
    
    //----------
    //fill(0,155,39);
    fill(col1);
    //ellipse(400, 315, 20, 20);
    ellipse(400*scaleFactor, 315*scaleFactor, 20*scaleFactor, 20*scaleFactor);
      
    //roof
    fill(0,0,160);
   // ellipse(400, 275, 150, 50);
    ellipse(400*scaleFactor, 275*scaleFactor, 150*scaleFactor, 50*scaleFactor);
    
    fill(80,68,155);
    //ellipse(400, 260, 100, 40);
    ellipse(400*scaleFactor, 260*scaleFactor, 100*scaleFactor, 40*scaleFactor);
      
      
    //antenna
    strokeWeight(10);
    //curve(410,190, 400,250, 410,190, 500,150);
     curve(410*scaleFactor,190*scaleFactor, 400*scaleFactor,250*scaleFactor, 410*scaleFactor,190*scaleFactor, 500*scaleFactor,150*scaleFactor);
    
    
    
    //line(85, 20, 85, 75);
    strokeWeight(0);
    fill(0,0,160);
    //ellipse(410, 190, 20, 20);
    ellipse(410*scaleFactor, 190*scaleFactor, 20*scaleFactor, 20*scaleFactor);
  
  
    //nose
    fill(111,101,79);
    //ellipse(400, 500, 50, 50);
     ellipse(400*scaleFactor, 500*scaleFactor, 50*scaleFactor, 50*scaleFactor);
    
    fill(80,72,56);
   // ellipse(400, 520, 20, 20);
    ellipse(400*scaleFactor, 520*scaleFactor, 20*scaleFactor, 20*scaleFactor);
    
    fill(0,0,0);
    //ellipse(400, 520, 13, 13);
    ellipse(400*scaleFactor, 520*scaleFactor, 13*scaleFactor, 13*scaleFactor);
  
  
  
    //lower lights
    fill(42,160,221);
   // ellipse(330, 480, 55, 55);
   ellipse(330*scaleFactor, 480*scaleFactor, 55*scaleFactor, 55*scaleFactor);
    
    fill(42,160,221);
   // ellipse(470, 480, 55, 55);
   ellipse(470*scaleFactor, 480*scaleFactor, 55*scaleFactor, 55*scaleFactor);
   
    fill(255,255,255);
   // ellipse(330, 480, 50, 45);
    ellipse(330*scaleFactor, 480*scaleFactor, 50*scaleFactor, 45*scaleFactor);
    
    fill(255,255,255);
    //ellipse(470, 480, 50, 45);
     ellipse(470*scaleFactor, 480*scaleFactor, 50*scaleFactor, 45*scaleFactor);
    
    fill(255,255,0);
    //ellipse(330, 480, 40, 40);
    ellipse(330*scaleFactor, 480*scaleFactor, 40*scaleFactor, 40*scaleFactor);
    
    fill(255,255,0);
    //ellipse(470, 480, 40, 40);
    ellipse(470*scaleFactor, 480*scaleFactor, 40*scaleFactor, 40*scaleFactor);
      
    popMatrix();
    translate(0,0);
}





