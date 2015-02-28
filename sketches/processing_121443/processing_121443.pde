
/*************THIS PROCESSING SHOWS THE EYE TRANSFORMATION**
**************FROM SHARINGAN TO MANGEKYOU SHARINGAN*********
**************WITH A POSTERIOR CHANGE INTO RINNEGAN*********
************************************************************/


//sharingan eye mark positions
int topX = 250;
int topY = 140;
int topX2 = 250;
int topY2 = 140;
int leftX = 155;
int leftY = 330;
int leftX2 = 155;
int leftY2 = 330;
int rightX = 345;
int rightY = 330;
int rightX2 = 345;
int rightY2 = 330;
int midRightX = 365;
int midRightY = 200;
int botX = 250;
int botY = 375;
int midLeftX = 135;
int midLeftY = 200;

//eye position triggers
boolean midR = false;
boolean midL = false;
boolean bot = false;
boolean left = false;
boolean right = false;
boolean top = true;

//movement variables
int i = 0;
int j = 0;

//eye shape tigger
boolean mangekyou = false;
boolean sharingan = true;

//amaterasu
PImage amaterasu;

//tsukiyomi variables
int w = 0;
int z = 0;

void setup(){
  size(500,500);
  frameRate(20);
  background(0,0,0);
  smooth();
  amaterasu = loadImage("black-flame.png");
}

