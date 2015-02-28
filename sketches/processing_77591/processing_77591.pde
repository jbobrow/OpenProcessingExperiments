
float x = 0;
float y = 0;
float r = 0;



void setup() {
size(1080, 720);
background(165,162,162);

}

void draw() {
if (mousePressed) {
//ellipse(mouseX, mouseY, 30, 30);

frameRate(60);
noStroke();
}

if (key == 'a') {
  ellipse(mouseX, mouseY, 50, 50);
fill(100, 10, 50);  //pink          
} 

else if (key == 'b') {
  
  if (mousePressed) {
    ellipse(mouseX, mouseY, 70, 100);
    }
    fill(60, 5, 30);    //dunkel pink
}

  if (key == 'c') {
    if (mousePressed) {
    rect(mouseX, mouseY, 33, 33);
    fill(255,216,0);    //gelb
    }
    
  }



                                                          
PFont font;                                                         
font = loadFont ("IrisUPCBold-48.vlw");                                                     
textFont (font);
text ("Let's do the alphabet: press A", 40, 89); 
fill(67, 145, 116);  //grün

  if (key == 'a') {
    fill(100, 10, 50);  //pink 
    text ("and now press B", 700, 89);
    } 



  else if (key == 'b') {
    fill(60, 5, 30);    //dunkel pink
    text ("C", 500, 710);
    }

  
  else if (key == 'c') {
    fill(255,216,0);
    
  }

}




