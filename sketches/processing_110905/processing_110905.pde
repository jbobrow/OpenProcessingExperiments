
float noiseScale=2; //declare the noice scale

void setup() {
size(400,400);//indicate the window size
background(255); //indicate background color of the window
 }
 
void draw() {

//if-else structure
if(mousePressed == true) { //if we click the mouse, the boy and the sentence will appear
background(0);

fill(240,214,204);
ellipse(200, 200, 200, 200);//create the face

fill(240,214,204);
ellipse(110, 200, 40, 40);//create the ears

fill(240,214,204);
ellipse(290, 200, 40, 40);//create the ears

fill(0);  
ellipse(150, 190, 15, 15);//create the eyes

fill(0);  
ellipse(250, 190, 15, 15);//create the eyes

fill(242,158,176);  
ellipse(200, 197, 50, 50);//create the nose

fill(241,102,142);  
ellipse(200, 250, 80, 40);//create the mouth


noStroke();
textSize(15); //set the font size
text("It is because a boy is yelling.",100, 70); //add the sentence''It is because a boy is yelling.''

}

else {

background(0); //set the background color
for (int x=0; x < width; x++) {

float noiseVal = noise((mouseX+x)*noiseScale, 
                            mouseY*noiseScale);
stroke(noiseVal*255);
line(x, mouseY+noiseVal*80, x, height);
                            
                            
                            
textSize(15); //set the font size
text("Why there is so noisy?",100, 200); //add the sentence"Why there is so noisy?"
  }
}
}



