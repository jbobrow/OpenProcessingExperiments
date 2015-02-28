
//modified from processing, basic examples:http://www.processing.org/learning/topics/springs.html


int num = 40; // if i put 9 as an integer, and then add all the extra springs, why doesnt it work?
Spring[] springs = new Spring[num]; 
PFont font;
String string = "I was wakened by an odd rustling in my ears. After having had my eyes closed, I had a feeling that the light had grown even stronger than before. There wasn't a trace of shadow anywhere, and every object, each curve or angle, seemed to score its outline on one's eyes. The old people, Mother's friends, were coming in. I counted ten in all, glid- ing almost soundlessly through the bleak white glare. None of the chairs creaked when they sat down. Never in my life had I seen anyone so clearly as I saw these people; not a detail of their clothes or features escaped me. And yet I couldn't hear them, and it was hard to believe they really existed. -Camus,The Stranger,10";
int fontSize = 8;
int specificWidth = 150;
int lineSpacing = 2;
 
int textHeight;
 

void setup()
{
 size(600, 600);
 noStroke(); 
 smooth();
 springs[0] = new Spring( 220, 150, 200, 0.98, 8.0, 0.1, springs, 0); //,70, el chiquitox,y, radious?, otherradious,how much it bounces in place,heavy
 springs[1] = new Spring( 200, 300, 80, 0.97, 9.0, 0.2, springs, 1); //150// el mediano
 springs[2] = new Spring( 180, 50, 120, 0.90, 9.9, 0.1, springs, 2);
 springs[3] = new Spring( 100, 350, 60, 0.98, 8.0, 0.1, springs, 3);
 springs[4] = new Spring( 50, 100, 80, 0.97, 9.0, 0.2, springs, 4);
 springs[5] = new Spring( 250, 410, 120, 0.90, 9.9, 0.1, springs, 5);
 springs[6] = new Spring( 70, 120, 60, 0.98, 8.0, 0.1, springs, 6);
 springs[7] = new Spring( 80, 200, 80, 0.97, 9.0, 0.2, springs, 7);
 springs[8] = new Spring( 100, 130, 120, 0.90, 9.9, 0.1, springs, 8);
 springs[9] = new Spring( 300, 350, 99, 0.98, 8.0, 0.1, springs, 9);
 springs[10] = new Spring( 150, 400, 88, 0.98, 8.0, 0.1, springs, 10);
 springs[11] = new Spring( 425, 140, 57, 0.98, 8.0, 0.1, springs, 11);
 springs[12] = new Spring( 275, 100, 75, 0.98, 8.0, 0.1, springs, 12);
 springs[13] = new Spring( 450, 350, 150, 0.98, 8.0, 0.1, springs, 13);
 springs[14] = new Spring( 500, 600, 85, 0.98, 8.0, 0.1, springs, 14);
 springs[15] = new Spring( 450, 400, 20, 0.98, 8.0, 0.1, springs, 15);
 springs[16] = new Spring( 75, 250, 200, 0.98, 8.0, 0.1, springs, 16); //
 springs[17] = new Spring( 50, 400, 80, 0.97, 9.0, 0.2, springs, 17); 
 springs[18] = new Spring( 180, 60, 120, 0.90, 9.9, 0.1, springs, 18);
 springs[19] = new Spring( 135, 350, 60, 0.98, 8.0, 0.1, springs, 19);
 springs[20] = new Spring( 256, 420, 120, 0.90, 9.9, 0.1, springs, 20);
 springs[21] = new Spring( 70, 450, 80, 0.98, 8.0, 0.1, springs, 21);
 springs[22] = new Spring( 155, 200, 60, 0.97, 9.0, 0.2, springs, 22);
 springs[23] = new Spring( 150, 200, 120, 0.90, 9.9, 0.1, springs, 23);
 springs[24] = new Spring( 300, 60, 99, 0.98, 8.0, 0.1, springs, 24);
 springs[25] = new Spring( 360, 500, 200, 0.98, 8.0, 0.1, springs, 25);
 springs[26] = new Spring( 300, 100, 60, 0.98, 8.0, 0.1, springs, 26);
 springs[27] = new Spring( 340, 150, 70, 0.98, 8.0, 0.1, springs, 27);
 springs[28] = new Spring( 430, 400, 20, 0.98, 8.0, 0.1, springs, 28);
 springs[29] = new Spring( 450, 200, 20, 0.98, 8.0, 0.1, springs, 29);
 springs[30] = new Spring( 450, 350, 150, 0.98, 8.0, 0.1, springs, 30);
 springs[31] = new Spring( 500, 600, 85, 0.98, 8.0, 0.1, springs, 31);
 springs[32] = new Spring( 450, 400, 20, 0.98, 8.0, 0.1, springs, 32);
 springs[33] = new Spring( 75, 250, 200, 0.98, 8.0, 0.1, springs, 33); 
 springs[34] = new Spring( 50, 400, 80, 0.97, 9.0, 0.2, springs, 34); 
 springs[35] = new Spring( 190, 320, 120, 0.90, 9.9, 0.1, springs, 35);
 springs[36] = new Spring( 200, 25, 20, 0.98, 8.0, 0.1, springs, 36);
 springs[37] = new Spring( 75, 400, 200, 0.98, 8.0, 0.1, springs, 37); 
 springs[38] = new Spring( 300, 250, 80, 0.97, 9.0, 0.2, springs, 38); 
 springs[39] = new Spring( 80, 240, 120, 0.90, 9.9, 0.1, springs, 39);
 
PFont font;
String string = "I was wakened by an odd rustling in my ears. After having had my eyes closed, I had a feeling that the light had grown even stronger than before. There wasn't a trace of shadow anywhere, and every object, each curve or angle, seemed to score its outline on one's eyes. The old people, Mother's friends, were coming in. I counted ten in all, glid- ing almost soundlessly through the bleak white glare. None of the chairs creaked when they sat down. Never in my life had I seen anyone so clearly as I saw these people; not a detail of their clothes or features escaped me. And yet I couldn't hear them, and it was hard to believe they really existed. -Camus, The stranger, 10";
int fontSize = 8;
int specificWidth = 200;
int lineSpacing = 2;
 
int textHeight; {
size(600,600);
  background(0);
 
  font = createFont("Apple-Chancery-20.vlw", fontSize);
  textFont(font,fontSize);
  //noLoop();
}
}

