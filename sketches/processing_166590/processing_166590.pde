
void setup(){
  size(750,750);
  background(0);
}  
void draw() {
 background(0);
 PFont testicles;
 testicles = loadFont("AmericanTypewriter-12.vlw");
 textFont(testicles, 12);
 text("You have a 50% chance of winning $100 if Q is pressed, or a garuntee of $45 if W is pressed.", 100, 100);
 
   if (key == 'q' || key =='Q') {
    q(); 
      
  }
  
    if (key == 'w' || key =='W') {
      w();   
  }
}
  
void q(){
 background(0);
 PFont testicles;
 testicles = loadFont("AmericanTypewriter-12.vlw");
 textFont(testicles, 12);
 text("You're intellegent, CONGRATS!", 300, 100);

}

void w(){
 background(0);
 PFont testicles;
 testicles = loadFont("AmericanTypewriter-12.vlw");
 textFont(testicles, 12);
 text("Get a spine and start taking risks in your life!", 250, 100);

}











