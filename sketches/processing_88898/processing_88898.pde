
int x = (200);
int y = (150);
int time = 5000;
int face1 = 170;
int face2 = 126;
int face3 = 50;
int face4 = 50;
boolean did_print = false;
PImage img;
PImage img2;

 
void setup(){
  size(400,300);
  img = loadImage("Okay.jpg");
  img2 = loadImage("stop.jpg");
}



//ANSWER THE QUESTION
void draw(){

   if (mousePressed==true){
image(img2,0,0);
 } else {
  
  if(!did_print) {
  println("You had your chance.  Any last words? Y/N");
  did_print = true;
  }
   
//background
background(255,0,0);

//are you f*ing kidding me
 fill(255,255,255);
 ellipse(face1,face2,face3,face4);
 noFill();
//mouth
 arc(171, 138, 20, 20, -PI / 6, PI / 6);
 line(160,139,161,137);
 line(161,137,173,137);
 line(173,137,175,139);
 line(164,139,170,139);
//eyes
 arc(175, 125, 10, 10, 0, PI);
 arc(160, 125, 10, 10, 0, PI);
//pupil
 fill(30,30,30);
 arc(175, 125, 5, 5, 0, PI);
 arc(160, 125, 5, 5, 0, PI);
 noFill();
//brows
 bezier(155,120,152,125,155,125,160,125);
 line(160,125,165,125);
 bezier(170,120,167,125,170,125,175,125);
 line(175,125,180,125);
 fill(255,255,255);
//arm
 beginShape();
 vertex(x,y);
 vertex(220,190);
//hand
 bezierVertex(220,190,225,204,210,200);
 vertex(130,180);
 bezierVertex(130,180,125,200,45,175);
//fingertips
 bezierVertex(45,175,33,172,40,160);
 vertex(35,159);
 bezierVertex(35,159,25,150,35,144);
 vertex(30,143);
 bezierVertex(30,143,20,133,34,127);
 vertex(40,127);
 bezierVertex(40,129,32,113,48,113);
 vertex(85,122);
 bezierVertex(85,122,78,110,90,107);
 vertex(125,116);
 bezierVertex(125,116,140,120,140,140);
//arm
 vertex(x,y+27);
 vertex(x-9,y);
 bezierVertex(x-9,y,x-7,y-10,x,y);
 endShape();
//hand detail
 line(40,160,75,169);
 line(35,144,75,154);
 line(40,127,80,137);
 line(85,122,105,127);
 fill(0,0,255);


//AWWWWWWWWW OKAY    
 if (keyPressed){
    if (key == 'n'){ 

image(img,0,0);

    }
 }


//NOW YOU'RE GETTING IT
 if (keyPressed){
     if (key == 'y'){  
   
    //background 
background(0,255,0);

     
     //LOL face
     fill(255,255,255);
     ellipse(face1,face2,face3,face4);
     //eyes
     ellipse(150,113,12,12);
     ellipse(170,116,12,12);
     fill(0,0,0);
     ellipse(171,117,4,4);
     noFill();
     fill(0,0,0);
     ellipse(147,111,4,4);
     noFill();
     fill(255,255,255);
     //mouth
     beginShape();
     vertex(155,120);
     vertex(145,118);
     vertex(145,144);
     vertex(157,140);
     endShape();
     ellipse(145,130,15,30);
     ellipse(145,130,9,24);
     //top gum & teeth
     line(142,122,147,122);
     line(142,125,149,125);
     line(144,122,144,125);
     line(147,122,147,125);
     //bottom gum & teeth
     line(142,138,147,138);
     line(142,135,149,135);
     line(144,135,144,138);
     line(147,135,147,138);
     //hand
     beginShape();
     vertex(x,y);
     bezierVertex(x,y,200,120,240,90);
     bezierVertex(240,90,230,70,260,50);
     bezierVertex(260,50,265,45,275,50);
     bezierVertex(275,50,300,25,320,30);
     bezierVertex(320,30,325,25,335,25);
     bezierVertex(335,25,340,30,330,40);
     bezierVertex(330,40,345,40,330,55);
     bezierVertex(330,55,335,60,325,70);
     bezierVertex(325,70,290,100,275,100);
     bezierVertex(275,100,200,120,x,y);
     endShape();
     //motion lines
     float motion = 5.34;
     float motion2 = 2.98;
     noFill();
     arc(x+5,y+5,260,260,motion2,motion);
     arc(x+10,y,280,280,motion2,motion);
     arc(x+5,y+10,250,250,motion2,motion);
     fill(255,0,0);
     noFill();
     stroke(0);
     //smack
     fill(254,255,5);
          beginShape();
     vertex(100,40);
     vertex(120,50);
     vertex(150,30);
     vertex(140,70);
     vertex(170,85);
     vertex(130,100);
     vertex(135,140);
     vertex(100,110);
     vertex(80,130);
     vertex(90,90);
     vertex(50,70);
     vertex(90,70); 
     endShape(CLOSE);
   }
 }
}
}