void draw() 
{
  
 background(51);//51 

   for (int i = 0; i < num; i++) { 
   springs[i].update(); 
   springs[i].display();
 }  

  fill(60);
  stroke(60);
  //rect(150,150,specificWidth, calculateTextHeight(string, specificWidth, fontSize, lineSpacing));// so it doesnt box it
  fill(255);
  text(string, 150,150,specificWidth,1500);
}
int calculateTextHeight(String string, int specificWidth, int fontSize, int lineSpacing) {
  String[] wordsArray;
  String tempString = "";
  int numLines = 0;
  float textHeight;
 
  wordsArray = split(string, " ");
 
  for (int i=0; i < wordsArray.length; i++) {
    if (textWidth(tempString + wordsArray[i]) < specificWidth) {
 tempString += wordsArray[i] + " ";
    }
    else {
 tempString = wordsArray[i] + " ";
 numLines++;
    }
  }
   
  numLines++; //adds the last line
   
  textHeight = numLines * (textDescent() + textAscent() + lineSpacing);
  return(round(textHeight));
} 

void mousePressed() 
{
 for (int i = 0; i < num; i++) { 
   springs[i].pressed();
 }
}

void mouseReleased() 
{
 for (int i=0; i<num; i++) { 
   springs[i].released();
 }
}

class Spring 
{ 
 // Screen values 
 float xpos, ypos;
 float tempxpos, tempypos; 
 int size = 20; 
 boolean over = false; 
 boolean move = false; 

 // Spring simulation constants 
 float mass;       // Mass 
 float k = 0.2;    // Spring constant 
 float damp;       // Damping 
 float rest_posx;  // Rest position X 
 float rest_posy;  // Rest position Y 

 // Spring simulation variables 
 //float pos = 20.0; // Position 
 float velx = 0.0;   // X Velocity 
 float vely = 0.0;   // Y Velocity 
 float accel = 0;    // Acceleration 
 float force = 0;    // Force 

 Spring[] friends;
 int me;

 // Constructor
 Spring(float x, float y, int s, float d, float m, 
 float k_in, Spring[] others, int id) 
 { 
   xpos = tempxpos = x; 
   ypos = tempypos = y;
   rest_posx = x;
   rest_posy = y;
   size = s;
   damp = d; 
   mass = m; 
   k = k_in;
   friends = others;
   me = id;
 } 

 void update() 
 { 
   if (move) { 
     rest_posy = mouseY; 
     rest_posx = mouseX;
   } 

   force = -k * (tempypos - rest_posy);  // f=-ky 
   accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
   vely = damp * (vely + accel);         // Set the velocity 
   tempypos = tempypos + vely;           // Updated position 

   force = -k * (tempxpos - rest_posx);  // f=-ky 
   accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
   velx = damp * (velx + accel);         // Set the velocity 
   tempxpos = tempxpos + velx;           // Updated position 


   if ((over() || move) && !otherOver() ) { 
     over = true;
   } 
   else { 
     over = false;
   }
 } 

 // Test to see if mouse is over this spring
 boolean over() {
   float disX = tempxpos - mouseX;
   float disY = tempypos - mouseY;
   if (sqrt(sq(disX) + sq(disY)) < size/2 ) {
     return true;
   } 
   else {
     return false;
   }
 }

 // Make sure no other springs are active
 boolean otherOver() {
   for (int i=0; i<num; i++) {
     if (i != me) {
       if (friends[i].over == true) {
         return true;
       }
     }
   }
   return false;
 }

 void display() 
 { 
   if (over) { 
     fill(153);
   } 
   else { 
     fill(255);
   } 
   ellipse(tempxpos, tempypos, size, size);
 } 

 void pressed() 
 { 
   if (over) { 
     move = true;
   } 
   else { 
     move = false;
   }
 } 

 void released() 
 { 
   move = false; 
   rest_posx = xpos;
   rest_posy = ypos;
 }
}

