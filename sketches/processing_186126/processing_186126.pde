
Slider slide01, slide02, slide03, slide04;

  float v1;
  float v2;
  float v3;
  float v4;
  
  int tapCount = 0;

ArrayList<Kitty> cats;
 
void setup(){
  size(800,800);

 
 cats = new ArrayList<Kitty>();
 
  slide01 = new Slider((width/8)-15,height/8,50,250);
  slide02 = new Slider(((width/8)*2)-15,height/8,50,250);
  slide03 = new Slider(((width/8)*3)-15,height/8,50,250);
  slide04 = new Slider(((width/8)*4)-15,height/8,50,250);
   
}
 
void draw(){

  int buttonx = width-305;
  int buttony = height/4;
  
 
  

  /////////////////////////
  
v1 = map(slide01.value,0,255,100,50);
v2 = map(slide02.value,0,255,0,100);
v3 = map(slide03.value,0,255,0,100);
v4 = map(slide04.value,0,255,1,15);

    background(200);
    for(int i = cats.size()-1; i >= 0; i--){
    Kitty cat = cats.get(i);
    cat.update();
    cat.display();
  }

stroke(75);
strokeWeight(3);
fill(225);
rect(10,10,width-20,(height/2)-20);

if(dist(mouseX,mouseY,buttonx,buttony) < 50){
  if(mousePressed){
    
  fill(0,255,0);
   if(tapCount < 1){
     cats.add(new Kitty(v1,v3,v2,v4));
   }
  
  tapCount++;
  }else{
    tapCount = 0;
    fill(0,200,0);
  }  
}else{
  fill(50,100,0);
}

//stroke(75);
//strokeWeight(3);
noStroke();
ellipse(buttonx,buttony,75,75);
   
  
 
  
  slide01.update();
  slide01.display();
  
  slide02.update();
  slide02.display();
  
  slide03.update();
  slide03.display();
  
  slide04.update();
  slide04.display();



//use sliders
 fill(slide03.value);
// strokeWeight(map(slide04.value,0,255,1,10));
 kittyHead2(width-140,height/4,v1,v3,v2,v4);


  
   
  
  
      
}
 

 
class Arm{
   
  PVector loc = new PVector();
  float a = 12;
   
  float sinAngle = 0.0;
   
  float cX;
  float cY;
  float cX2;
  float cY2;
 
  float plo = 0;
  float ploCol;
   
  float folX;
  float folY;
  float easing = .4;
   
  float radius;
 
   
  Arm(float tx, float ty, float tr){
     
    loc.x = tx;
    loc.y = ty;
    folX = loc.x;
    folY = loc.y;
    radius=tr;
     
  }
   
  void update(float tx, float ty){
      
    loc.x = tx;
    loc.y = ty;
     
    float sinval = sin(sinAngle); 
    float wave = map(sinval, -1, 1, -width, width);
    sinAngle += .1;
     
    float angle = atan2(height-(ty*2),wave);
    cX = (a * cos(angle)) + loc.x;
    cY = (a * sin(angle)) + loc.y;
     
    folX += (cX - folX) * easing;
    folY += (cY - folY) * easing;
     
     
  }
   
  void display(int c, int l){
     

    line(loc.x,loc.y,folX,folY);
     
  }
   
}
class Kitty{
  
float ee; 
float cc; 
float ss; 
float bb;
  
  Arm[] segments = new Arm[10];
  
  float mouseX2;
  float mouseY2;
  
  float xx;
  float yy;
  float timer = 0;
  
  Kitty(float e,float c,float s,float b){
    
    ee = e;
    cc = c;
    ss = s;
    bb = b;
    
    xx = random(-width/2,width+(width/2));
    yy = height*3;
    
    mouseX2 = width/2;
    mouseY2 = (height/2)-100;

    
    timer = random(50,199);
    
      
  for(int i = 0; i < segments.length; i++){
 
    segments[i] = new Arm(mouseX2,mouseY2,22.5-(i/3));
   
  }
    
  }
  
  void update(){
    
    timer++;
    if(timer > 200){
      xx = random(-width/2,width+(width/2));
      yy = random(height/3,(height)+(height/6));
      timer = random(50,199);
    }
    
   
  mouseX2 += (xx - mouseX2) * .002;
  mouseY2 += (yy - mouseY2) * .002;
   
 
  for(int i = 0; i < segments.length; i++){
 
    if(i > 1){
     float px = segments[i-1].folX;
     float py = segments[i-1].folY;   
     segments[i].update(px,py);    
    }else{
     segments[i].update(map(mouseX2,0,width,62.5,width-62.5),map(mouseY2,0,height,62.5,height-62.5));
    }
  } 
    
  }
  
