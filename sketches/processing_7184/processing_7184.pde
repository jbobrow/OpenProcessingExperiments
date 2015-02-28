
float xEase;
float yEase;
float xEaseR;
float yEaseR;
float targetX, targetY;
float targetXR, targetYR;
float easing = 0.1;
float opacity = 0;
float opacity1 = 0;
float increment = 2;
float yPos = 480*.35;
float blink = height*.3;

void setup(){
  size(640, 480);
  smooth();

}
void draw(){
  int bg1 = 224;
  int bg2 = 179;
  int bg3 = 143;
  background(bg1,bg2,bg3);
  smooth();
  int x=width;
  int y=height;
 
  int mX = constrain(mouseX, 0, width);
  int mY = constrain(mouseY, 0, height);
 
  noStroke();
  fill(255);
  beginShape();//left eye
  curveVertex(.3*x, .5*y);
  curveVertex(.55*x, .5*y);
  curveVertex(.65*x, .5*y);
  curveVertex(.77*x, .52*y);
  curveVertex(.85*x, .47*y);
  curveVertex(.73*x, .43*y);
  curveVertex(.63*x, .5*y);
  curveVertex(.8*x, .41*y);
  endShape();
  beginShape();//right eye
  curveVertex(x-.3*x, .5*y);
  curveVertex(x-.55*x, .5*y);
  curveVertex(x-.65*x, .5*y);
  curveVertex(x-.77*x, .52*y);
  curveVertex(x-.85*x, .47*y);
  curveVertex(x-.73*x, .43*y);
  curveVertex(x-.63*x, .5*y);
  curveVertex(x-.8*x, .41*y);
  endShape();

  int iris1 = 129;
  int iris2 = 156;
  int iris3 = 183;
  int pupil1=0;
  float mapL1 = map(mX, 0, 640, x*.7, x*.79);
  float mapL2 = map(mY, 0, 480, y*.44, y*.49);
  targetX = mapL1;
  float dx = targetX - xEase;
  if(abs(dx) > 1){
    xEase+= dx* easing;
  }
  targetY = mapL2;
  float dy = targetY- yEase;
  if(abs(dy)>1){
    yEase+= dy* easing;
  }
  
    float mapR1 = map(mX, 0, 640, x-x*.79, x-x*.7);
  float mapR2 = map(mY, 0, 480, y*.44, y*.49);
  targetXR = mapR1;
  float dx1 = targetXR - xEaseR;
  if(abs(dx1) > 1){
    xEaseR+= dx1* easing;
  }
  targetYR = mapR2;
  float dy1 = targetYR- yEaseR;
  if(abs(dy1)>1){
    yEaseR+= dy1* easing;
  }
   
  if (mousePressed){
    opacity += increment;
    opacity = constrain(opacity, 0, 255);
  }
    else{
    opacity -= increment;
    opacity = constrain(opacity, 0, 255);
  }
  
  
  fill(242,201,201, opacity);
  beginShape();//left eye bloodshot
  curveVertex(.3*x, .5*y);
  curveVertex(.55*x, .5*y);
  curveVertex(.65*x, .5*y);
  curveVertex(.77*x, .52*y);
  curveVertex(.85*x, .47*y);
  curveVertex(.73*x, .43*y);
  curveVertex(.63*x, .5*y);
  curveVertex(.8*x, .41*y);
  endShape();
  beginShape();//right eye bloodshot
  curveVertex(x-.3*x, .5*y);
  curveVertex(x-.55*x, .5*y);
  curveVertex(x-.65*x, .5*y);
  curveVertex(x-.77*x, .52*y);
  curveVertex(x-.85*x, .47*y);
  curveVertex(x-.73*x, .43*y);
  curveVertex(x-.63*x, .5*y);
  curveVertex(x-.8*x, .41*y);
  endShape();
  
  //left eye veins
    stroke(185, 2, 2, opacity);
    strokeWeight(1);   
    beginShape();
    curveVertex(xEase, yEase);
    curveVertex(xEase+10, yEase+10);
    curveVertex(xEase+30, yEase+10);
    curveVertex(xEase+20, yEase+3);
    curveVertex(xEase+45, yEase+9);
    curveVertex(xEase+90, yEase+20);
    curveVertex(xEase+50, yEase-10);
    curveVertex(xEase, yEase);
    endShape();
   
    beginShape();
    curveVertex(xEase-100, yEase+15);
    curveVertex(xEase-99, yEase+13);
    curveVertex(xEase-65, yEase+7);
    curveVertex(xEase-50, yEase+20);
    curveVertex(xEase-45, yEase+10);
    endShape();
    beginShape();
    curveVertex(xEase, yEase+60);
    curveVertex(xEase+1, yEase+50);
    curveVertex(xEase-1, yEase+30);
    curveVertex(xEase+3, yEase+5);
    endShape();
    
    beginShape();
    curveVertex(xEase, yEase+60);
    curveVertex(xEase+9, yEase+50);
    curveVertex(xEase+1, yEase+30);
    curveVertex(xEase+9, yEase+5);
    endShape();
    beginShape();
    curveVertex(xEase, yEase+60);
    curveVertex(xEase+30, yEase+45);
    curveVertex(xEase+20, yEase+27);
    curveVertex(xEase+20, yEase+5);
    endShape();
    beginShape();
    curveVertex(xEase-10, yEase+60);
    curveVertex(xEase-30, yEase+45);
    curveVertex(xEase-20, yEase+20);
    curveVertex(xEase-30, yEase+5);
    endShape();
    beginShape();
    curveVertex(xEase-10, yEase-60);
    curveVertex(xEase-30, yEase-45);
    curveVertex(xEase-20, yEase-20);
    curveVertex(xEase-30, yEase-5);
    endShape();
    beginShape();
    curveVertex(xEase-30, yEase-60);
    curveVertex(xEase-80, yEase-45);
    curveVertex(xEase-50, yEase-10);
    curveVertex(xEase-50, yEase-5);
    endShape();
  //right eye veins
    stroke(185, 2, 2, opacity);
    strokeWeight(1);   
    beginShape();
    curveVertex(xEaseR, yEaseR);
    curveVertex(xEaseR+10, yEaseR+10);
    curveVertex(xEaseR+30, yEaseR+10);
    curveVertex(xEaseR+20, yEaseR+3);
    curveVertex(xEaseR+45, yEaseR+9);
    curveVertex(xEaseR+90, yEaseR+20);
    curveVertex(xEaseR+50, yEaseR-10);
    curveVertex(xEaseR, yEaseR);
    endShape();
   
    beginShape();
    curveVertex(xEaseR-100, yEaseR+15);
    curveVertex(xEaseR-99, yEaseR+13);
    curveVertex(xEaseR-65, yEaseR+7);
    curveVertex(xEaseR-50, yEaseR+20);
    curveVertex(xEaseR-45, yEaseR+10);
    endShape();
    beginShape();
    curveVertex(xEaseR, yEaseR+60);
    curveVertex(xEaseR+1, yEaseR+50);
    curveVertex(xEaseR-1, yEaseR+30);
    curveVertex(xEaseR+3, yEaseR+5);
    endShape();
    
    beginShape();
    curveVertex(xEaseR, yEaseR+60);
    curveVertex(xEaseR+9, yEaseR+50);
    curveVertex(xEaseR+1, yEaseR+30);
    curveVertex(xEaseR+9, yEaseR+5);
    endShape();
    beginShape();
    curveVertex(xEaseR, yEaseR+60);
    curveVertex(xEaseR+30, yEaseR+45);
    curveVertex(xEaseR+20, yEaseR+27);
    curveVertex(xEaseR+20, yEaseR+5);
    endShape();
    beginShape();
    curveVertex(xEaseR-10, yEaseR+60);
    curveVertex(xEaseR-30, yEaseR+45);
    curveVertex(xEaseR-20, yEaseR+20);
    curveVertex(xEaseR-30, yEaseR+5);
    endShape();
    beginShape();
    curveVertex(xEaseR-10, yEaseR-60);
    curveVertex(xEaseR-30, yEaseR-45);
    curveVertex(xEaseR-20, yEaseR-20);
    curveVertex(xEaseR-30, yEaseR-5);
    endShape();
    beginShape();
    curveVertex(xEaseR-30, yEaseR-60);
    curveVertex(xEaseR-80, yEaseR-45);
    curveVertex(xEaseR-50, yEaseR-10);
    curveVertex(xEaseR-50, yEaseR-5);
    endShape();

  noStroke();
   
   //iris and pupils

  fill(iris1, iris2, iris3);

  ellipse(xEase, yEase, 55,55);//left iris
  fill(pupil1);
  ellipse(xEase, yEase, 25, 25);//left pupil


  fill(iris1, iris2, iris3);
  ellipse(xEaseR, yEaseR, 55,55);//right iris
  fill(pupil1);
  ellipse(xEaseR, yEaseR, 25, 25);//right pupil

  float reflectL1 = map(mX, 0, 640, x*.69, x*.8);
  float reflectL2 = map(mY, 0, 480, y*.43, y*.5);
  float reflectR1 = map(mX, 0, 640, x-x*.8, x-x*.69);
  float reflectR2 = map(mY, 0, 480, y*.43, y*.5);
  fill(255);
  noStroke();
  ellipse(reflectL1, reflectL2, 5, 5);//left reflection
  fill(255, 200);
  ellipse(reflectL1, reflectL2, 6, 6);
  fill(255, 160);
  ellipse(reflectL1, reflectL2, 7, 7);
  fill(255, 120);
  ellipse(reflectL1, reflectL2, 8, 8);
  fill(255, 80);
  ellipse(reflectL1, reflectL2, 9, 9);
  fill(255, 40);
  ellipse(reflectL1, reflectL2, 10, 10);
  fill(255, 10);
  ellipse(reflectL1, reflectL2, 11, 11);
  ellipse(reflectR1, reflectR2, 5, 5);//right reflection
  fill(255, 200);
  ellipse(reflectR1, reflectR2, 6, 6);
  fill(255, 160);
  ellipse(reflectR1, reflectR2, 7, 7);
  fill(255, 120);
  ellipse(reflectR1, reflectR2, 8, 8);
  fill(255, 80);
  ellipse(reflectR1, reflectR2, 9, 9);
  fill(255, 40);
  ellipse(reflectR1, reflectR2, 10, 10);
  fill(255, 10);
  ellipse(reflectR1, reflectR2, 11, 11);
  
  
 fill(bg1, bg2, bg3); 
 rect(.4*x, .4*y, .2*x, .2*y);

//blinking code
  if (keyPressed){
    blink+=10;
    blink = constrain(blink, y*.3, y*.45);
  }
 else{
    blink-=10;
    blink = constrain(blink, y*.3, y*.45);
  }
 fill(bg1, bg2, bg3);
 stroke(0);
 strokeWeight(1.5);
 ellipse(.27*x, blink, .4*x, .2*y);
 ellipse(x-.27*x, blink, .4*x, .2*y);
  

 
  noStroke();
  fill(bg1,bg2,bg3);
  beginShape();//shape containing left iris/pupil/reflection
  curveVertex(.3*x, .5*y);
  curveVertex(.55*x, .5*y);
  curveVertex(.65*x, .5*y);
  curveVertex(.77*x, .52*y);
  curveVertex(.85*x, .47*y);
  curveVertex(.73*x, .43*y);
  curveVertex(.63*x, .5*y);
  curveVertex(.8*x, .41*y);
  vertex(.5*x, .25*y);
  vertex(.9*x, .15*y);
  vertex(.99*x, .5*y);
  vertex(.75*x, .75*y);
  endShape();
 
  beginShape();//shape containing left iris/pupil/reflection
  curveVertex(x-.3*x, .5*y);
  curveVertex(x-.55*x, .5*y);
  curveVertex(x-.65*x, .5*y);
  curveVertex(x-.77*x, .52*y);
  curveVertex(x-.85*x, .47*y);
  curveVertex(x-.73*x, .43*y);
  curveVertex(x-.63*x, .5*y);
  curveVertex(x-.8*x, .41*y);
  vertex(x-.5*x, .25*y);
  vertex(x-.9*x, .15*y);
  vertex(x-.99*x, .5*y);
  vertex(x-.75*x, .75*y);
  endShape();
  


 

 
  fill(80, 190);
  quad(x*.855, y*.475, x*.91, y*.47, x*.89, y*.48, x*.91, y*.49);//left far eye wrinkle
  quad(x-x*.855, y*.475, x-x*.91, y*.47, x-x*.89, y*.48, x-x*.91, y*.49);//right far eye wrinkle

  
    float shadow = mY/4;
    fill(mY/3, y-mY-300);//left large shadow
    beginShape();
    curveVertex(369, 147);
    curveVertex(365, 244);
    curveVertex(y-shadow, y-shadow-200);
    curveVertex(y-shadow-50, y-shadow-220);
    curveVertex(y-shadow+70, y-shadow-210);
    curveVertex(y-shadow+90, y-shadow-220);
    curveVertex(y-shadow+110, y-shadow-240);
    curveVertex(588, 219);
    vertex(588,219);
    vertex(558, 189);
    vertex(451, 208);
    endShape();
   
     beginShape();//right large shadow
    curveVertex(x-369, 147);
    curveVertex(x-365, 244);
    curveVertex(x-(y-shadow), y-shadow-200);
    curveVertex(x-(y-shadow-50), y-shadow-220);
    curveVertex(x-(y-shadow+70), y-shadow-210);
    curveVertex(x-(y-shadow+90), y-shadow-220);
    curveVertex(x-(y-shadow+110), y-shadow-240);
    curveVertex(x-588, 219);
    vertex(x-588,219);
    vertex(x-558, 189);
    vertex(x-451, 208);
    endShape();
    

   
    noStroke();
    fill(bg1, bg2, bg3);
    beginShape();
    vertex(588,219);
    vertex(558, 189);
    vertex(451, 208);
    vertex(370, 235);
    vertex(x-370, 235);
    vertex(x-451, 208);
    vertex(x-558, 189);
    vertex(x-588,219);
    vertex(0,0);
    vertex(640, 0);
    endShape(CLOSE);
    
 
  noFill();
  stroke(0);
  strokeWeight(1);
  beginShape();//left eye outline
  curveVertex(.3*x, .5*y);
  curveVertex(.55*x, .5*y);
  curveVertex(.65*x, .5*y);
  curveVertex(.77*x, .52*y);
  curveVertex(.85*x, .47*y);
  curveVertex(.73*x, .43*y);
  curveVertex(.63*x, .5*y);
  curveVertex(.8*x, .41*y);
  endShape();
  beginShape();//right eye outline
  curveVertex(x-.3*x, .5*y);
  curveVertex(x-.55*x, .5*y);
  curveVertex(x-.65*x, .5*y);
  curveVertex(x-.77*x, .52*y);
  curveVertex(x-.85*x, .47*y);
  curveVertex(x-.73*x, .43*y);
  curveVertex(x-.63*x, .5*y);
  curveVertex(x-.8*x, .41*y);
  endShape();
  

  
  if (mouseY>y*.5){
    translate(0, (-(.5*y-mouseY))/90);
  }
  noStroke();
  fill(0, opacity-150);
  triangle(x*.55, y*.48, x*.51, y*.38, x*.53, y*.49);
  triangle(x-x*.55, y*.48, x-x*.51, y*.38, x-x*.53, y*.49);
  //quad(x*.5, y*.37, x*.505, y*.43, x*.5, y*.5, x*.495, y*.43);
  
stroke(0);  
fill(0);
  
  beginShape();//left eyebrow
  vertex(.52*x, .48*y);
  vertex(.57*x, .51*y);
  vertex(.63*x, .5*y);
  vertex(.68*x, .46*y);
  curveVertex(.73*x, .4*y);
  curveVertex(.8*x, .39*y);
  curveVertex(.86*x, .41*y);
  curveVertex(.88*x, .42*y);
  curveVertex(.9*x, .43*y);
  vertex(.92*x, .46*y);
  vertex(.95*x, .45*y);
  vertex(.93*x, .44*y);
  vertex(.945*x, .44*y);
  vertex(.92*x, .43*y);
  vertex(.95*x, .43*y);
  vertex(.92*x, .42*y);
  vertex(.9*x, .4*y);
  vertex(.88*x, .39*y);
  vertex(.91*x, .39*y);
  vertex(.86*x, .38*y);
  vertex(.87*x, .37*y);
  vertex(.75*x, .4*y);
  vertex(.77*x, .38*y);
  vertex(.74*x, .4*y);
  curveVertex(.74*x, .4*y);
  curveVertex(.72*x, .41*y);
  curveVertex(.67*x, .43*y);
  curveVertex(.64*x, .45*y);
  curveVertex(.6*x, .47*y);
  curveVertex(.58*x, .47*y);
  vertex(.58*x, .47*y);
  vertex(.56*x, .46*y);
  vertex(.55*x, .47*y);
  vertex(.53*x, .46*y);
  vertex(.55*x, .48*y);
  endShape(CLOSE);

  beginShape();//right eyebrow
  vertex(x-.52*x, .48*y);
  vertex(x-.57*x, .51*y);
  vertex(x-.63*x, .5*y);
  vertex(x-.68*x, .46*y);
  curveVertex(x-.73*x, .4*y);
  curveVertex(x-.8*x, .39*y);
  curveVertex(x-.86*x, .41*y);
  curveVertex(x-.88*x, .42*y);
  curveVertex(x-.9*x, .43*y);
  vertex(x-.92*x, .46*y);
  vertex(x-.95*x, .45*y);
  vertex(x-.93*x, .44*y);
  vertex(x-.945*x, .44*y);
  vertex(x-.92*x, .43*y);
  vertex(x-.95*x, .43*y);
  vertex(x-.92*x, .42*y);
  vertex(x-.9*x, .4*y);
  vertex(x-.88*x, .39*y);
  vertex(x-.91*x, .39*y);
  vertex(x-.86*x, .38*y);
  vertex(x-.87*x, .37*y);
  vertex(x-.75*x, .4*y);
  vertex(x-.77*x, .38*y);
  vertex(x-.74*x, .4*y);
  curveVertex(x-.74*x, .4*y);
  curveVertex(x-.72*x, .41*y);
  curveVertex(x-.67*x, .43*y);
  curveVertex(x-.64*x, .45*y);
  curveVertex(x-.6*x, .47*y);
  curveVertex(x-.58*x, .47*y);
  vertex(x-.58*x, .47*y);
  vertex(x-.56*x, .46*y);
  vertex(x-.55*x, .47*y);
  vertex(x-.53*x, .46*y);
  vertex(x-.55*x, .48*y);
  endShape(CLOSE);
  
  
}

   

   


