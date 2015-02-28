
//5b responsivetype

String word = "boing";
char[] letters;
PFont font;
float angle;
float angle_speed;
   
void setup() {
  size(400, 400);
     
  font = createFont("Arial", 25);
  textFont(font);
     
  letters = word.toCharArray();
}
   
void draw() {
   background(255);
   fill(0);
     
   translate( (width-textWidth(word))/2, height/2);
      
  
   float new_angle = map(mouseX, 0, width, -radians(24), radians(24));     
   angle_speed += (new_angle-angle) * 0.9;
   angle += angle_speed;
   angle_speed *= 0.9;
      
   for (int i=0; i < letters.length; i++) {
     rotate(angle);
     text(letters[i], 0, 0);     
     translate(textWidth(letters[i]), 0);
   }
     
       float angle = map(mouseX, 0, width, -radians(24), radians(24));     
   angle_speed += (angle) * 0.9;
   angle += angle_speed;
   angle_speed *= 0.9;
      
   for (int i=0; i < letters.length; i++) {
     rotate(angle);
     text(letters[i], 5, 5);     
     translate(textWidth(letters[i]), 0);
 
 
   }
      
}