  void display(){
    colorMode(RGB,255);
    strokeWeight(20);
    stroke(55);
    for(int i = 0; i < segments.length; i++){
    segments[i].display(100,15);  //visual
    }
    strokeWeight(14);
    colorMode(HSB, 100);    
    stroke(cc,ss,300-ss*3);
    for(int i = 0; i < segments.length; i++){
    segments[i].display(100,15);  //visual
    }
  colorMode(RGB,255);  
  strokeWeight(3);
  stroke(55);
  colorMode(HSB, 100);
  fill(cc,ss,300-ss*3);
  ellipse(map(mouseX2,0,width,37.5,width-37.5),map(mouseY2,0,height,37.5,height-37.5),87.5,87.5);
  colorMode(RGB,255);
  kittyHead(mouseX2,mouseY2,ee,cc,ss,bb);
  colorMode(HSB, 100);
  fill(cc/2,cc,100);  
  ellipse(map(mouseX2,0,width,-12.5,width+12.5)-12.5,map(mouseY2,0,height,-17.5,height+17.5),7.5,bb/2);
  ellipse(map(mouseX2,0,width,-12.5,width+12.5)+12.5,map(mouseY2,0,height,-17.5,height+17),7.5,bb/2);
  colorMode(RGB,255);  
  fill(0);
  ellipse(map(mouseX2,0,width,-12.5,width+12.5)-12.5,map(mouseY2,0,height,-17.5,height+17.5),3,bb/2);
  ellipse(map(mouseX2,0,width,-12.5,width+12.5)+12.5,map(mouseY2,0,height,-17.5,height+17),3,bb/2); 
  fill(55);
  triangle(map(mouseX2,0,width,-12.5,width+12.5)+-4,map(mouseY2,0,height,-17.5,height+17)+11,map(mouseX2,0,width,-12.5,width+12.5)+0,map(mouseY2,0,height,-17.5,height+17)+15,map(mouseX2,0,width,-12.5,width+12.5)+4,map(mouseY2,0,height,-17.5,height+17)+11);
 // triangle(map(mouseX2,0,width,-12.5,width+12.5)+-4,mouseY2+11,mouseX2+0,mouseY2+15,mouseX2+4,mouseY2+11);
  }
  

  
  
  
}
class Slider{
  
float sliderX;
float sliderY;
float sliderSize;
float posX,posY;
float sWidth;
float sHeight;

float value;

float dir;
  
  Slider(float x, float y, float w, float h){

  sliderX = x;        //SLIDER H POSITION
  sliderY = y;       //SLIDER V POSITION
  sliderSize = w;
  
  posX = sliderX;
  posY = sliderY;
  
  value = 0;
  
  sWidth = w;
  sHeight = h;
  
  }
  
  void update(){
    
    
    
    
  
  if(mousePressed && dist(mouseX,mouseY,sliderX,sliderY)<sliderSize){    
  
   sliderY = mouseY;
  

  sliderSize = sWidth*3;
  
  }
  
  else{
    sliderSize = sWidth;
    
  
  }
  
  if(sliderY < posY){
    sliderY = posY;
    dir = 0;
  }
  if(sliderY > (posY+sHeight)-sWidth){
    sliderY = (posY+sHeight)-sWidth;
    dir=0;
  }
  
  println(dir);
    
  if(dist(mouseX,mouseY,sliderX,sliderY)<sWidth){    
  cursor(HAND);
  }else{
    cursor(ARROW);
  }
    
    value = map((sliderY-posY),0,sHeight-sWidth,255,0);
    
    
    
  }

  
  void display(){
    
  noStroke();  
  strokeWeight(3);
  fill(value/1.5);
  rect(posX-(sWidth/2),posY-(sWidth/2),sWidth,sHeight);
  fill(255);
  stroke(100);
  rect(sliderX-(sWidth/2),sliderY-(sWidth/2),sWidth,sWidth); 
    
  }
  
  
  
  
}
void kittyHead(float x, float y, float e, float c, float s, float b){ 

 pushMatrix();
  translate(x,y);
  scale(1);
  colorMode(HSB, 100);
  fill(c,s,300-s*3);
  colorMode(RGB,255);
  stroke(55);
  strokeWeight(6);
  ellipse(0,0,62.5,62.5);
  triangle(-35,-e/2,-15,-25,-25,-15);
  triangle(35,-e/2,15,-25,25,-15);
   
  noStroke();
  ellipse(0,0,62.5,62.5);
  triangle(-35,-e/2,-15,-25,-25,-15);
  triangle(35,-e/2,15,-25,25,-15);
   

   
  popMatrix();
  noStroke();


  
}


void kittyHead2(float x, float y, float e, float c, float s, float b){ 

 pushMatrix();
  translate(x,y);
  scale(2);
  colorMode(HSB, 100);
  fill(c,s,300-s*3);
  colorMode(RGB,255);
  stroke(75);
  strokeWeight(12);
  ellipse(0,0,62.5,62.5);
  triangle(-35,-e/2,-15,-25,-25,-15);
  triangle(35,-e/2,15,-25,25,-15);
   
  noStroke();
  ellipse(0,0,62.5,62.5);
  triangle(-35,-e/2,-15,-25,-25,-15);
  triangle(35,-e/2,15,-25,25,-15);
   
  colorMode(HSB, 100);
  fill(c/2,c,100);  
  ellipse(-13.5,0,7.5,b/2);
  ellipse(13.5,0,7.5,b/2);
  colorMode(RGB,255);
  fill(0);
  ellipse(-13.5,0,2.5,b/2);
  ellipse(13.5,0,2.5,b/2);
   
  stroke(75);
  strokeWeight(1);
  fill(75);
  triangle(-4,11,0,15,4,11);
   
  popMatrix();
  noStroke();


  
}



