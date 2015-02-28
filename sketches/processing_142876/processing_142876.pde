
boolean clicked = false;
String keyPrompt = "press any key";
int eyeBallDiam;
float whiteeye = 193;
float whiteeye2 = 90;
float eyeline =-9;
float eyeline2 =5;
float mouthR=230;
float mouthB=30;
float mouthG=20;
float tonguemove=141;
float tongueline=77;
float tongueR=232;
float tongueG=115;
float tongueB=164;
float liplift=30;
float jawlift=45;

     
void setup(){
size (300, 300);
background(165, 8, 58);
}
   
      
void draw(){
 if (clicked == false){
 eyeBallDiam=20;

    
    
 }
  if(clicked==true){
    eyeBallDiam=40;
   
      
 }
 makeFace();
 smooth();
 text(keyPrompt,-145,-135);
 }
      
 void keyPressed(){
   clicked=! clicked;
   whiteeye = random(195, 215);
   whiteeye2= random(65,90);
   eyeline = random(10, 50);
   eyeline2 = random(10, 50);
   mouthR=random(10,255);
   mouthG=random(47,255);
   mouthB=random(90,255);
   tongueline=random(62,73);
   tongueR=random(200,255);
   tongueG=random(100,255);
   tongueB=random(20,255);
   jawlift=random(50,80);//bottom point of triangle
   liplift=random(25,57);
   tonguemove=random(120,140);

 
     
   keyPrompt = ("");
   //righteye= whiteeye
   //lefteye= whiteeye2
 }
      
 void makeFace(){
  background(165,8,58);
  noStroke();
  translate(10,10);
   
       
//face shape
fill(60,206,68);
noStroke();
ellipse( 139, 129, 226, 160);
scale(1, -1);
translate(0, -height);
smooth();
triangle(39, 133, 237, 133, 150, 30);
smooth();
      
      
//eyeball
fill(255, 255, 255);
//right eyeball
ellipse(whiteeye, 240, 80, 60);
//left eyeball
ellipse(whiteeye2, 240, 80, 60);
      
      
//pupils
fill(0,0,0);
ellipse(190, 240, eyeBallDiam, eyeBallDiam);
ellipse(90, 241, eyeBallDiam, eyeBallDiam);
      
//mouth
fill(mouthR,mouthG,mouthB);
triangle(57, 133, 220,133, 147, jawlift);
      
//tongue
fill(tongueR, tongueG, tongueB);
ellipse(tonguemove,123, 68, 90);
translate(145, 135);
fill(60,206,68);
ellipse (-8,liplift, 180, 100);
translate(-85,-96);
fill(229, 67, 157);
rect(tongueline,60, 5, 16, 40);
      
    
//eye lines
pushMatrix();
stroke(0,0,0);
strokeWeight(6);
translate(120,211);
line(-12,eyeline,30,eyeline);
popMatrix();
      
translate(9,197);
pushMatrix();
stroke(0,0,0);
strokeWeight(6);
line(0,eyeline2,45,eyeline2);
popMatrix();
      
//Smile lines
pushMatrix();
stroke(13,157,38);
strokeWeight(4);
translate(148,-99);
line(-15,1,7,-7);
popMatrix();
strokeWeight(4);
translate(9,-99);
line(-6,0,-26,-7);
 
 }

