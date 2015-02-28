
void setup(){
  size(500,500);
  frameRate(24);
  };
  
void draw(){
  background(30,234,90);
 
  
  //hair O
  fill(0);
  triangle(mouseX,mouseY-90,mouseX+40,mouseY-30,mouseX-40,mouseY-30);
  triangle(mouseX+30,mouseY-80,mouseX+45,mouseY-30,mouseX-15,mouseY-30);
  triangle(mouseX-30,mouseY-80,mouseX-45,mouseY-30,mouseX+15,mouseY-30);
  
  //faceO
  fill(250,240,160);
  noStroke();
  ellipse(mouseX,mouseY,100,130);
  
  //lefteyeO
  fill(0);
  ellipse(mouseX-18,mouseY-15,10,10);
  //righteyeO
  fill(0);
  ellipse(mouseX+18,mouseY-15,10,10);
  
  //eyebrushO
  fill(0);
  rect(mouseX-28,mouseY-22,18,3);
  
    //eyebrushO
  fill(0);
  rect(mouseX+10,mouseY-22,18,3);
  
  
    if(mousePressed == false){
    //mouthO
    fill(220,10,10);
    ellipse(mouseX,mouseY+25,30,10);
    }
    
    else{
      
         //halo 
    fill(60,200,250,150);
    
    float x1 = map(mouseX,0,width,200,400);
    float x2 = map(mouseX,0,width,20,480);
    float y1 = map(mouseY,0,width,20,480);
  
    ellipse(x2,y1,x1,x1);
      
      //hair A
    fill(250,250,60);
    triangle(mouseX,mouseY-150,mouseX+60,mouseY-30,mouseX-60,mouseY-30);
    triangle(mouseX+80,mouseY-130,mouseX+70,mouseY-30,mouseX-15,mouseY-50);
    triangle(mouseX-80,mouseY-130,mouseX-70,mouseY-30,mouseX+15,mouseY-50);
      //faceA
    fill(250,80,80);
    noStroke();
    ellipse(mouseX,mouseY,150,180);
  
    //lefteyeA
    fill(255);
    ellipse(mouseX-30,mouseY-30,35,25);
    //righteyeA
    fill(255);
    ellipse(mouseX+30,mouseY-30,35,25);
  
    //left Iris A
    fill(255,0,0);
    ellipse(mouseX-30,mouseY-30,5,25);
    //right Iris A
    fill(255,0,0);
    ellipse(mouseX+30,mouseY-30,5,25);
    
    //mouth A
    fill(220,10,10);
    ellipse(mouseX,mouseY+33,50,80);
    
     //mouth inner A
    fill(150,10,10);
    ellipse(mouseX,mouseY+33,30,50);
    
    
    //left eyebrushA
    fill(0);
    //rect(mouseX-60,mouseY-55,50,8);
    quad(mouseX-65,mouseY-60,mouseX-65,mouseY-50,mouseX-10,mouseY-40,mouseX-10,mouseY-50);
   
    //rihgt eyebrushA
    fill(0);
     quad(mouseX+65,mouseY-60,mouseX+65,mouseY-50,mouseX+10,mouseY-40,mouseX+10,mouseY-50);
    };
  
  };
  


