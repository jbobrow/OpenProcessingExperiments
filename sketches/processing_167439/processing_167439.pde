
void setup() {
  size(500, 700);
}


void draw() {
 
 float x=(mouseX/150); //this will be used to control head movement
 float y=(mouseY/150); //as will this
 int eyex=1; //this will be a value that will be 0 when the cursor is off the screen in order to keep the pupils inside the eyes
 int eyey=1; // ditto
 float fc=frameCount; //initially made to manipulate speed of tail but only multiplies instead of increasing the speed
 float xwag=fc;// also^
 float ywag=fc;
 float erx=0; //made to fix the errors of the pupils by switching their movement to normal head movement instead of the accelerated eye movement
 float ery=0;
 float earR=0;//variable that allows the ear "twitch" to be manipulated easily when the fox is petted
 float earL=0;
 
 frameRate(120);
 
 if ((mouseX>500) || (mouseX<0)){
   eyex=0;
   erx=x;
 }

 if ((mouseY>700) || (mouseY<0)){
   eyey=0;
   ery=y;
 }

 //right ear twitch 
if ((mouseX>300) && (mouseX<360) && (mouseY>160) && (mouseY<250)) {
     if(mousePressed==true) {
       earR=10; //<- the 10 value controls the movement of the ears
     }else{
       earR=0;
     }
}

 //left ear twitch
if ((mouseX>300) && (mouseX<360) && (mouseY>160) && (mouseY<250)) {
     if(mousePressed==true) {
       earL=-10;
     }else{
       earL=0;
     }
}

//these if statements correctly speed up the tail wag but create a clipping error

//if ((mouseX>65) && (mouseX<375) && (mouseY>250) && (mouseY<575)) {
//  fc=fc*10;
//}else{
//  fc=fc;
//}

//if ((mouseX>75) && (mouseX<225) && (mouseY>250) && (mouseY<540)) {
//  fc=fc*1.5;
//}else{
//  fc=fc;
//}
  
if (fc>240) {//this sets x values in the tail wag to reverse at frame 240
  xwag=(-fc+480);
}else{
  xwag=fc;
}

if (fc>240) {//y values in the tail wag to reverse at frame 240
  ywag=(-fc+480);
}else{
  ywag=fc;
}

if (fc>480) {//once the variable of the framecount exceeds 480the framecount resets for the tail wag
  frameCount=0;
}
  
background(255);

//tail
stroke(255);
fill(148,93,63);
beginShape();
vertex(270, 485);
bezierVertex(230+xwag/10, 420-ywag/10, 110+xwag/5, 440-ywag/2, 80+((xwag/4)), 485-ywag/1.5);//the divisions set various rates of the tails wag
bezierVertex(105+xwag/5, 485-ywag/5, 225+xwag/10, 485-ywag/10, 270, 485);
endShape();

fill(189,130,90);

//bottom of body
beginShape();
vertex(260, 485);
bezierVertex(287, 338, 280, 300, 360, 485);
bezierVertex(265, 485, 225, 485, 240, 485);
endShape();

//back leg
beginShape();
vertex(240, 485);
bezierVertex(250, 410, 270, 355, 320, 485);
bezierVertex(265, 485, 225, 485, 240, 485);
endShape();

//stops the curve on the back leg
noStroke();
beginShape();
vertex(240, 485);
bezierVertex(283, 394, 350, 394, 379, 485);
bezierVertex(265, 485, 225, 485, 240, 485);
endShape();

//stomach
beginShape();
vertex(330, 485);
bezierVertex(300, 420, 260, 260, 330, 250);
bezierVertex(410, 260, 350, 420, 330, 485);
endShape();

//leg curve
beginShape();
vertex(379, 485);
bezierVertex(395, 440, 355, 415, 365, 357);
bezierVertex(345, 385, 365, 485, 240, 485);
endShape();

//left arm
stroke(255);
beginShape();
vertex(298, 484);
bezierVertex(310, 453, 270, 330, 290, 310);
bezierVertex(320, 385, 325, 453, 298, 484);
endShape();

//right arm
beginShape();
vertex(364, 484);
bezierVertex(350, 453, 385, 350, 375, 310);
bezierVertex(350, 350, 335, 453, 364, 484);
endShape();

//left neck
noStroke();
beginShape();
vertex(294, 215);
bezierVertex(310, 252, 275, 300, 290, 355);
bezierVertex(350, 310, 360, 252, 294, 215);
endShape();

//right neck
beginShape();
vertex(365, 215);
bezierVertex(350, 252, 383, 300, 376, 345);
bezierVertex(315, 310, 290, 252, 365, 215);
endShape();

           //start of face
//lower left snout
stroke(255);
beginShape();
vertex(x+327, y+265);
bezierVertex(x+314, y+253, x+297, y+231, x+282, y+222);
bezierVertex(x+292, y+212, x+327, y+232, x+327, y+265);
endShape();

//right snout
beginShape();
vertex(x+327, y+265);
bezierVertex(x+340, y+253, x+357, y+231, x+372, y+222);
bezierVertex(x+362, y+212, x+327, y+232, x+327, y+265);
endShape();

//forehead
noStroke();
beginShape();
vertex(x+282, y+222);
bezierVertex(x+287, y+135, x+367, y+135, x+372, y+222);
bezierVertex(x+352, y+242, x+307, y+242, x+282, y+222);
endShape();

//middle snout
beginShape();
vertex(x+327, y+265);
bezierVertex(x+307, y+237, x+307, y+187, x+327, y+157);
bezierVertex(x+347, y+187, x+347, y+237, x+327, y+265);
endShape();

//left ear
stroke(255);
beginShape();
vertex(x+281, y+209);
bezierVertex(x+269+earL, y+157-earL, x+271+earL, y+109-earL, x+301, y+167);
bezierVertex(x+293, y+175, x+287, y+195, x+281, y+209);
endShape();

//right ear
beginShape();
vertex(x+372, y+209);
bezierVertex(x+390+earR, y+157+earR, x+382+earR, y+109+earR, x+355, y+170);
bezierVertex(x+361, y+175, x+367, y+195, x+372, y+209);
endShape();

//left eye
fill(255);
noStroke();
beginShape();
vertex(x+319, y+227);
bezierVertex(x+319, y+212, x+303, y+199, x+297, y+205);
bezierVertex(x+299, y+215, x+310, y+227, x+319, y+227);
endShape();

//left eye
fill(100);
ellipse(((((mouseX-313)/50)*eyex)+313+erx), ((((mouseX)/200)+((mouseY-216)/50)*eyey)+216+ery), 10, 15);

//left eyelid
fill(189,130,90);
beginShape();
vertex(x+319, y+227);
if ((mouseX>300) && (mouseX<360) && (mouseY>160) && (mouseY<250)) {
  if (mousePressed) {
    bezierVertex(x+327, y+257, x+303, y+257, x+297, y+205);
  }
} else {
  bezierVertex(x+319, y+210, x+303, y+199, x+297, y+205);
}
bezierVertex(x+299, y+175, x+327, y+187, x+319, y+227);
endShape();

//lower lid
beginShape();
vertex(x+319, y+227);
bezierVertex(x+327, y+257, x+303, y+257, x+297, y+205);
bezierVertex(x+299, y+215, x+310, y+227, x+319, y+227);
endShape();

//right eye
fill(255);
beginShape();
vertex(x+335, y+227);
bezierVertex(x+335, y+212, X+351, y+199, x+357, y+205);
bezierVertex(x+355, y+215, x+344, y+227, x+335, y+227);
endShape();

fill(100);
ellipse((((mouseX-346)/45)*eyex)+346+erx, ((((-mouseX)/200)+((mouseY-218)/50)*eyey)+218+ery), 10, 15);

//right eyelid
fill(189,130,90);
beginShape();
vertex(x+335, y+227);
if ((mouseX>300) && (mouseX<360) && (mouseY>160) && (mouseY<250)) {
if (mousePressed) {
  bezierVertex(x+327, y+257, x+351, y+257, x+357, y+205);
 }
} else {
  bezierVertex(x+335, y+212, x+351, y+199, x+357, y+205);
}
bezierVertex(x+355, y+177, x+327, y+197, x+335, y+227);
endShape();

//lower lid
beginShape();
vertex(x+335, y+227);
bezierVertex(x+327, y+257, x+351, y+257, x+357, y+205);
bezierVertex(x+355, y+215, x+344, y+227, x+335, y+227);
endShape();

//attempted eye lines
if ((mouseX>300) && (mouseX<360) && (mouseY>160) && (mouseY<250)) {
     if(mousePressed==true) {
       stroke(255);
     }else{
       stroke(255,255,255,0);
     }
}

//close eye line
strokeWeight(1.75);
fill(255,255,255,0);
beginShape();
vertex(x+319, y+227);
bezierVertex(x+319, y+212, x+303, y+199, x+297, y+205);
endShape();

//right eye line
beginShape();
vertex(x+335, y+227);
bezierVertex(x+335, y+212, x+351, y+199, x+357, y+205);
endShape();

//shadow
noStroke();
fill(206, 206, 207);
triangle(240, 485, 379, 485, x+428, -y+573);

}
