
void setup() {
  size (400, 250);
background (20);
smooth ();
frameRate(1);
}

 void draw(){
  
    
char[] charArr = {'P', 'R', 'O', 'T', 'E', 'S', 'T'};

 
 PFont font;
 font = loadFont ("Helvetica-Bold-60.vlw");

  
   if (mousePressed){
     background(20);
  textFont (font, 60);
} 
  
  else{
    textFont (font, 20);
  }
  
  
  

for (int i = 0; i < 5; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    fill (200, 0, 0, 30);
    text (charArr[counter], random(width)-20, 50);
  };
};
 
for (int i = 0; i < 5; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    fill (0, 200, 0, 30);
    text (charArr[counter], random(width)-20, 100);
  };
};
 
for (int i = 0; i < 3; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    fill (0, 0, 220, 30);
    text (charArr[counter], random(width)-20, 150);
  };
};
 
for (int i = 0; i < 5; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    fill (220, 220, 220, 30);
    text (charArr[counter], random(width)-20, 200);
  };
};
 
for (int i = 0; i < 5; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    fill (200, 0, 100, 30);
    text (charArr[counter], random(width)-20, 250);
  };
  
  

};

 }

