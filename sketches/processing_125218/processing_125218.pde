
int x,y;
int index;
String[] signs = {"Aquarius", "Pisces", 
                    "Aries", "Taurus", "Gemini", 
                    "Cancer", "Leo", "Virgo", 
                    "Libra", "Scorpio", 
                    "Sagittarius", "Capricorn"};
  
void setup() {
  size(600,600);
  x = width/2;
  y = height/2;
  rectMode(CENTER);
  smooth();
  
  noFill();
  stroke(255); 
  ellipse(x, y, 300, 300);
   
}
 
void draw()
{  
   background(10);
   translate( width/2, height/2 );

  float a = atan2(mouseY-height/2, mouseX-width/2);
    rotate( a );
  noFill();
  strokeWeight(2);
  ellipse(x, y, 500, 500);
  if ( a > -PI/2 && a < -PI*.33) { 
    //Aquarius
    stroke(125, 235, 230); 
    text( "Aquarius jan.20 - feb.18", 50, 50);}
  else if (a > -PI*.33 && a < -PI*.167) { 
    //Pisces
    stroke(230, 50, 230); 
    text( "Pisces feb.19 - mar.20", 50, 50);}
  else if (a > -PI*.167 && a < 0) { 
    //Aries
    stroke(255, 115, 0); 
    text( "Aries mar.21 - apr.19", 50, 50);}
  else if (a > 0 && a < PI*.167) { 
    //Taurus
    stroke(100, 245, 190);
    text( "Taurus apr.20 - may.20", 50, 50); }
      
  else if (a > PI*.167 && a < PI*.33) { 
    //Gemini
    stroke(245, 240, 145); 
    text( "Gemini may.21 - jun.20", 50, 50);}
  else if (a > PI*.33 && a < PI/2) { 
    //Cancer
    stroke(230); 
    text( "Cancer jun.21 - jul.22", 50, 50);}
  else if (a > PI/2 && a < PI*.67) { 
    //Leo
    stroke(255, 200, 100);
    text( "Leo jul.23 - aug.22", 50, 50);}
  else if (a > PI*.67 && a < PI*.83) { 
    //Virgo
    stroke(95, 235, 240);
    text( "Virgo aug.23 - sept.22", 50, 50);}

  else if (a > PI*.83 && a  < PI) { 
    //Libra
    stroke(90, 190, 255);
    text( "Libra sept.23 - oct.22", 50, 50); }
  else if (a > -PI && a < -PI*.83) { 
    //Scorpio
    stroke(255, 85, 65); 
    text( "Scorpio oct.23 - nov.21", 50, 50);}
  else if (a > -PI*.83 && a < -PI*.67) { 
    //Sagittarius
    stroke(165, 85, 185);
    text( "Sagittarius nov.22 - dec.21", 50, 50);}
  else if (a > -PI*.67 && a < 0) { 
    //Capricorn
    stroke(200, 6, 15);
    text( "Capricorn dec.22 - jan.19", 50, 50);}
}




