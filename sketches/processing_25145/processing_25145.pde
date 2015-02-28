
String word = "flexibility";
char[] letters;
PFont font;
float angle;
float angle_speed;

void setup() {
  size(300, 300);
  
  font = createFont("Times", 48);
  textFont(font);
  
  // convert our String ("flexibility") into an array of character variables:
  // {'f', 'l', 'e', 'x', 'i', 'b', 'i', 'l', 'i', 't', 'y'}
  letters = word.toCharArray();
}

void draw() {
   background(255);
   fill(0);
  
   // centers the text using textWidth
   translate( (width-textWidth(word))/2, height/2);
   
   // calculate an angle between 0 and 30 degrees 
   // based on the mouse position on the x axis 
   float new_angle = map(mouseX, 0, width, -radians(30), radians(30));     
   angle_speed += (new_angle-angle) * 0.1;
   angle += angle_speed;
   angle_speed *= 0.9;
   
   for (int i=0; i < letters.length; i++) {
     rotate(angle);
     text(letters[i], 0, 0);     
     translate(textWidth(letters[i]), 0);
     // notice no push an pop... we are using accumulation effect of 
     // transformations here
   }
   
}
