
PImage angrybirdImage;
PImage angrybird2Image;
void setup(){
  size(600,600);
  smooth();
  
}

void draw(){
 //stroke(0);
 //strokeWeight(10);
 //line(75,20,225,30);
 //line(375,30,525,20);
   angrybirdImage=loadImage("a.jpg");
   image(angrybirdImage,0,0,600,600);
   if(keyPressed){
   if(key == 'e'){
   exit();
    }
  if(key == 'a'){
    angrybird2Image=loadImage("b.jpg");
   image(angrybird2Image,0,0,600,600);
 
     }
  }
}


void mousePressed(){
   if(mouseButton ==LEFT ){ 
   fill(0);
   //stroke(255);
   //strokeWeight(8);
   //line(100,200,200,200);
   //line(350,200,500,200);
   ellipse(269,240,30,30);
   ellipse(334,240,30,30);
   }
   else{
   if(mouseButton == RIGHT){
   strokeWeight(8);
   fill(0);
   ellipse(240,230,120,120);
   ellipse(370,230,120,120);
   fill(255);
   ellipse(240,230,30,30);
   ellipse(370,230,30,30);
  
   }   
 }
}

void mouseClicked(){
   stroke(0);
   strokeWeight(8); 
   line(230,240,270,240);
   line(334,240,374,240);

}

void mouseDragged(){
  noFill();
  strokeWeight(10);
  stroke(255,0,90); 
  if(mouseButton == LEFT){
  ellipse(300,270,mouseX,mouseY);
  }

}




