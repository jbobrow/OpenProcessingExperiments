
class Shape{
  float radius=100;
  PVector pos = new PVector(width/2, height/2);
  color fillColor = color(255, 0, 0);
  String centerText = "";
  
  void draw(){
    fill(fillColor);
    ellipse(pos.x, pos.y, radius*2, radius*2);
    fill(0);
    ellipse(pos.x, pos.y, 10, 10);
    textSize(20);
    coloredText(centerText, new PVector(pos.x-centerText.length()*3, pos.y - 15));
  }
  
  float distance(Shape other){
    return sqrt((pos.x-other.pos.x)*(pos.x-other.pos.x) + (pos.y - other.pos.y)*(pos.y-other.pos.y));
  }
  
  boolean overlapsWith(Shape other){
    if (distance(other) < (radius + other.radius))
        return true;
      return false;
  } 
}

void drawArrow(PVector p0, PVector p1, float arrowHeight, float arrowWidth, String dimText){
  float angle = -atan2(p1.x-p0.x, p1.y-p0.y);
  noStroke();
   fill(0, 0, 255);   
   pushMatrix();
     translate(p0.x, p0.y);
     pushMatrix();
       rotate(angle);
        rect(-arrowWidth/2, 0, arrowWidth, arrowHeight-arrowWidth);
        triangle(-arrowWidth, arrowHeight-arrowWidth, arrowWidth, arrowHeight-arrowWidth, 0, arrowHeight);        
        fill(0);
        textSize(32);
        coloredText(dimText, new PVector(textWidth(dimText)/2, arrowHeight/2));           
     popMatrix();
   popMatrix();
}


void drawDimension(float x1, float y1, float x2, float y2, String dimText){
  float angle = -atan2(x2-x1, y2-y1);
  PVector textPos = new PVector(x1*.5 + x2*.5, y1*.5+y2*.5);
  
  stroke(0, 0, 0, 128);
  fill(0,0,0);
  textSize(20);
  line(x1, y1, x2, y2);
  
  pushMatrix();
    translate(textPos.x, textPos.y);
    pushMatrix();
      rotate(angle + PI/2);
      coloredText(dimText,  new PVector(-coloredTextWidth(dimText)/2, -5));
    popMatrix();
  popMatrix();
}

float coloredTextWidth(String coloredTextString){
  String printedString = "";
  for (int iChar=0, nChars=0; iChar<coloredTextString.length(); iChar++)
  {
    char cChar = coloredTextString.charAt(iChar); 
    if (cChar == "^")      
      iChar += 2;
      
    printedString += coloredTextString.charAt(iChar);
  }
  return textWidth(printedString);
}

void coloredText(String textString, PVector position){
  color [] textColors = {
    color(0,0,0),
    color(255,0,0),
    color(0, 255, 0),
    color(0, 0, 255),
    color(255, 255, 0),
    color(255, 0, 255),
    color(0, 255, 255),
    color(255, 128, 0),    
    color(255,255,255)};
    
  String printedString = "";
  
  for (int iChar=0, nChars=0; iChar<textString.length(); iChar++){
    char cChar = textString.charAt(iChar);
    
    if (cChar == "^"){
      cChar = textString.charAt(++iChar);
      if (cChar > textColors.length) cChar -= 48;
      
      fill(textColors[cChar]);
      iChar++;
    }
    
    text(textString.charAt(iChar), textWidth(printedString) + position.x, position.y);
    printedString += textString.charAt(iChar);    
  } 
}

Shape circle1, circle2;

void setup(){
  size(800, 800, P2D);
  strokeWeight(3);
  
  circle1 = new Shape();
  circle1.fillColor = color(128, 128, 255);
  circle1.pos.x = width*.25;
  circle1.pos.y = height*.75;
  circle1.centerText = "(^4x1^0, ^6y1^0)";
  circle1.radius = 150;
  
  circle2 = new Shape();
  circle2.fillColor = color(128, 255, 128);
  circle2.centerText = "(^5x2^0, ^7y2^0)";
}

void draw(){
  background(100);
   
  
   stroke(0);
   circle1.draw();
   circle2.pos.x = mouseX;
   circle2.pos.y = mouseY;
   circle2.draw(); 
  
   String dimText;
   if (circle1.overlapsWith(circle2)){
     dimText = "^1c^0<(r1+r2)"; 
     circle2.fillColor = color(255, 64, 64, 100);
   }
   else{
     dimText = "^1c^0>(r1+r2)";
     circle2.fillColor = color(128, 255, 128);
   }
      
   drawDimension(circle1.pos.x, circle1.pos.y, circle2.pos.x, circle2.pos.y, dimText);   
   
   float dimOffset = -40;
   PVector offPos1 = PVector.sub(circle1.pos, new PVector(dimOffset, dimOffset)),
           offPos2 = PVector.sub(circle2.pos, new PVector(dimOffset, dimOffset));
   
   float a = (int)offPos2.x - offPos1.x,
     b = (int)offPos1.y - offPos2.y;
     
   drawDimension(offPos1.x, offPos1.y, offPos2.x, offPos2.y, "^1c^0=sqrt(^2a^0*^2a^0+^3b^0*^3b^0) = " + (int)sqrt(a*a+b*b));
   
   if ((a > 10) || (b > 10)){
     drawDimension(offPos1.x, offPos1.y, offPos2.x, offPos1.y, "^2a^0 = ^5x2^0-^4x1^0 = " + (int)a);   
     drawDimension(offPos2.x, offPos1.y, offPos2.x, offPos2.y, "^3b^0 = ^7y2^0-^6y1^0 = " + (int)b);
   }
   
   drawArrow(circle1.pos, circle2.pos, circle1.radius, 10, "r1");
   drawArrow(circle2.pos, circle1.pos, circle2.radius, 10, "r2");
   
}