void draw(){
  
  /****PRINTLINERS - NOT NEEDED*****
  println(mouseX+","+mouseY);
  println("z " + z);
  println("w " + w);
  println("Sharingan " + sharingan);
  println("Mangekyo " + mangekyou);
  **********************************/
  
     //Press R to reset the sharingan
     if(keyPressed){
     if(key == 'r'){
         j = 0;
         i = 0;
         w = 0;
         z = 0;
         fill(0,0,0);
         rect(0,0,500,500);
         sharingan = true;
         mangekyou = false;
     }
     }
     
     //tsukiyomi illusion background
     if(j < 500){       
     fill(random(255),random(255),random(255));
     rect(w,random(0,500),20,j);
     rect(500,random(0,500),z,20);
     rect(random(0,500),w,20,j);
     rect(0,random(0,500),j,20);
     }
     //trigger for mangekyou
     if(j >= 500){
     sharingan = false;
     mangekyou = true;
     }
     
     //sharingan activated
     if(sharingan == true){
       //eye base
       strokeWeight(2);
       fill(255,0,0);
       ellipse(250,250,360,360);
       fill(0,0,0);
       ellipse(250,250,55,55);
       //sharingan - while movement source
       ellipse(topX,topY,55,55);
       ellipse(rightX2,rightY2,55,55);
       ellipse(leftX2,leftY2,55,55);       
       //sharingan line
       noFill();
       ellipse(250,250,250,250);
       //Mangekyou sharingan starts here:
     }else if(mangekyou == true){
       strokeWeight(2);
       fill(255,0,0);
       ellipse(250,250,360,360);
       fill(0,0,0);
       ellipse(250,250,250,250);
       fill(255,0,0);
       ellipse(250,250,55,55);
       fill(0,0,0);
       beginShape();
       vertex(208,130);
       vertex(208,75);
       vertex(250,70);
       vertex(292,75);
       vertex(292,130);
       vertex(208,130);
       endShape();
       beginShape();
       vertex(202,366);
       vertex(169,411);
       vertex(132,386);
       vertex(102,351);
       vertex(143,316);
       vertex(202,366);
       endShape();
       beginShape();
       vertex(299,366);
       vertex(329,411);
       vertex(367,386);
       vertex(399,351);
       vertex(356,316);
       vertex(299,366);
       endShape();
       }
     
     //NOT NEEDED println("j " + j);
     
     //fuck my life, sharingan eye marks movement
     if (sharingan == true){
        if (i < 3){
        if(i == 0){
        fill(0,0,0);
        triangle(235,116,275,95,265,115);
        triangle(127,334,119,289,137,308);
        triangle(354,356,305,373,326,349);
        }else if(i <= 3){
        fill(0,0,0);
        triangle(111,185,140,145,138,172);
        triangle(245,402,197,379,222,378);
        triangle(385,180,411,226,386,209);
        }
        while(top == true){
        topX = midLeftX;
        topY = midLeftY;
        rightX2 = midRightX;
        rightY2 = midRightY;
        leftX2 = botX;
        leftY2 = botY;
        top = false;
        right = false;
        left = false;
        midL = true;
        midR = false;
        bot = false;
        }
        ++i;
        }else if(i >= 3 && i < 6){
        if(i >= 4 && i < 6){          
        fill(0,0,0);
        triangle(127,334,119,289,137,308);
        triangle(354,356,305,373,326,349);
        triangle(235,116,275,95,265,115);
        }
        while(midL == true){
        topX = leftX;
        topY = leftY;
        rightX2 = topX2;
        rightY2 = topY2;
        leftX2 = rightX;
        leftY2 = rightY;
        top = false;
        right = false;
        left = true;
        midL = false;
        midR = false;
        bot = false;
        }
        ++i;
        }else if(i >= 6 && i < 9){
        if(i > 6 && i <= 9){
        fill(0,0,0);
        triangle(245,402,197,379,222,378);
        triangle(385,180,411,226,386,209);
        triangle(111,185,140,145,138,172);
        }
        while(left == true){
        topX = botX;
        topY = botY;
        rightX2 = midLeftX;
        rightY2 = midLeftY;
        leftX2 = midRightX;
        leftY2 = midRightY;
        top = false;
        right = false;
        left = false;
        bot = true;
        midR = false;
        midL = false;        
        }
        ++i;        
        }else if(i >= 9 && i < 12){
        if(i > 9 && i <= 12){
        fill(0,0,0);
        triangle(354,356,305,373,326,349);
        triangle(235,116,275,95,265,115);
        triangle(127,334,119,289,137,308);
        }
        while(bot == true){
        topX = rightX;
        topY = rightY;
        rightX2 = leftX;
        rightY2 = leftY;
        leftX2 = topX2;
        leftY2 = topY2;
        top = false;
        bot = false;
        right = true;
        left = false;
        midR = false;
        midL = false;
        }
        ++i;
        }else if(i >= 12 && i < 15){
        if(i > 12 && i <= 15){
        fill(0,0,0);
        triangle(385,180,411,226,386,209);
        triangle(111,185,140,145,138,172);
        triangle(245,402,197,379,222,378);
        }
        while(right == true){
        topX = midRightX;
        topY = midRightY;
        rightX2 = botX;
        rightY2 = botY;
        leftX2 = midLeftX;
        leftY2 = midLeftY;
        top = false;
        bot = false;
        right = false;
        left = false;
        midR = true;
        midL = false;
        }
        ++i;
        }else if(i >= 15 && i < 18){
        if(i == 15){
        fill(0,0,0);
        }
        while(midR == true){
        topX = 250;
        topY = 140;
        rightX2 = 345;
        rightY2 = 330;
        leftX2 = 155;
        leftY2 = 330;
        top = true;
        bot = false;
        right = false;
        left = false;
        midR = false;
        midL = false;
        }
        j = j + 80;
        w = w + 80;
        z = z - 80;
        i = 0;
        }
     }//RINNGEN WHEN CLICKED, AREA OF SIGHT MANIPULABLE WITH MOUSE
     if(mousePressed && mangekyou == true && mouseX <= 400 && mouseX >= 100 && mouseY <= 400 && mouseY >= 100 ){
       strokeWeight(1);
       fill(204,153,255);
       ellipse(250,250,360,360);
       ellipse(250,250,mouseX-40,mouseY-40);
       ellipse(250,250,mouseX-110,mouseY-110);
       ellipse(250,250,mouseX-190,mouseY-190);
       strokeWeight(3);
       fill(127,0,255);       
       ellipse(250,250,80,80);
       strokeWeight(1);
       fill(0,0,0);
       ellipse(250,250,25,25);
     }

}

void mousePressed(){
     /*CLICK TO ACTIVATE
     /ITACHI WORDS WHEN SHARINGAN*/
     if(mousePressed && sharingan == true){
     textSize(25);
     fill(255,255,255);
     text("Hate me, hate mas as much as you can",random(0,50),random(0,500));
     text("Run, cling to life",random(0,50),random(0,500));
     text("Come back when you have the same eyes as me",random(0,50),random(0,500));     
     }//AMATERASU FLAME WHEN MANGEKYOU
     else if(mousePressed && mangekyou == true){
     image(amaterasu,random(0,400),random(0,400));
     }
}








