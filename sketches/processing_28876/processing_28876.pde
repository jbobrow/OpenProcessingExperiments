
String word = "sehrsensibel"; 
char[] letters; 
PFont font; 
float angle; 
float angle_speed; 
  
void setup() { 
  size(500, 400); 
    
  font = createFont("Arial", 54); 
  textFont(font); 
    
  letters = word.toCharArray(); 
} 
  
void draw() { 
   background(215,63,87); 
   fill(0); 
    
   translate( (width-textWidth(word))/2, height/3); 
     
   // calculate an angle between 0 and 30 degrees  
   // based on the mouse position on the x axis  
   float new_angle = map(mouseX, 0, width, -radians(33), radians(33));      
   angle_speed += (new_angle-angle) * 0.1; 
   angle += angle_speed; 
   angle_speed *= 0.9; 
     
   for (int i=0; i < letters.length; i++) { 
     rotate(angle); 
     text(letters[i], 0, 0);      
     translate(textWidth(letters[i]), 0); 

   } 
     
}

